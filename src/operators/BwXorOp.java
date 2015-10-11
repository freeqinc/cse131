package operators;
import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/10/15.
 */
public class BwXorOp extends BitwiseOp {

    public BwXorOp() { super("^"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof IntType) || !(bType instanceof IntType)) {
            if (!(aType instanceof IntType))
                return new ErrorSTO("error1w_Expr_left_bw");
            else
                return new ErrorSTO("error1w_Expr_right_bw");
        } else {
            return new ExprSTO("bw_xor_result", new BoolType(), false, false);
        }
    }
}
