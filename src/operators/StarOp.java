package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/4/15.
 */
public class StarOp extends ArithmeticOp {

    public StarOp() { super("*"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof NumericType) || !(bType instanceof NumericType)) {
            if (!(aType instanceof NumericType))
                return new ErrorSTO("error1n_Expr_left");
            else
                return new ErrorSTO("error1n_Expr_right");
        } else if (aType instanceof IntType && bType instanceof IntType) {
            return new ExprSTO("add_result", new IntType(), false, false);
        } else {
            return new ExprSTO("add_result", new FloatType(), false, false);
        }
    }
}
