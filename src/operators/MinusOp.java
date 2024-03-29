package operators;
import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/3/15.
 */
public class MinusOp extends ArithmeticOp {

    public MinusOp() { super("-"); }

    public STO checkOperands(STO a, STO b) {
        Type aType = a.getType();
        Type bType = b.getType();

        String name = "(" + a.getName() + ")" + getName() + "(" + b.getName() + ")";

        STO retSTO;
        boolean operableConsts = (a instanceof ConstSTO) && ((ConstSTO) a).hasValue() && (b instanceof ConstSTO) && ((ConstSTO) b).hasValue();

        if (!(aType instanceof NumericType) || !(bType instanceof NumericType)) {
            if (!(aType instanceof NumericType))
                return new ErrorSTO("error1n_Expr_left");
            else
                return new ErrorSTO("error1n_Expr_right");
        } else if (aType instanceof IntType && bType instanceof IntType) {
            if (operableConsts) {
                retSTO = new ConstSTO(name, new IntType(), ((ConstSTO) a).getIntValue() - ((ConstSTO) b).getIntValue());
            } else {
                retSTO = new ExprSTO(name, new IntType());
            }
        } else {
            if (operableConsts) {
                retSTO = new ConstSTO(name, new FloatType(), ((ConstSTO) a).getFloatValue() - ((ConstSTO) b).getFloatValue());
            } else {
                retSTO = new ExprSTO(name, new FloatType());
            }
        }

        retSTO.setRValue();
        return retSTO;
    }
}
