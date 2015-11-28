package STO;//---------------------------------------------------------------------
// CSE 131 Reduced-C Compiler Project
// Copyright (C) 2008-2015 Garo Bournoutian and Rick Ord
// University of California, San Diego
//---------------------------------------------------------------------

import types.Type;

import java.util.Vector;

public class FuncSTO extends STO
{
	private Type m_returnType;
	private Vector<STO> m_params = null;
	private boolean m_returnByRef = false;
	private boolean m_overloaded = false;
	private boolean m_isPointer = false;
	private String m_memberOf = null;
	private int m_localVarPointer = 0;
	private int m_paramPointer = 64;
	private String m_funcName = "";

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public FuncSTO(String strName)
	{
		super (strName);
		setFuncName(strName);
		setReturnType(null);
		// You may want to change the isModifiable and isAddressable                      
		// fields as necessary
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean isFunc() 
	{ 
		return true;
		// You may want to change the isModifiable and isAddressable                      
		// fields as necessary
	}

	public String getFuncName() {
		return m_funcName;
	}

	public void setFuncName(String name) {
		m_funcName = name;
	}

	public String memberOf() {
		return m_memberOf;
	}

	public void setMemberOf(String id) {
		m_memberOf = id;
	}

	public String stackSize() { return -m_localVarPointer + ""; }
	//----------------------------------------------------------------
	// This is the return type of the function. This is different from 
	// the function's type (for function pointers - which we are not 
	// testing in this project).
	//----------------------------------------------------------------
	public void setReturnType(Type typ)
	{
		m_returnType = typ;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Type getReturnType ()
	{
		return m_returnType;
	}

	public boolean returnsByReference() {
		return m_returnByRef;
	}

	public void setReturnsByReference() {
		m_returnByRef = true;
	}


	public void setParams(Vector<STO> p) {
		m_params = p;
	}

	public Vector<STO> getParams() {
		return m_params;
	}

	public void setOverloaded() { m_overloaded = true; }
	public boolean isOverloaded() { return m_overloaded; }

	public Type getType () { return getReturnType(); }


	public void allocateLocalVar(STO sto) {
		sto.setBase("%fp");
		sto.setOffset( (m_localVarPointer -= sto.getType().getSize()) + "" );
	}

	public void allocateParam(STO sto) {
		sto.setBase("%fp");
		sto.setOffset( (m_paramPointer += sto.getType().getSize()) + "");
	}

	public void allocateFuncCall() {
		m_localVarPointer -= 4;
	}
}
