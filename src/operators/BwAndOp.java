package operators;
import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/10/15.
 */
public class BwAndOp extends BitwiseOp {

    public BwAndOp() { super("&"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        String name = a.getName() + getName() + b.getName();

        STO retSTO;
        boolean operableConsts = (a instanceof ConstSTO) && ((ConstSTO) a).hasValue() && (b instanceof ConstSTO) && ((ConstSTO) b).hasValue();

        if (!(aType instanceof IntType) || !(bType instanceof IntType)) {
            if (!(aType instanceof IntType))
                return new ErrorSTO("error1w_Expr_left_bw");
            else
                return new ErrorSTO("error1w_Expr_right_bw");
        } else {
            if (operableConsts) {
                retSTO = new ConstSTO(name, new IntType(), ((ConstSTO) a).getIntValue() & ((ConstSTO) b).getIntValue());
            } else {
                retSTO = new ExprSTO(name, new IntType());
            }
        }

        retSTO.setRValue();
        return retSTO;
    }
}
