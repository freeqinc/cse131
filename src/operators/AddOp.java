package operators;
import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/3/15.
 */
public class AddOp extends ArithmeticOp {

    public AddOp() { super("add"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof NumericType) || !(bType instanceof NumericType)) {
            return new ErrorSTO("error1b_Expr");
        } else if (aType instanceof IntType && bType instanceof IntType) {
            return new ExprSTO("add_result", new IntType());
        } else {
            return new ExprSTO("add_result", new FloatType());
        }
    }
}
