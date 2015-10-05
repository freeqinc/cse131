package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/4/15.
 */
public class StarOp extends ArithmeticOp {

    public StarOp() { super("star"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof NumericType) || !(bType instanceof NumericType)) {
            return new ErrorSTO("error1b_Expr");
        } else if (aType instanceof IntType && bType instanceof IntType) {
            return new ConstSTO("star_result", new IntType());
        } else {
            return new ConstSTO("star_result", new FloatType());
        }
    }
}
