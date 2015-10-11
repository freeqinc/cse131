package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/10/15.
 */
public class NotOp extends UnaryOp {

    public NotOp() { super("not"); }

    public STO checkOperand(STO a) {
        Type aType = a.getType();

        if (!(aType instanceof BoolType)) {
                return new ErrorSTO("error1u_Expr");
        } else {
            return new ExprSTO("not_result", new BoolType());
        }
    }

}
