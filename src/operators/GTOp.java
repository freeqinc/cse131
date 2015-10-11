package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/5/15.
 */
public class GTOp extends ComparisonOp {

    public GTOp() { super(">"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof NumericType) || !(bType instanceof NumericType)) {
            if (!(aType instanceof NumericType))
                return new ErrorSTO("error1n_Expr_left");
            else
                return new ErrorSTO("error1n_Expr_right");
        } else {
            return new ExprSTO("GT_result", new BoolType(), false, false);
        }
    }

}
