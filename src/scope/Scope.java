package scope;//---------------------------------------------------------------------
// CSE 131 Reduced-C Compiler Project
// Copyright (C) 2008-2015 Garo Bournoutian and Rick Ord
// University of California, San Diego
//---------------------------------------------------------------------

import STO.STO;

import java.util.Vector;

public class Scope
{
	private Vector<STO> m_lstLocals;

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Scope()
	{
		m_lstLocals = new Vector<STO>();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public STO access(String strName)
	{
		return accessLocal(strName);
	}

	public void printScope() {
        System.out.print("SCOPE: ");
        for (int i = 0; i < m_lstLocals.size(); i += 1) {
            System.out.print(m_lstLocals.elementAt(i).getType().getName() + ": "  + m_lstLocals.elementAt(i).getName() + ", ");
        }
        System.out.println();
    }
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public STO accessLocal(String strName)
	{
		STO sto = null;
		for (int i = 0; i < m_lstLocals.size(); i++)
		{
			sto = m_lstLocals.elementAt(i);

			if (sto.getName().equals(strName))
				return sto;
		}

		return null;
	}

	public Vector<STO> accessLocalList(String strName) {
		Vector <STO> res = new Vector<STO>();
		STO sto = null;

		for (int i = 0; i < m_lstLocals.size(); i++) {
			sto = m_lstLocals.elementAt(i);

			if (sto.getName().equals(strName))
				res.addElement(sto);
		}

		return res;
	}
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void InsertLocal(STO sto)
	{
		m_lstLocals.addElement(sto);
	}
	public void PopLocal() { m_lstLocals.remove(m_lstLocals.size() - 1); }
	public STO PeekLocal() { return m_lstLocals.elementAt(m_lstLocals.size() - 1); }
	public void PopFront() { m_lstLocals.remove(0); }
}
