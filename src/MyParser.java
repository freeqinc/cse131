//---------------------------------------------------------------------
// CSE 131 Reduced-C Compiler Project
// Copyright (C) 2008-2015 Garo Bournoutian and Rick Ord
// University of California, San Diego
//---------------------------------------------------------------------

import STO.*;
import java_cup.runtime.*;

import scope.*;
import types.*;
import operators.*;

import java.util.Vector;

class MyParser extends parser
{
	private Lexer m_lexer;
	private ErrorPrinter m_errors;
	private boolean m_debugMode;
	private int m_nNumErrors;
	private String m_strLastLexeme;
	private boolean m_bSyntaxError = true;
	private int m_nSavedLineNum;
	private int loopLevel = 0;

	private final static boolean PRINT_1 = !true;

	private SymbolTable m_symtab;
	private boolean m_inStruct = false;
	private String m_currStructId = "";
	private StructdefSTO m_currStruct = null;
	private AssemblyCodeGenerator m_asGenerator;
	private FuncSTO m_bufferFunc;

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------

	public MyParser(Lexer lexer, ErrorPrinter errors, boolean debugMode)
	{
		m_lexer = lexer;
		m_symtab = new SymbolTable();
		m_errors = errors;
		m_debugMode = debugMode;
		m_nNumErrors = 0;
		m_asGenerator = new AssemblyCodeGenerator("rc.s");
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean Ok()
	{
		return m_nNumErrors == 0;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Symbol scan()
	{
		Token t = m_lexer.GetToken();

		//	We'll save the last token read for error messages.
		//	Sometimes, the token is lost reading for the next
		//	token which can be null.
		m_strLastLexeme = t.GetLexeme();

		switch (t.GetCode())
		{
			case sym.T_ID:
			case sym.T_ID_U:
			case sym.T_STR_LITERAL:
			case sym.T_FLOAT_LITERAL:
			case sym.T_INT_LITERAL:
				return new Symbol(t.GetCode(), t.GetLexeme());
			default:
				return new Symbol(t.GetCode());
		}
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void syntax_error(Symbol s)
	{
	}

	public void openLoop() {
		loopLevel += 1;
		m_asGenerator.openLoop();
	}
	public void closeLoop() {
		loopLevel -= 1;
		m_asGenerator.closeLoop();
	}
	public boolean inLoop() { return loopLevel > 0; }

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void report_fatal_error(Symbol s)
	{
		m_nNumErrors++;
		if (m_bSyntaxError)
		{
			m_nNumErrors++;

			//	It is possible that the error was detected
			//	at the end of a line - in which case, s will
			//	be null.  Instead, we saved the last token
			//	read in to give a more meaningful error
			//	message.
			m_errors.print(Formatter.toString(ErrorMsg.syntax_error, m_strLastLexeme));
		}
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void unrecovered_syntax_error(Symbol s)
	{
		report_fatal_error(s);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void DisableSyntaxError()
	{
		m_bSyntaxError = false;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void EnableSyntaxError()
	{
		m_bSyntaxError = true;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public String GetFile()
	{
		return m_lexer.getEPFilename();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public int GetLineNum()
	{
		return m_lexer.getLineNumber();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void SaveLineNum()
	{
		m_nSavedLineNum = m_lexer.getLineNumber();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public int GetSavedLineNum()
	{
		return m_nSavedLineNum;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoProgramStart()
	{
		// Opens the global scope.
		m_symtab.openScope();
	}

	void startGenBuffer() {
		m_asGenerator.startBuffer();
	}

	void writeGenBuffer() {
		m_asGenerator.writeBuffer();
	}

	void stopGenBuffer() {
		m_asGenerator.stopBuffer();
	}

	void OpenStaticDecl(String id) {
		m_symtab.setStaticDecl(id);
	}

	void CloseStaticDecl() {
		m_symtab.setStaticDecl(null);
	}

	AssemblyCodeGenerator getAssemblyGen() { return m_asGenerator; }

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoProgramEnd()
	{
		m_asGenerator.doDtorTeardowns_G();
		m_symtab.closeScope();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------

	STO DoDesignator1_Star(STO sto) {
		if (sto instanceof ErrorSTO) return sto;

		STO stoCopy = sto;
		// if is nullpointer
		if (sto.getType() instanceof NullPointerType) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error15_Nullptr);
			return new ErrorSTO(sto.getName());
		}

		if (!(sto.getType() instanceof PointerType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error15_Receiver, sto.getType().getName()));
			return new ErrorSTO(sto.getName());
		}


		sto = new VarSTO("*" + sto.getName(), ((PointerType) sto.getType()).deReference());

		if(sto.getType() instanceof ArrayType)
			sto.setNonModLValue();
		else
			sto.setModLValue();


		FuncSTO func = m_symtab.getFunc();
		if (m_symtab.inGlobalScope()) {
			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");

			func = m_bufferFunc;

			m_asGenerator.startBuffer();
		} else if (m_symtab.inStaticDecl()) {
			m_asGenerator.startBuffer();
		}

		m_asGenerator.doDesignatorStar(stoCopy, sto, func);

		return sto;
	}

	STO DoDesignator1_Ampersand(STO sto) {
		if (sto instanceof ErrorSTO) return sto;

		if (!sto.getIsAddressable()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error18_AddressOf, sto.getType().getName()));
			return new ErrorSTO(sto.getName());
		}

		PointerType pType = new PointerType();
		pType.setPointsTo(sto.getType());
		ExprSTO ret = new ExprSTO("&" + sto.getName(), pType);
		ret.setRValue();


		FuncSTO func = m_symtab.getFunc();
		if (m_symtab.inGlobalScope()) {
			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");

			func = m_bufferFunc;

			m_asGenerator.startBuffer();
		} else if (m_symtab.inStaticDecl()) {
			m_asGenerator.startBuffer();
		}

		m_asGenerator.doDesignatorAmpersand(sto, ret, func);

		return ret;
	}

	STO DoDesignator2_Arrow(STO sto, String id) {

		// if is nullpointer
		if (sto.getType() instanceof NullPointerType) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error15_Nullptr);
			return new ErrorSTO(sto.getName());
		}

		// check if pointer to struct
		if ((sto.getType() instanceof PointerType) && (((PointerType) sto.getType()).deReference() instanceof StructType)) {

		} else { // not pointer to a struct
			m_nNumErrors++;
			m_errors.print((Formatter.toString(ErrorMsg.error15_ReceiverArrow, sto.getType().getName())));
			return new ErrorSTO(sto.getName());
		}

		//VarSTO ret = new VarSTO(sto.getName(), ((PointerType) sto.getType()).deReference());



		return DoDesignator2_Dot(DoDesignator1_Star(sto), id);
	}


	STO DoDesignator2_Array(STO sto, STO expr)
	{
		if (expr instanceof ErrorSTO) return expr;
		if (sto instanceof ErrorSTO) return sto;

		Type preType = sto.getType();
		STO stoCopy = sto;

		// if is nullpointer
		if (preType instanceof NullPointerType) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error15_Nullptr);
			return new ErrorSTO(sto.getName());
		}

		// preceding bracket is not array or pointer type
		if (!(preType instanceof ArrayType) && !(preType instanceof PointerType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error11t_ArrExp, preType.getName()));
			return new ErrorSTO(sto.getName());
		}

		// if expression is not equivalent to int
		if (!isEquivalent(expr.getType(), new IntType())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error11i_ArrExp, expr.getType().getName()));
			return new ErrorSTO(sto.getName());
		}

		// if we have a pointer at hand
		if (preType instanceof PointerType) {

			sto = new VarSTO(sto.getName(), ((PointerType) preType).deReference());

		} else {
			// if index expr is constant and designator not pointer type, check bounds
			int upperBound = ((ArrayType) sto.getType()).getDimSize();
			int exprValue;
			if (!(preType instanceof PointerType) && (expr instanceof ConstSTO) && ((ConstSTO) expr).hasValue()) {
				exprValue = ((ConstSTO) expr).getIntValue();
				if (exprValue < 0 || (exprValue > upperBound - 1)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error11b_ArrExp, exprValue, upperBound));
					return new ErrorSTO(sto.getName());
				}
			}

