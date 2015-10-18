package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/5/15.
 */
public class GTEOp extends ComparisonOp {

    public GTEOp() { super(">="); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        STO retSTO;
        boolean operableConsts = (a instanceof ConstSTO) && ((ConstSTO) a).hasValue() && (b instanceof ConstSTO) && ((ConstSTO) b).hasValue();

        if (!(aType instanceof NumericType) || !(bType instanceof NumericType)) {
            if (!(aType instanceof NumericType))
                return new ErrorSTO("error1n_Expr_left");
            else
                return new ErrorSTO("error1n_Expr_right");
        } else {
            if (operableConsts) {
                retSTO = new ConstSTO("GTE_result", new BoolType(), ((ConstSTO) a).getFloatValue() >= ((ConstSTO) b).getFloatValue());
            } else {
                retSTO = new ExprSTO("GTE_result", new BoolType());
            }
        }

        retSTO.setRValue();
        return retSTO;
    }

}
