package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/5/15.
 */
public class GTOp extends ComparisonOp {

    public GTOp() { super("GT"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof NumericType) || !(bType instanceof NumericType)) {
            if (!(aType instanceof NumericType))
                return new ErrorSTO("error1w_Expr_left_comparison");
            else
                return new ErrorSTO("error1w_Expr_right_comparison");
        } else {
            return new ExprSTO("GT_result", new BoolType());
        }
    }

}
