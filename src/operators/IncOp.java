package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/10/15.
 */
public class IncOp extends UnaryOp {

    private boolean m_isPre = false;

    public IncOp(boolean isPre) {
        super("++");
        m_isPre = isPre;
    }

    public boolean isPre() {
        return m_isPre;
    }

    public STO checkOperand(STO a) {
        Type aType = a.getType();

        String name = m_isPre ? getName() + "(" + a.getName() +  ")" : "(" + a.getName() +  ")" + getName();

        if (aType instanceof PointerType) {
            if (!a.isModLValue())
                return new ErrorSTO("error2_Lval");
            else
                return new ExprSTO(name, a.getType(), false, false);
        } else if (!(aType instanceof NumericType)) {
            return new ErrorSTO("error2_Type");
        }  else {
            if (!a.isModLValue())
                return new ErrorSTO("error2_Lval");
            else
                return new ExprSTO(name, a.getType(), false, false);
        }
    }

}
