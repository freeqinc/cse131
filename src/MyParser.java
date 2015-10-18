//---------------------------------------------------------------------
// CSE 131 Reduced-C Compiler Project
// Copyright (C) 2008-2015 Garo Bournoutian and Rick Ord
// University of California, San Diego
//---------------------------------------------------------------------

import STO.*;
import java_cup.runtime.*;

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

	private final static boolean PRINT_1 = !true;

	private SymbolTable m_symtab;

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

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoProgramEnd()
	{
		m_symtab.closeScope();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoVarDecl(String id, Type t, STO expr)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		if (expr instanceof ErrorSTO) {
			return;
		}

		if (expr != null && !isAssignable(t, expr.getType())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error8_Assign, expr.getType().getName(), t.getName()));
		}

		VarSTO sto = new VarSTO(id);
		if (t != null) {
			sto = new VarSTO(id, t);
		}

		m_symtab.insert(sto);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoExternDecl(String id)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		VarSTO sto = new VarSTO(id);
		m_symtab.insert(sto);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoConstDecl(Type t, String id, STO expr)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
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
		}



	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoStructdefDecl(String id)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		StructdefSTO sto = new StructdefSTO(id);
		m_symtab.insert(sto);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFuncDecl_1(String id, Type returnType, boolean optRef)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		FuncSTO sto = new FuncSTO(id);
		sto.setReturnType(returnType);
		if (optRef) {
			sto.setReturnsByReference();
		}
		m_symtab.insert(sto);

		m_symtab.openScope();
		m_symtab.setFunc(sto);
	}

	STO DoVoidReturnStmt() {
		FuncSTO func = m_symtab.getFunc();

		if (!(func.getReturnType() instanceof VoidType)) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error6a_Return_expr);
			return new ErrorSTO("missing return");
		}

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
				return new ErrorSTO("return type not assignable");
			}
		} else { // if function returns by reference
			// not equivalent
			if (!isEquivalent(funcType, returnType)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error6b_Return_equiv, returnType.getName(), funcType.getName()));
				return new ErrorSTO("return type not equivalent");
			}

			// not modLValue
			if (!returnExpr.isModLValue()) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6b_Return_modlval);
				return new ErrorSTO("return type not modlvalue");
			}
		}


		return null;
	}

	STO DoReturnCheck(Vector<String> vec) {

		FuncSTO func = m_symtab.getFunc();

		if (!(func.getReturnType() instanceof VoidType)) {
			if (vec == null || !vec.contains("ReturnStmt")) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6c_Return_missing);

				return new ErrorSTO("no return type found");
			}
		}

		return null;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFuncDecl_2()
	{
		m_symtab.closeScope();
		m_symtab.setFunc(null);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFormalParams(Vector<STO> params)
	{
		if (m_symtab.getFunc() == null)
		{
			m_nNumErrors++;
			m_errors.print ("internal: DoFormalParams says no proc!");
		}

		// insert parameters here
		FuncSTO func = m_symtab.getFunc();
		func.setParams(params);
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

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	boolean isAssignable(Type aType, Type bType) {

		if (!aType.getClass().equals(bType.getClass())) {
			if (aType instanceof FloatType && bType instanceof IntType) {
				// something
			} else {
				return false;
			}
		}

		return true;
	}

	boolean isEquivalent(Type aType, Type bType) {

		if (!aType.getClass().equals(bType.getClass())) {
			return false;
		}

		return true;
	}


	STO DoAssignExpr(STO stoDes, STO stoExpr)
	{

		if (stoExpr instanceof ErrorSTO) {
			return stoExpr;
		}

		Type a = stoDes.getType();
		Type b = stoExpr.getType();


		if (!stoDes.isModLValue())
		{
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error3a_Assign);

			if (PRINT_1) System.out.println(stoDes.getName());

			return  new ErrorSTO("Left is not a modifiable l-value");
		}

		if (!isAssignable(a, b)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error3b_Assign, b.getName(), a.getName()));
			return new ErrorSTO("types not assignable");
		}

		return stoDes;
	}

	STO DoArgAssignExpr(STO stoDes, STO stoExpr) {
		if (stoExpr instanceof ErrorSTO) {
			return stoExpr;
		}

		Type a = stoDes.getType();
		Type b = stoExpr.getType();

		// pass-by-value, check if assignable
		if (!stoDes.isReference()) {
			if (!isAssignable(a, b)){
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5a_Call, b.getName(), stoDes.getName(), a.getName()));
				return new ErrorSTO("types not assignable");
			}
		} else { // pass-by-reference check equivalence & MLV

			// check arg equivalence to param
			if(!isEquivalent(a, b)) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5r_Call, b.getName(), stoDes.getName(), a.getName()));
				return new ErrorSTO("types not equivalent");
			}

			// check that arg is MLV
			if (!stoExpr.isModLValue()) {
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
	STO DoFuncCall(STO sto, Vector<STO> args)
	{
		if (!sto.isFunc())
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_function, sto.getName()));
			return new ErrorSTO(sto.getName());
		}

		Vector<STO> params = ((FuncSTO) sto).getParams();
		int numArgs = 0;
		int numParams = params.size();

		if (args != null) {
			numArgs = args.size();
		}

		// check if num of args and params match
		if (numArgs != numParams) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error5n_Call, numArgs, numParams));
			return new ErrorSTO(sto.getName());
		} else {
			for (int i = 0; i < numArgs; i += 1) {
				DoArgAssignExpr(params.get(i), args.get(i));
			}
		}

		// check if pass by reference params



		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoDesignator2_Dot(STO sto, String strID)
	{
		// Good place to do the struct checks

		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoDesignator2_Array(STO sto)
	{
		// Good place to do the array checks

		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoDesignator3_ID(String strID, String context)
	{
		STO sto;
		if (context.equals("global")) {
			if ((sto = m_symtab.accessGlobal(strID)) == null)
			{
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error0g_Scope, strID));
				sto = new ErrorSTO(strID);
			}
		} else {
			if ((sto = m_symtab.access(strID)) == null)
			{
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.undeclared_id, strID));
				sto = new ErrorSTO(strID);
			}
		}

		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	Type DoStructType_ID(String strID)
	{
		STO sto;

		if ((sto = m_symtab.access(strID)) == null)
		{
			m_nNumErrors++;
		 	m_errors.print(Formatter.toString(ErrorMsg.undeclared_id, strID));
			return new ErrorType();
		}

		if (!sto.isStructdef())
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_type, sto.getName()));
			return new ErrorType();
		}

		return sto.getType();
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
			}

		}

		if (PRINT_1) System.out.println(a.getType().getName() + " " + o.getName() + " " + b.getType().getName() + ": " + result.getType().getName());

		return result;
	}

	STO DoUnaryExpr(Operator o, STO a) {
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

		if (PRINT_1) System.out.println(o.getName() + " " + a.getType().getName() + ": " + result.getType().getName());

		return result;
	}

	void checkConditionalExpr(STO expr) {
		if (expr instanceof ErrorSTO) {
			return;
		}

		if (!(expr.getType() instanceof BoolType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error4_Test, expr.getType().getName()));
		}
	}

	STO DoExitStmt(STO expr) {
		if (expr instanceof ErrorSTO) return expr;

		if (!isAssignable(new IntType(), expr.getType())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error7_Exit, expr.getType().getName()));
		}

		return null;
	}

}
