package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/9/15.
 */
public class NEQOp extends ComparisonOp {

    public NEQOp() { super("!="); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if ((aType instanceof NumericType) && (bType instanceof NumericType)) {
            return new ExprSTO("NEQ_result", new BoolType());
        } else if ((aType instanceof BoolType) && (bType instanceof BoolType)) {
            return new ExprSTO("NEQ_result", new BoolType());
        } else {
            return new ErrorSTO("error1b_Expr");
        }
    }
}
