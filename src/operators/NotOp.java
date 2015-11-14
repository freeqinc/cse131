package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/10/15.
 */
public class NotOp extends UnaryOp {

    public NotOp() { super("!"); }

    public STO checkOperand(STO a) {
        Type aType = a.getType();

        String name = getName() + a.getName();

        STO retSTO;
        boolean operableConsts = (a instanceof ConstSTO) && ((ConstSTO) a).hasValue();

        if (!(aType instanceof BoolType)) {
                return new ErrorSTO("error1u_Expr");
        } else {
            if (operableConsts) {
                retSTO = new ConstSTO(name, new BoolType(), !((ConstSTO) a).getBoolValue());
            } else {
                retSTO = new ExprSTO(name, new BoolType());
            }
        }

        retSTO.setRValue();
        return retSTO;
    }

}
