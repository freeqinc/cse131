package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/10/15.
 */
public class AndOp extends BooleanOp {

    public AndOp() { super("&&"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof BoolType) || !(bType instanceof BoolType)) {
            if (!(aType instanceof BoolType))
                return new ErrorSTO("error1w_Expr_left_boolean");
            else
                return new ErrorSTO("error1w_Expr_right_boolean");
        } else {
            return new ExprSTO("and_result", new BoolType());
        }
    }
}