			// if array, check if next is arraytype or other type
			if (preType instanceof ArrayType) {
				if (((ArrayType) preType).next() instanceof ArrayType) {
					sto = new VarSTO(sto.getName(), ((ArrayType) preType).next());
				} else if (((ArrayType) preType).next() instanceof StructType) {
					sto = new VarSTO(sto.getName(), ((ArrayType) preType).next());
				} else {
					sto = new ConstSTO(sto.getName(), ((ArrayType) preType).next());
				}
			}
		}

		if(sto.getType() instanceof ArrayType)
			sto.setNonModLValue();
		else
			sto.setModLValue();

		String name = sto.getName() + "[" + expr.getName() + "]";
		sto.setName(name);
		sto.setReference();

		FuncSTO currFunc = m_symtab.getFunc() != null ? m_symtab.getFunc() : m_bufferFunc;

		if (m_symtab.inGlobalScope()) {
			m_asGenerator.startBuffer();

			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");

			currFunc = m_bufferFunc;
		} else if (m_symtab.inStaticDecl()) {
			m_asGenerator.startBuffer();
		}

		m_asGenerator.doDesignatorBracket(stoCopy, expr, sto, currFunc);

		sto.setArrayParent(stoCopy);
		return sto;
	}

	STO DoDesignator2_Dot(STO sto, String strID)
	{
		if (sto instanceof ErrorSTO) return sto;


		// Good place to do the struct checks
		// check if left is a struct
		if (!(sto.getType() instanceof StructType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error14t_StructExp, sto.getType().getName()));
			return new ErrorSTO(sto.getName());
		}

		// check if struct has member
		Scope structScope = ((StructType) sto.getType()).getScope();
		STO ret = structScope.accessLocal(strID);
		boolean isRef = sto.isReference();



		//findOverloadedFunction
		if (ret == null) {
			m_nNumErrors++;
			if (sto.isThis())
				m_errors.print(Formatter.toString(ErrorMsg.error14c_StructExpThis, strID));
			else
				m_errors.print(Formatter.toString(ErrorMsg.error14f_StructExp, strID, sto.getType().getName()));

			return new ErrorSTO(sto.getName());
		}


		String name = sto.getName() + "." + strID;

		if (ret instanceof FuncSTO) {

			// Set all funcs
			Vector<STO> funclist= structScope.accessLocalList(strID);
			for (int i = 0; i < funclist.size(); i++) {
				funclist.get(i).setBelongsTo(sto);
				((FuncSTO)funclist.get(i)).setMemberOf(((StructType) sto.getType()).getId());
			}

		} else {
			ret = new VarSTO(name, ret.getType());
			ret.setReference();
			m_asGenerator.doDesignatorDot(strID, sto, ret, m_symtab.getFunc());
		}


		ret.setBelongsTo(sto);

		return ret;
	}


	STO DoSizeOfSTO(STO sto) {
		if (sto instanceof ErrorSTO) return sto;

		if (!sto.getIsAddressable()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error19_Sizeof);
			return new ErrorSTO(sto.getName());
		}

		ConstSTO ret = new ConstSTO("sizeof(" + sto.getType().getName() + ")", new IntType(), sto.getType().getSize());
		ret.setRValue();

		// System.out.println("DoSizeOfSto " + sto.getName() + ": " + ret.getIntValue());
		return ret;
	}

	STO DoSizeOfType(Type type) {


		ConstSTO ret = new ConstSTO("sizeof(" + type.getName()+ ")", new IntType(), type.getSize());
		ret.setReference();

		return ret;
	}

	STO DoSizeOfTypeArray(Type type, Vector<STO> arrayList) {

		int totalSize = 1;

		for (int i = 0; i < arrayList.size(); i ++) {
			// System.out.print(arrayList.elementAt(i).getName() + " ");
			STO curr = arrayList.elementAt(i);

			if (curr instanceof ErrorSTO) break;

			// not equivalent to int
			if (!(curr.getType() instanceof IntType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error10i_Array, curr.getType().getName()));
				return new ErrorSTO(type.getName());
			}
			// not known at compile time
			else if (!((curr instanceof ConstSTO) && ((ConstSTO) curr).hasValue())) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error10c_Array);
				return new ErrorSTO(type.getName());
			}
			// index not greater than 0
			else if (((ConstSTO) curr).getIntValue() < 1) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error10z_Array,((ConstSTO) curr).getIntValue()));
				return new ErrorSTO(type.getName());
			}
			else {
				// update arrayType to next
				int dimSize = ((ConstSTO) curr).getIntValue();
				totalSize *= dimSize;
			}
		}

		totalSize *= type.getSize();

		ConstSTO ret = new ConstSTO("sizeof(" + type.getName() + ")", new IntType(), totalSize);
		ret.setRValue();

		// System.out.println("DoSizeOfTypeArray " + type.getName() + ": " + ret.getIntValue());
		return ret;
	}

	STO DoTypeCast(Type type, STO sto) {
		if (sto instanceof ErrorSTO) return sto;


		if (!((sto.getType() instanceof BasicType) || (sto.getType() instanceof PointerType)) || (sto.getType() instanceof NullPointerType)  )  {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error20_Cast, sto.getType().getName(), type.getName()));
			return new ErrorSTO(sto.getName());
		}


		STO ret = null;

