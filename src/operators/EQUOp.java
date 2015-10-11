package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/9/15.
 */
public class EQUOp extends ComparisonOp {

    public EQUOp() { super("=="); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if ((aType instanceof NumericType) && (bType instanceof NumericType)) {
            return new ExprSTO("EQU_result", new BoolType(), false, false);
        } else if ((aType instanceof BoolType) && (bType instanceof BoolType)) {
            return new ExprSTO("EQU_result", new BoolType(), false, false);
        } else {
            return new ErrorSTO("error1b_Expr");
        }
    }
}
