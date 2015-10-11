package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/10/15.
 */
public class DecOp extends UnaryOp {

    public DecOp() { super("--"); }

    public STO checkOperand(STO a) {
        Type aType = a.getType();


        if (!(aType instanceof NumericType)) {
            return new ErrorSTO("error2_Type");
        } else {
            if (!a.isModLValue())
                return new ErrorSTO("error2_Lval");
            else
                return new ExprSTO("dec_result", a.getType(), false, false);
        }
    }

}