//		if (type instanceof PointerType) {
//			ret.setType(type);


		if (sto instanceof ConstSTO && type instanceof BasicType) {
			if (type instanceof BoolType) {

				if (((ConstSTO) sto).hasValue())
					ret = new ConstSTO(sto.getName(), type, ((ConstSTO) sto).getBoolValue());
				else
					ret = new VarSTO(sto.getName(), type);

			} else if (type instanceof FloatType) {

				if (((ConstSTO) sto).hasValue())
					ret = new ConstSTO(sto.getName(), type, ((ConstSTO) sto).getFloatValue());
				else
					ret = new VarSTO(sto.getName(), type);

			} else if (type instanceof IntType) {

				if (((ConstSTO) sto).hasValue())
					ret = new ConstSTO(sto.getName(), type, ((ConstSTO) sto).getIntValue());
				else
					ret = new VarSTO(sto.getName(), type);

			} else {
				ret = new ConstSTO(sto.getName(), type);
			}
		} else {
			ret = new VarSTO(sto.getName(), type);
		}


		/*
		if (sto instanceof ConstSTO) {
			if (!(type instanceof BasicType || type instanceof PointerType) || !(sto.getType() instanceof BasicType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error20_Cast, sto.getType().getName(), type.getName()));
				return new ErrorSTO(sto.getName());
			}

			if (type instanceof BoolType) {
				ret = new ConstSTO(sto.getName(), type, ((ConstSTO) sto).getBoolValue());
			} else if (type instanceof FloatType) {
				ret = new ConstSTO(sto.getName(), type, ((ConstSTO) sto).getFloatValue());
			} else if (type instanceof IntType) {
				ret = new ConstSTO(sto.getName(), type, ((ConstSTO) sto).getIntValue());
			} else if (type instanceof  PointerType) {
				((PointerType) type).setPointsTo(sto.getType());
				ret = new VarSTO(sto.getName(), type);
			}

		} else



		/*if (sto instanceof ExprSTO) {
			ret = new ExprSTO(sto.getName(), type);
		} else if (sto instanceof VarSTO) {
			ret = new VarSTO(sto.getName(), type);
		} else  {
			ret = new VarSTO(sto.getName(), type);
		}*/


		FuncSTO currFunc = m_symtab.getFunc() != null ? m_symtab.getFunc() : m_bufferFunc;

		if (m_symtab.inGlobalScope()) {
			m_asGenerator.startBuffer();

			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");

			currFunc = m_bufferFunc;
		} else if (m_symtab.inStaticDecl()) {
			m_asGenerator.startBuffer();
		}


		ret.setName("(" + type.getName() + ")" + sto.getName());
		m_asGenerator.doDesignatorCast(type, sto, ret, currFunc);
		ret.setRValue();

		return ret;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	Type DoDecoratedPointerType(Type baseType, Vector<String> pointers) {
		PointerType ret = new PointerType();
		Type copy = ret;

		if (pointers != null) {
			for (int i = 1; i < pointers.size(); i++) {
				ret.setPointsTo(new PointerType());
				ret = (PointerType) ret.deReference();
			}
		}


//		if (m_inStruct && (baseType instanceof StructType)) {
//			((StructType) baseType).setScope(m_symtab.peekScope());
//			ret.setPointsTo(baseType);
//		} else {
			ret.setPointsTo(baseType);
//		}

		return copy;
	}

	void DoAutoVarDecl(String id, STO expr, boolean optStatic) {
		DoVarDecl(id, expr.getType(), expr, optStatic);
	}

	void DoAutoConstDecl(String id, STO expr, boolean optStatic) {
		DoConstDecl(expr.getType(), id, expr, optStatic);
	}


	void DoNewStmt(STO sto, Vector<STO> args) {
		// initial checks
		if (sto instanceof ErrorSTO) return;
		if (!sto.isModLValue()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error16_New_var);
			return;
		}

		if (!(sto.getType() instanceof PointerType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error16_New, sto.getType().getName()));
			return;
		}

		m_asGenerator.doNewStmt(sto);


		if (args != null) {
			if (args.size() > 0 && args.elementAt(0).getName().equals("empty ctor call")) {
				if (!((((PointerType) sto.getType()).deReference()) instanceof StructType)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error16b_NonStructCtorCall, sto.getType().getName()));
					return;
				}

				StructType dereffed = ((StructType) ((PointerType) sto.getType()).deReference());

				DoCtorCalls(sto, dereffed.getId(), dereffed.getConstructors(), new Vector<STO>(), dereffed.getScope());

				return;
			}


			if (!((((PointerType) sto.getType()).deReference()) instanceof StructType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error16b_NonStructCtorCall, sto.getType().getName()));
				return;
			}
		}

		if (((((PointerType) sto.getType()).deReference()) instanceof StructType)) {
			StructType dereffed = ((StructType) ((PointerType) sto.getType()).deReference());

			DoCtorCalls(sto, dereffed.getId(), dereffed.getConstructors(), args, dereffed.getScope());
		}

	}

	void DoCtorCalls(STO sto, String id, Vector<STO> ctors, Vector<STO> args, Scope structScope) {
		if (ctors.size() == 1 && ctors.elementAt(0) instanceof FuncSTO) {
			STO res = tryNonOverloadedCall(((FuncSTO) ctors.elementAt(0)).getParams() , args);
			if (res instanceof ErrorSTO) return;
		} else if (ctors.size() > 1) {
			STO matched = findOverloadedFunction(id, args, structScope);
			if (matched instanceof ErrorSTO) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error9_Illegal, id));
				return;
			}
		}

		STO res = DoDesignator2_Arrow(sto, id);
		DoFuncCall(res, args);

	}


	void DoDeleteStmt(STO sto) {
		// initial checks
		if (sto instanceof ErrorSTO) return;
		if (!sto.isModLValue()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error16_Delete_var);
			return;
		}

		if (!(sto.getType() instanceof PointerType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error16_Delete, sto.getType().getName()));
			return;
		}

		if (((PointerType) sto.getType()).deReference() instanceof StructType) {
			String id = ((StructType) ((PointerType) sto.getType()).deReference()).getId();

			if (((StructType) ((PointerType) sto.getType()).deReference()).getScope().access("~" + id) != null) {
				STO res = DoDesignator2_Arrow(sto, "~" + id);
				DoFuncCall(res, null);
			} else {
				FuncSTO func = m_symtab.getFunc();

				if (func == null) {
					if (m_bufferFunc == null)
						m_bufferFunc = new FuncSTO("buffer");

					func = m_bufferFunc;
				}

				m_asGenerator.callDtor(sto, func, id);
			}
		}

		m_asGenerator.doDeleteStmt(sto);


	}

	void DoStructInst(String id, Type structType, Vector<STO> args, boolean optStatic) {

		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
			return;
		}

		if (args != null && args.size() > 0 && args.elementAt(0).getName().equals("empty ctor call")) {
			args.remove(0);
		}

		Vector<STO> ctors = null;
		STO match = null;

		if(!(structType instanceof StructType)) {

		} else {

			if (((StructType) structType).getId().equals(m_currStructId)) {
				StructType temp = new StructType();

				Vector<Scope> tempStack = new Vector<Scope>();
				while (m_symtab.accessLocal(m_currStructId) == null) {
					tempStack.addElement(m_symtab.popScope());
				}

				temp.setScope(m_symtab.peekScope());
				temp.setId(m_currStructId);
				ctors = temp.getConstructors();

				while (tempStack.size() > 0) {
					m_symtab.pushScope(tempStack.remove(tempStack.size() - 1));
				}

			}
			else {
				ctors = ((StructType) structType).getConstructors();
			}

			if (ctors.size() == 1) { // only one ctor
				tryNonOverloadedCall(((FuncSTO) ctors.elementAt(0)).getParams(), args);

				match = ctors.get(0);
			} else { // overloaded

				match = findCtor(ctors, args);
				if (match instanceof ErrorSTO) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error9_Illegal, ((StructType) structType).getStructName()));
				}
			}

		}


		((FuncSTO)match).setMemberOf(((StructType)structType).getId());

		STO var = new VarSTO(id, structType);
