package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/4/15.
 */
public class ModOp extends ArithmeticOp {

    public ModOp() { super("%"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        if (!(aType instanceof IntType) || !(bType instanceof IntType)) {
            if (!(aType instanceof IntType))
                return new ErrorSTO("error1w_Expr_left_mod");
            else
                return new ErrorSTO("error1w_Expr_right_mod");
        } else {
            return new ExprSTO("mod_result", new IntType());
        }
    }
}