//		var.setReference();


		//----------------
		// ASSEMBLY GEN
		//----------------



		// Global Scope or Static
		if (optStatic || m_symtab.inGlobalScope()) {

			var.setBase("%g0");
			var.setOffset(id);

			m_asGenerator.startBuffer();

			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");
			if (m_symtab.inStaticDecl() && !m_symtab.inGlobalScope()) {
				var.setOffset(m_asGenerator.getFuncName(m_symtab.getFunc()) + "." + var.getName());
			}
			m_asGenerator.doStructCtorCall((StructType) structType, var, (FuncSTO) match, args, m_bufferFunc);

			m_asGenerator.stopBuffer();

			m_asGenerator.doUninitGlobalStatic(var, optStatic);
			if (optStatic && !m_symtab.inGlobalScope()) {
				m_asGenerator.doStaticStructInst(var, m_symtab.getFunc());
			} else {
				m_asGenerator.doStructInst(var, m_bufferFunc);
			}


			m_bufferFunc = null;
		} else {

			if (m_symtab.getFunc() != null) {
				m_symtab.getFunc().allocateLocalVar(var);
			}

			m_asGenerator.doStructCtorCall((StructType) structType, var, (FuncSTO) match, args, m_symtab.getFunc());
		}

		m_symtab.insert(var);
	}

	void DoStructArrayInst(String id, Type structType, Vector<STO> args, Vector<STO> arrayList, boolean optStatic) {
		DoArrayDecl(id, structType, arrayList, false, args);

		STO sto = m_symtab.access(id);


		if (args != null && args.size() > 0 && args.elementAt(0).getName().equals("empty ctor call")) {
			args.remove(0);
		}

		if(!(structType instanceof StructType)) {

		} else {
			Vector<STO> ctors = ((StructType) structType).getConstructors();

			STO arrayDeclResult = m_symtab.peek();

			// shortcut if there was an issue
			if (arrayDeclResult.getType() instanceof ErrorType) return;

			if (ctors.size() == 1) { // only one ctor
				tryNonOverloadedCall(((FuncSTO) ctors.elementAt(0)).getParams(), args);
			} else { // overloaded
				STO match = findCtor(ctors, args);
				if (match instanceof ErrorSTO) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error9_Illegal, ((StructType) structType).getStructName()));
				}
			}
		}


		//----------------
		// ASSEMBLY GEN
		//----------------



		// Global Scope or Static
		if (optStatic || m_symtab.inGlobalScope()) {

			m_asGenerator.stopBuffer();


			m_asGenerator.doUninitGlobalStatic(sto, optStatic);

			if (optStatic && !m_symtab.inGlobalScope()) {
				m_asGenerator.doStaticStructArrayInst(sto, m_symtab.getFunc());
			} else {
				if (m_bufferFunc == null)
					m_bufferFunc = new FuncSTO("buffer");

				m_asGenerator.doStructArrayInst(sto, m_bufferFunc);

				m_bufferFunc = null;

			}

		// Local Scope
		} else {


		}
	}

	void DoVarDecl(String id, Type t, STO expr, boolean optStatic) {
		if (m_symtab.accessLocal(id) != null) {
			m_nNumErrors++;

			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
			return;
		}

		if (expr instanceof ErrorSTO) {

		} else {
			if (expr != null && !isAssignable(t, expr.getType())) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error8_Assign, expr.getType().getName(), t.getName()));
			}
		}

		VarSTO sto = new VarSTO(id);
		if (t != null) {
			sto = new VarSTO(id, t);
		}

		//----------------
		// ASSEMBLY GEN
		//----------------



		// Global Scope or Static
		if (optStatic || m_symtab.inGlobalScope()) {

			sto.setBase("%g0");
			sto.setOffset(id);

			m_asGenerator.stopBuffer();

			// Initialization
			if (expr != null) {
				// Immediate value
				if (expr instanceof ConstSTO && ((ConstSTO) expr).hasValue()) {
					m_asGenerator.doInitGlobalStatic(sto, (ConstSTO)expr, optStatic);
				// Buffer value
				} else {

					if (m_bufferFunc == null)
						m_bufferFunc = new FuncSTO("buffer");

					m_asGenerator.doUninitGlobalStatic(sto, optStatic);
					if (optStatic && !m_symtab.inGlobalScope()) {
						m_asGenerator.doInternalStaticFlush(sto, expr, m_symtab.getFunc());
					} else {
						m_asGenerator.doAssignFlush(sto, expr, m_bufferFunc);
					}

					m_bufferFunc = null;
				}
			// Declaration
			} else {
				m_asGenerator.doUninitGlobalStatic(sto, optStatic);
			}
		// Local Scope
		} else {

			if (m_symtab.getFunc() != null) {
				m_symtab.getFunc().allocateLocalVar(sto);
			}

			// Initialization
			if (expr != null) {
				m_asGenerator.doLocalVariable(sto, expr, optStatic, m_symtab.getFunc());
			}
		}

		m_symtab.insert(sto);
	}

	STO DoArrayParam(String id, Type t, Vector<STO> arrayList) {


		ArrayType arrType = new ArrayType();
		ArrayType insertType = arrType;

		for (int i = 0; i < arrayList.size(); i ++) {
			// System.out.print(arrayList.elementAt(i).getName() + " ");
			STO curr = arrayList.elementAt(i);

			// not equivalent to int
			if (!(curr.getType() instanceof IntType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error10i_Array, curr.getType().getName()));
				return new ErrorSTO("not equiv to int");
			}
			// not known at compile time
			if (!((curr instanceof ConstSTO) && ((ConstSTO) curr).hasValue())) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error10c_Array);
				return new ErrorSTO("not known at compile time");
			}

			// index not greater than 0
			if (((ConstSTO) curr).getIntValue() < 1) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error10z_Array,((ConstSTO) curr).getIntValue()));
				return new ErrorSTO("index not graeter than 0");
			}

			// update arrayType to next
			int dimSize = ((ConstSTO) curr).getIntValue();
			arrType.setDimSize(dimSize);
			if (i < arrayList.size() - 1) {
				arrType.setNext(new ArrayType());
				arrType = (ArrayType)arrType.next();
			} else {
				arrType.setNext(t);
			}
		}

		VarSTO sto = new VarSTO(id, insertType);
		sto.setNonModLValue();
		return sto;
	}

	void DoArrayDecl(String id, Type t, Vector<STO> arrayList, boolean optStatic, Vector<STO> args) {
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
		}

		ArrayType arrType = new ArrayType();
		ArrayType insertType = arrType;

		STO sto = new VarSTO(id, insertType);
		sto.setNonModLValue();

		for (int i = 0; i < arrayList.size(); i ++) {
			STO curr = arrayList.elementAt(i);

			if (curr instanceof ErrorSTO) break;

			// not equivalent to int
			if (!(curr.getType() instanceof IntType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error10i_Array, curr.getType().getName()));
				sto = new ErrorSTO(id);
				break;
			}
			// not known at compile time
			else if (!((curr instanceof ConstSTO) && ((ConstSTO) curr).hasValue())) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error10c_Array);
				sto = new ErrorSTO(id);
				break;
			}
			// index not greater than 0
			else if (((ConstSTO) curr).getIntValue() < 1) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error10z_Array,((ConstSTO) curr).getIntValue()));
				sto = new ErrorSTO(id);
				break;
			}
			else {
				// update arrayType to next
				int dimSize = ((ConstSTO) curr).getIntValue();
				arrType.setDimSize(dimSize);
				if (i < arrayList.size() - 1) {
					arrType.setNext(new ArrayType());
					arrType = (ArrayType) arrType.next();
				} else {
					arrType.setNext(t);
				}
			}

			if (t instanceof StructType) {
				FuncSTO func = m_symtab.getFunc();

				if (m_symtab.inGlobalScope()) {
					sto.setBase("%g0");
					sto.setOffset(sto.getName());

					if (m_bufferFunc == null)
						m_bufferFunc = new FuncSTO("buffer");

					func = m_bufferFunc;

					m_asGenerator.startBuffer();

				} else if (m_symtab.inStaticDecl()) {
					sto.setOffset(m_asGenerator.getFuncName(m_symtab.getFunc()) +  "." + sto.getName());
					sto.setBase("%g0");
				} else {
					func.allocateLocalVar(sto);
				}

				for (int j = 0; j < ((ConstSTO) curr).getIntValue(); j++) {
					STO des2 = DoDesignator2_Array(sto, new ConstSTO(j + "", new IntType(), j));
					des2.setReference();
					DoFuncCall(DoDesignator2_Dot(des2, ((StructType) t).getId()), args);
				}
			}
		}


		//----------------
		// ASSEMBLY GEN
		//----------------

		if (!(t instanceof StructType)) {


			// Global Scope or Static
			if (optStatic || m_symtab.inGlobalScope()) {

				sto.setBase("%g0");
				sto.setOffset(id);

				m_asGenerator.doUninitGlobalStatic(sto, optStatic);

				// Local Scope
			} else {
				if (m_symtab.getFunc() != null) {
					m_symtab.getFunc().allocateLocalVar(sto);
				}

			}
		}

		m_symtab.insert(sto);

	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoExternDecl(String id, Type t)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
		}


		VarSTO sto = new VarSTO(id);
		if (t != null) {
			sto = new VarSTO(id, t);
		}

		sto.setBase("%g0");
		sto.setOffset(id);

		m_symtab.insert(sto);
	}

	void DoExternArrayDecl(String id, Type t, Vector<STO> arrayList) {
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
		}

		ArrayType arrType = new ArrayType();
		ArrayType insertType = arrType;

		STO sto = new VarSTO(id, insertType);
		sto.setNonModLValue();

		for (int i = 0; i < arrayList.size(); i ++) {
			STO curr = arrayList.elementAt(i);

			int dimSize = ((ConstSTO) curr).getIntValue();
			arrType.setDimSize(dimSize);
			if (i < arrayList.size() - 1) {
				arrType.setNext(new ArrayType());
				arrType = (ArrayType) arrType.next();
			} else {
				arrType.setNext(t);
			}
		}

		sto.setBase("%g0");
		sto.setOffset(id);

		m_symtab.insert(sto);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoConstDecl(Type t, String id, STO expr, boolean optStatic)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
		}

		if (expr instanceof ErrorSTO) {
			return;
		}

		if (!((expr instanceof ConstSTO) && ((ConstSTO) expr).hasValue())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error8_CompileTime, id));
		} else if (!isAssignable(t, expr.getType())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error8_Assign, expr.getType().getName(), t.getName()));
		} else {
			ConstSTO sto = new ConstSTO(id, t, ((ConstSTO) expr).getValue());
			m_symtab.insert(sto);


			//----------------
			// ASSEMBLY GEN
			//----------------

			// Global Scope
			if (m_symtab.inGlobalScope()) {

				sto.setBase("%g0");
				sto.setOffset(id);

				// Initialization
				m_asGenerator.doInitGlobalStatic(sto, (ConstSTO)expr, optStatic);
			} else {

				m_symtab.getFunc().allocateLocalVar(sto);

				m_asGenerator.doLocalVariable(sto, expr, optStatic, m_symtab.getFunc());

			}
		}


	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFuncDecl_1(String id, Type returnType, boolean optRef)
	{


		// if it's a ctor/dtor
		if (id.equals(id.toUpperCase())) {
			if (id.charAt(0) == '~') { // DTOR
				if (!id.equals("~" + m_currStructId)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error13b_Dtor, id, m_currStructId));
				}
			} else { // CTOR
				if (!id.equals(m_currStructId)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error13b_Ctor, id, m_currStructId));
				}
			}
		}

		if (m_symtab.accessLocal(id) != null && !(m_symtab.accessLocal(id) instanceof FuncSTO))
		{
			m_nNumErrors++;
			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
		}


		FuncSTO sto = new FuncSTO(id);
		sto.setReturnType(returnType);

		// if overloaded
		if (m_symtab.accessLocal(id) != null && (m_symtab.accessLocal(id) instanceof FuncSTO)) {
			((FuncSTO )m_symtab.accessLocal(id)).setOverloaded();
			sto.setOverloaded();
		}

		if (optRef) {
			sto.setReturnsByReference();
			sto.setModLValue();
		}



		m_symtab.insert(sto);
		m_symtab.openScope();
		m_symtab.setFunc(sto);

		//----------------
		// ASSEMBLY GEN
		//----------------

	}


	void DoExternFuncDecl_1(String id, Type returnType, boolean optRef)
	{


		// if it's a ctor/dtor
		if (id.equals(id.toUpperCase())) {
			if (id.charAt(0) == '~') { // DTOR
				if (!id.equals("~" + m_currStructId)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error13b_Dtor, id, m_currStructId));
				}
			} else { // CTOR
				if (!id.equals(m_currStructId)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error13b_Ctor, id, m_currStructId));
				}
			}
		}

		if (m_symtab.accessLocal(id) != null && !(m_symtab.accessLocal(id) instanceof FuncSTO))
		{
			m_nNumErrors++;
			String error = m_inStruct ? ErrorMsg.error13a_Struct : ErrorMsg.redeclared_id;
			m_errors.print(Formatter.toString(error, id));
		}


		FuncSTO sto = new FuncSTO(id);
		sto.setReturnType(returnType);

		// if overloaded
		if (m_symtab.accessLocal(id) != null && (m_symtab.accessLocal(id) instanceof FuncSTO)) {
			((FuncSTO )m_symtab.accessLocal(id)).setOverloaded();
			sto.setOverloaded();
		}

		if (optRef) {
			sto.setReturnsByReference();
			sto.setModLValue();
		}

		sto.setExtern();

		m_symtab.insert(sto);
		m_symtab.openScope();
		m_symtab.setFunc(sto);

		//----------------
		// ASSEMBLY GEN
		//----------------

	}

	void DoCtor_2(String id, Vector<STO> params) {
		if (m_symtab.accessLocal("~" + id) == null) {
			FuncSTO sto = (FuncSTO)m_symtab.accessLocal(id);

			m_asGenerator.doStructCtor_2(id, sto, params);
		}
	}

	void DoDefaultCtor(String id) {

		// need default ctor
		if (m_symtab.accessLocal(id) == null) {
			FuncSTO sto = new FuncSTO(id);
			sto.setReturnType(new VoidType());
			m_symtab.insert(sto);

			Vector<STO> params = new Vector<STO>();


			m_asGenerator.doStructCtor(id, sto, params);
			// m_asGenerator.doStructCtor_2(id, sto, params);
		}
	}

	STO DoVoidReturnStmt() {
		FuncSTO func = m_symtab.getFunc();

		if (!(func.getReturnType() instanceof VoidType)) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error6a_Return_expr);
			return new ErrorSTO(func.getName());
		}

		m_asGenerator.doVoidReturnStmt(func);

		return null;
	}

	STO DoReturnStmt(STO returnExpr) {
		if (returnExpr instanceof ErrorSTO) return returnExpr;

		FuncSTO func = m_symtab.getFunc();
		Type returnType = returnExpr.getType();
		Type funcType = func.getReturnType();

		// if function returns by value
		if (!func.returnsByReference()) {
			if (!isAssignable(funcType, returnType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error6a_Return_type, returnType.getName(), funcType.getName()));
				return new ErrorSTO(func.getName());
			}
		} else { // if function returns by reference
			// not equivalent
			if (!isEquivalent(funcType, returnType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error6b_Return_equiv, returnType.getName(), funcType.getName()));
				return new ErrorSTO(func.getName());
			}

			// not modLValue
			if (!returnExpr.isModLValue()) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6b_Return_modlval);
				return new ErrorSTO(func.getName());
			}
		}

		m_asGenerator.doReturnStmt(func, returnExpr);


		return null;
	}

	STO DoReturnCheck(Vector<String> vec) {

		FuncSTO func = m_symtab.getFunc();

		if (!(func.getReturnType() instanceof VoidType)) {
			if (vec == null || !vec.contains("ReturnStmt")) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6c_Return_missing);

				return new ErrorSTO(func.getName());
			}
		}

		return null;
	}

	void DoReadStmt(STO sto) {
		m_asGenerator.doCin(sto);
	}

	void DoWriteStmt(Vector<STO> writeList) {
	}

	void DoWritePair(STO expr) {
		if (expr.getType() instanceof StringType)
			m_asGenerator.doStringCout((ConstSTO)expr);
		else
			m_asGenerator.doCout(expr);
	}

	void DoEndLine() {
		m_asGenerator.doEndLine();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFuncDecl_2()
	{

		m_symtab.closeScope();

		m_asGenerator.doFuncDecl_2(null, m_symtab.getFunc());

		m_symtab.setFunc(null);
	}

	void DoExternFuncDecl_2()
	{

		m_symtab.closeScope();

		m_symtab.setFunc(null);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	boolean hasSameParams(FuncSTO a, FuncSTO b) {
		Vector <STO> aParams = a.getParams();
		Vector <STO> bParams = b.getParams();

		int aSize = 0;
		int bSize = 0;

		if (aParams != null) aSize = aParams.size();
		if (bParams != null) bSize = bParams.size();

		if (aSize != bSize) return false;
		if (aSize == 0 && bSize == 0) return true;

		for (int i = 0; i < aParams.size(); i++) {
			Type aType = aParams.elementAt(i).getType();
			Type bType = bParams.elementAt(i).getType();
			// System.out.println(aType.getName() + " " + bType.getName());

			if (!aType.getClass().equals(bType.getClass())) return false;

			if (aType instanceof PointerType && bType instanceof PointerType) {
				if (!aType.getName().equals(bType.getName())) return false;
			}

			if (aType instanceof StructType && bType instanceof StructType) {
				if (!aType.getName().equals(bType.getName())) return false;
			}

			if (aType instanceof ArrayType && bType instanceof ArrayType) {
				if (!aType.getName().equals(bType.getName())) return false;
			}
		}

		return true;
	}

	boolean hasSameParamsExact(FuncSTO a, FuncSTO b) {
		Vector <STO> aParams = a.getParams();
		Vector <STO> bParams = b.getParams();

		int aSize = 0;
		int bSize = 0;

		if (aParams != null) aSize = aParams.size();
		if (bParams != null) bSize = bParams.size();

		if (aSize != bSize) return false;
		if (aSize == 0 && bSize == 0) return true;

		for (int i = 0; i < aParams.size(); i++) {
			Type aType = aParams.elementAt(i).getType();
			Type bType = bParams.elementAt(i).getType();
			// System.out.println(aType.getName() + " " + bType.getName());

			if (!aType.getClass().equals(bType.getClass()))
				return false;
			else if (aType instanceof ArrayType && bType instanceof ArrayType) {
				if (!aType.getName().equals(bType.getName())) return false;
				return true;
			} else if (aType instanceof PointerType && bType instanceof PointerType) {
				if (!((PointerType) aType).isEqualToPointer(bType)) return false;
				return true;
			}
			else if (aParams.elementAt(i).isReference() && !bParams.elementAt(i).isModLValue())
				return false;


		}

		return true;
	}


	void DoFormalParams(Vector<STO> params, String id)
	{

		if (m_symtab.getFunc() == null)
		{
			m_nNumErrors++;
			m_errors.print ("internal: DoFormalParams says no proc!");
		}

		boolean bad = false;


		FuncSTO func;
		func = m_symtab.getFunc();

		func.setParams(params);

		if (func.isOverloaded()) {
			m_symtab.closeScope();
			Vector <STO> funcList = m_symtab.accessLocalList(id);
			m_symtab.openScope();

			FuncSTO currFunc;
		    // System.out.println("OBSERRVING " + id);

			for (int i = 0; i < funcList.size() - 1; i++) {
				currFunc = (FuncSTO) funcList.elementAt(i);
				if (hasSameParams(currFunc, func)) {
					bad = true;
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error9_Decl, id));

					// if error, remove it
					m_symtab.closeScope();
					m_symtab.pop();
					m_symtab.openScope();
					break;
				}
			}
		}

		if (!bad && params != null) {
			for (int i = 0; i < params.size(); i++) {
				m_symtab.insert(params.elementAt(i));
				m_symtab.getFunc().allocateParam(params.get(i));
			}
		}


		//----------------
		// ASSEMBLY GEN
		//----------------

		m_asGenerator.doFuncDecl_1(id, func);
		m_asGenerator.doFormalParams(params);
	}


	void DoExternFormalParams(Vector<STO> params, String id)
	{

		if (m_symtab.getFunc() == null)
		{
			m_nNumErrors++;
			m_errors.print ("internal: DoFormalParams says no proc!");
		}

		boolean bad = false;


		FuncSTO func;
		func = m_symtab.getFunc();

		func.setParams(params);

		if (func.isOverloaded()) {
			m_symtab.closeScope();
			Vector <STO> funcList = m_symtab.accessLocalList(id);
			m_symtab.openScope();

			FuncSTO currFunc;
			// System.out.println("OBSERRVING " + id);

			for (int i = 0; i < funcList.size() - 1; i++) {
				currFunc = (FuncSTO) funcList.elementAt(i);
				if (hasSameParams(currFunc, func)) {
					bad = true;
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error9_Decl, id));

					// if error, remove it
					m_symtab.closeScope();
					m_symtab.pop();
					m_symtab.openScope();
					break;
				}
			}
		}

		if (!bad && params != null) {
			for (int i = 0; i < params.size(); i++) {
				m_symtab.insert(params.elementAt(i));
				m_symtab.getFunc().allocateParam(params.get(i));
			}
		}


		//----------------
		// ASSEMBLY GEN
		//----------------

	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoBlockOpen()
	{
		// Open a scope.
		m_symtab.openScope();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoBlockClose()
	{
		// Close a scope.
		m_symtab.closeScope();
	}

	void DoStructBlockOpen(String id) {
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		m_inStruct = true;
		m_symtab.openScope();

		m_currStructId = id;
		StructType t = new StructType();
		t.setId(id);
		m_currStruct = new StructdefSTO(id, t);

		m_asGenerator.doStructOpen((StructType) m_currStruct.getType());
	}

	void DoStructBlockClose(String id) {
		m_currStructId = "";
		m_currStruct = null;
		Scope scope = m_symtab.popScope();
		m_inStruct = false;

//		scope.printScope();
		DoStructdefDecl(id, scope);

		m_asGenerator.doStructClose();
	}

	void DoStructdefDecl(String id, Scope scope)
	{

		StructType sType = new StructType();
		sType.setScope(scope);
		sType.setId(id);
		StructdefSTO sto = new StructdefSTO(id, sType);
		m_symtab.insert(sto);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	boolean isAssignable(Type aType, Type bType) {
		// System.out.println("ASSIGNABLE? : " + aType.getName() + " " + bType.getName());

		// allow assignment of nullptr
		if ((aType instanceof PointerType) && (bType instanceof NullPointerType))
			return true;

		if (!aType.getClass().equals(bType.getClass())) {
			if (aType instanceof FloatType && bType instanceof IntType) {
				// something
			} else {
				return false;
			}
		}

		if (aType instanceof StructType) {
			if (aType.getName().equals(bType.getName()))
				return true;
			else
				return false;
		}

		if (aType instanceof ArrayType && bType instanceof ArrayType) {
			if (!aType.getName().equals(bType.getName())) return false;
		}

		if (aType instanceof PointerType) {

			if (!(((PointerType) aType).isEqualToPointer(bType)))
				return false;
		}

		return true;
	}

	boolean isEquivalent(Type aType, Type bType) {


		if (!aType.getClass().equals(bType.getClass())) {
			return false;
		}

		if (aType instanceof StructType) {
			if (aType.getName().equals(bType.getName()))
				return true;
			else
				return false;
		}

		if (aType instanceof ArrayType && bType instanceof ArrayType) {
			if (!aType.getName().equals(bType.getName())) return false;
		}

		if (aType instanceof PointerType && bType instanceof PointerType) {
			if (!(((PointerType) aType).isEqualToPointer(bType)))
				return false;
		}

		return true;
	}


	STO DoAssignExpr(STO stoDes, STO stoExpr)
	{

		if (stoExpr instanceof ErrorSTO) {
			return stoExpr;
		}

		if (stoDes instanceof ErrorSTO) {
			return stoDes;
		}

		Type a = stoDes.getType();
		Type b = stoExpr.getType();

		if (!stoDes.isModLValue())
		{
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error3a_Assign);

			if (PRINT_1) System.out.println(stoDes.getName());

			return new ErrorSTO(stoDes.getName());
		}

		if (!isAssignable(a, b)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error3b_Assign, b.getName(), a.getName()));
			return new ErrorSTO(stoDes.getName());
		}

		if (stoDes.getType() instanceof StructType) {
			m_asGenerator.doAssignCompositeExpr(stoDes, stoExpr, m_symtab.getFunc());
		} else {
			m_asGenerator.doAssignExpr(stoDes, stoExpr, m_symtab.getFunc());
		}

		String name = "(" + stoDes.getName() + ")=(" + stoExpr.getName() + ")";

		VarSTO ret = new VarSTO(name, stoDes.getType());
		if (stoDes.isReference())
			ret.setReference();
		ret.setBase(stoDes.getBase());
		ret.setOffset(stoDes.getOffset());
		ret.setModLValue();

		return ret;
	}

	STO DoArgAssignExpr(STO stoDes, STO stoExpr) {
		if (stoExpr instanceof ErrorSTO) {
			return stoExpr;
		}

		if (stoDes instanceof ErrorSTO) {
			return stoDes;
		}

		Type a = stoDes.getType();
		Type b = stoExpr.getType();

		// pass-by-value, check if assignable
		if (!stoDes.isReference()) {
			if (!isAssignable(a, b)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5a_Call, b.getName(), stoDes.getName(), a.getName()));
				return new ErrorSTO(stoDes.getName());
			}
		} else { // pass-by-reference check equivalence & MLV

			// check arg equivalence to param
			if(!isEquivalent(a, b)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5r_Call, b.getName(), stoDes.getName(), a.getName()));
				return new ErrorSTO(stoDes.getName());
			}

			// check that arg is MLV
			if (!stoExpr.isModLValue() && !(stoExpr.getType() instanceof ArrayType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5c_Call, stoDes.getName(), b.getName()));
				return new ErrorSTO("argument not a modlval");
			}
		}



		return stoDes;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO findCtor(Vector<STO> ctorList, Vector<STO> args) {
		FuncSTO tempFunc = new FuncSTO("temp");
		tempFunc.setParams(args);

		for (int i = 0; i < ctorList.size(); i++) {
			FuncSTO ctor = (FuncSTO)ctorList.elementAt(i);
			if (hasSameParamsExact(ctor, tempFunc)) {
				return ctor;
			}
		}

		return new ErrorSTO("illegal ctor");
	}

	STO findOverloadedFunction(String id, Vector<STO> args, Scope structScope) {
		Vector<STO> funcList;
		if (structScope == null) {
			funcList = m_symtab.accessList(id);
		}
		else {
			funcList = structScope.accessLocalList(id);
		}

		FuncSTO tempFunc = new FuncSTO("id");
		tempFunc.setParams(args);

		for (int i = 0; i < funcList.size(); i++) {
			FuncSTO currFunc = (FuncSTO )funcList.elementAt(i);
			if (hasSameParamsExact(currFunc, tempFunc)) {
				return currFunc;
			}
		}
		return new ErrorSTO("illegal function");
	}

	STO tryNonOverloadedCall(Vector<STO> params, Vector<STO> args) {
		int numArgs = 0;
		int numParams = 0;

		if (params != null) {
			numParams = params.size();
		}

		if (args != null) {
			numArgs = args.size();
		}

		STO res = null;
		boolean badRes = false;

		// check if num of args and params match
		if (numArgs != numParams) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error5n_Call, numArgs, numParams));
			return new ErrorSTO("no match");
		} else {
			for (int i = 0; i < numArgs; i += 1) {
				res = DoArgAssignExpr(params.get(i), args.get(i));
				if (res instanceof ErrorSTO) badRes = true;
			}
		}

		if (badRes) return new ErrorSTO("bad func call");

		return new FuncSTO("ok");
	}

	STO DoFuncCall(STO sto, Vector<STO> args)
	{
		if (sto instanceof ErrorSTO) return sto;


		if (!sto.isFunc())
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_function, sto.getName()));
			return new ErrorSTO(sto.getName());
		}


		Scope structScope = null;
		String structID = ((FuncSTO) sto).memberOf();

		if (structID != null && m_symtab.access(structID) != null &&  (m_symtab.access(structID).getType() instanceof StructType)) {
			structScope = ((StructType) m_symtab.access(structID).getType()).getScope();
		}

		// if overloaded function call, do some more business
		if (((FuncSTO) sto).isOverloaded()) {
			STO matched = findOverloadedFunction(sto.getName(), args, structScope);

			if (matched instanceof ErrorSTO) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error9_Illegal, sto.getName()));
				return matched;
			}

			sto = matched;
		}

		Vector<STO> params = ((FuncSTO) sto).getParams();
		STO res = tryNonOverloadedCall(params, args);

		if (res instanceof ErrorSTO) return res;


		FuncSTO usedFunc = m_symtab.getFunc();

		if (m_symtab.inGlobalScope()) {
			m_asGenerator.startBuffer();

			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");

			m_bufferFunc.allocateLocalVar(sto);
			usedFunc = m_bufferFunc;
		} else if (m_symtab.inStaticDecl()) {
			m_symtab.getFunc().allocateLocalVar(sto);
			m_asGenerator.startBuffer();
		} else {
			m_symtab.getFunc().allocateLocalVar(sto);
		}

		m_asGenerator.doFuncCall((FuncSTO)sto, args, usedFunc);

//		if (m_symtab.getFunc() != null) {
//			m_symtab.getFunc().allocateLocalVar(sto);
//			m_asGenerator.doFuncCall((FuncSTO)sto, args, m_symtab.getFunc());
//		} else {
//			m_bufferFunc.allocateLocalVar(sto);
//			m_asGenerator.doFuncCall((FuncSTO)sto, args, m_bufferFunc);
//		}


		VarSTO retSTO = new VarSTO(sto.getName() + "(...)", ((FuncSTO) sto).getReturnType());
		retSTO.setBase(sto.getBase());
		retSTO.setOffset(sto.getOffset());
		if (((FuncSTO) sto).returnsByReference())
			retSTO.setReference();

//		if (m_symtab.inStaticDecl()) {
//			String newBase;
//			newBase = m_asGenerator.getFuncName(m_symtab.getFunc());
//			newBase += sto.getName();
//			retSTO.setBase(newBase);
//		}


		return retSTO;

	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------


	//----------------------------------------------------------------
	//
	//---------------------------------------------------------------


	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoDesignator3_ID(String strID, String context) {
		STO sto;
		if (context.equals("global")) {
			if ((sto = m_symtab.accessGlobal(strID)) == null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error0g_Scope, strID));
				sto = new ErrorSTO(strID);
			}
		} else if (m_inStruct) {
			if ((sto = m_symtab.accessLocal(strID)) == null) {
				if ((sto = m_symtab.accessGlobal(strID)) == null) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.undeclared_id, strID));
					sto = new ErrorSTO(strID);
				}
			}
		} else {
			if ((sto = m_symtab.access(strID)) == null)
			{
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.undeclared_id, strID));
				sto = new ErrorSTO(strID);
			}
		}

		//----------------
		// ASSEMBLY GEN
		//----------------


		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoStructThis() {

		Vector<Scope> tempStack = new Vector<Scope>();

		while (m_symtab.accessLocal(m_currStructId) == null) {
			tempStack.add(m_symtab.popScope());
		}

		//Scope tempScope = m_symtab.popScope();

		StructType sType = new StructType();
		sType.setId(m_currStructId);
		sType.setScope(m_symtab.peekScope());

		STO ret = new VarSTO("this", sType);
		ret.setBase("%fp");
		ret.setOffset("68");
		ret.setReference();

		while(tempStack.size() > 0) {
			m_symtab.pushScope(tempStack.remove(tempStack.size() - 1));
		}

		// m_symtab.pushScope(tempScope);

//		sType.printConstructors();
//		sType.getScope().printScope();
		ret.setRValue();
		ret.setIsThis();


		return ret;
	}

	Type DoStructType_ID(String strID)
	{
		STO sto;


//		System.out.println("Passsed: " + strID + " Current: " + m_currStructId);
		if ((sto = m_symtab.access(strID)) == null)
		{
			if (!strID.equals(m_currStructId)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.undeclared_id, strID));
				return new ErrorType();
			}
		}


		if (strID.equals(m_currStructId)) {

//			Scope tempScope = m_symtab.popScope();

			StructType sType = new StructType();
			sType.setId(m_currStructId);
			sType.setScope(m_symtab.peekScope());

//			m_symtab.peekScope().printScope();
//			m_symtab.pushScope(tempScope);

			sto = new StructdefSTO(m_currStructId, sType);
		}

		if (!(sto instanceof StructdefSTO))
		{
			// System.out.println("Passsed: " + strID + " Current: " + m_currStructId + " " + sto.getClass());
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_type, sto.getName()));
			return new ErrorType();
		}

		return sto.getType();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------

	void DoShortCircuitLHS(STO a, Operator o) {
		if (m_symtab.inGlobalScope()) {
			m_asGenerator.startBuffer();
		} else if (m_symtab.inStaticDecl()) {
			m_asGenerator.startBuffer();
		}
		m_asGenerator.doShortCircuitLHS(a, o);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoBinaryExpr(STO a, Operator o, STO b) {
		if (b instanceof ErrorSTO) return b;
		if (a instanceof ErrorSTO) return a;

		STO result = ((BinaryOp) o).checkOperands(a, b);

		if (result instanceof ErrorSTO) {
			m_nNumErrors++;
			switch (result.getName()) {
				case "error1b_Expr":
					m_errors.print(Formatter.toString(ErrorMsg.error1b_Expr, a.getType().getName(), o.getName(), b.getType().getName()));
					break;
				case "error1n_Expr_left":
					m_errors.print(Formatter.toString(ErrorMsg.error1n_Expr, a.getType().getName(), o.getName()));
					break;
				case "error1n_Expr_right":
					m_errors.print(Formatter.toString(ErrorMsg.error1n_Expr, b.getType().getName(), o.getName()));
					break;
				case "error1w_Expr_left_mod":
					m_errors.print(Formatter.toString(ErrorMsg.error1w_Expr, a.getType().getName(), o.getName(), "int"));
					break;
				case "error1w_Expr_right_mod":
					m_errors.print(Formatter.toString(ErrorMsg.error1w_Expr, b.getType().getName(), o.getName(), "int"));
					break;
				case "error1w_Expr_left_boolean":
					m_errors.print(Formatter.toString(ErrorMsg.error1w_Expr, a.getType().getName(), o.getName(), "bool"));
					break;
				case "error1w_Expr_right_boolean":
					m_errors.print(Formatter.toString(ErrorMsg.error1w_Expr, b.getType().getName(), o.getName(), "bool"));
					break;
				case "error1w_Expr_left_bw":
					m_errors.print(Formatter.toString(ErrorMsg.error1w_Expr, a.getType().getName(), o.getName(), "int"));
					break;
				case "error1w_Expr_right_bw":
					m_errors.print(Formatter.toString(ErrorMsg.error1w_Expr, b.getType().getName(), o.getName(), "int"));
					break;
				case "error8_Arithmetic":
					m_errors.print(ErrorMsg.error8_Arithmetic);
					break;
				case "error17_Expr":
					m_errors.print(Formatter.toString(ErrorMsg.error17_Expr, o.getName(), a.getType().getName(), b.getType().getName()));
					break;
			}

		}



		// Folded early exit
		// Constant folded
		if (result instanceof ConstSTO && ((ConstSTO) result).hasValue()) {
			if (o instanceof BooleanOp) {
				if (m_symtab.inGlobalScope()) {
				} else {
					m_asGenerator.doShortCircuitRHS(a, o, b, result, "%g0");
				}
			}

			return result;
		}

		//----------------
		// ASSEMBLY GEN
		//----------------
		// Global
		FuncSTO usedFunc = m_symtab.getFunc();

		if (m_symtab.inGlobalScope()) {
			m_asGenerator.startBuffer();

			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");

			m_bufferFunc.allocateLocalVar(result);
			usedFunc = m_bufferFunc;

		// Function scope
		} else if (m_symtab.inStaticDecl()) {
			m_symtab.getFunc().allocateLocalVar(result);
			m_asGenerator.startBuffer();
		} else {
			m_symtab.getFunc().allocateLocalVar(result);
		}

		if (o instanceof BooleanOp) {
			m_asGenerator.doShortCircuitRHS(a, o, b, result, "%o0");
		}

		m_asGenerator.doBinaryExpr(a, o, b, result, usedFunc);

		return result;
	}

	STO DoUnaryExpr(Operator o, STO a) {
		if (o == null) return a;
		if (a instanceof ErrorSTO) return a;

		STO result = ((UnaryOp) o).checkOperand(a);

		if (result instanceof ErrorSTO) {
			m_nNumErrors++;
			switch (result.getName()) {
				case "error1u_Expr":
					m_errors.print(Formatter.toString(ErrorMsg.error1u_Expr, a.getType().getName(), o.getName(), "bool"));
					break;
				case "error2_Type":
					m_errors.print(Formatter.toString(ErrorMsg.error2_Type, a.getType().getName(), o.getName()));
					break;
				case "error2_Lval":
					m_errors.print(Formatter.toString(ErrorMsg.error2_Lval, o.getName()));
					break;
			}
		}


		// Folded early exit
		// Constant folded
		if (result instanceof ConstSTO && ((ConstSTO) result).hasValue()) {
			return result;
		}

		//----------------
		// ASSEMBLY GEN
		//----------------
		// Global
		if (m_symtab.inGlobalScope()) {
			m_asGenerator.startBuffer();

			if (m_bufferFunc == null)
				m_bufferFunc = new FuncSTO("buffer");

			m_bufferFunc.allocateLocalVar(result);

			// Function scope
		} else if (m_symtab.inStaticDecl()) {
			m_symtab.getFunc().allocateLocalVar(result);
			m_asGenerator.startBuffer();
		} else {
			m_symtab.getFunc().allocateLocalVar(result);
		}
		m_asGenerator.doUnaryExpr(o, a, result);


		return result;
	}

	void doWhile_1() {
		m_asGenerator.doWhileLoop_1();
	}

	void checkConditionalExpr(STO expr, String loop) {
		if (expr instanceof ErrorSTO) {
			return;
		}

		if (!(expr.getType() instanceof BoolType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error4_Test, expr.getType().getName()));
		}

		if (loop.equals("if")) {
			m_asGenerator.doIfStmt(expr);
		} else if (loop.equals("while")) {
			m_asGenerator.doWhileLoop_2(expr);
		}
	}

	 void doIfCodeBlock() {
		m_asGenerator.doIfStmt_2();
	 }

	void doIfElseBlock() {
		m_asGenerator.doIfStmt_3();
	}

	STO DoExitStmt(STO expr) {
		if (expr instanceof ErrorSTO) return expr;

		if (!isAssignable(new IntType(), expr.getType())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error7_Exit, expr.getType().getName()));
		}

		m_asGenerator.doExitStmt(expr);

		return null;
	}

	// For each business
	void DoForEachStmt(Type type, String id , STO expr, boolean optRef) {
		if (expr instanceof ErrorSTO) return;

		if (!(expr.getType() instanceof ArrayType)) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12a_Foreach);
			return;
		}

		// if regular value check assignability
		Type typeInArray = ((ArrayType) expr.getType()).next();
		if (!optRef) {
			if (!isAssignable(type, typeInArray)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error12v_Foreach, typeInArray.getName(), id, type.getName()));
				return;
			}
		} else { // if by reference, check equivalence
			if (!isEquivalent(type, ((ArrayType) expr.getType()).getBaseType())) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error12r_Foreach, typeInArray.getName(), id, type.getName()));
				return;
			}
		}

		DoVarDecl(id, type, null, false);
		STO iter = m_symtab.access(id);
		if (optRef) {
			iter.setReference();
		}
		m_asGenerator.doForEach_1(iter, expr, m_symtab.getFunc(), optRef);
	}

	// Check break and continue
	void DoBreakStmt() {
		if (!inLoop()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12_Break);
		}

		m_asGenerator.doBreakStmt();
	}

	void DoContinueStmt() {
		if (!inLoop()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12_Continue);
		}

		m_asGenerator.doContinueStmt();
	}


}
