package operators;

import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/20/15.
 */
public class UnaryMinus extends UnaryOp {

    public UnaryMinus() { super("-"); }

    public STO checkOperand(STO a) {
        Type aType = a.getType();

        String name = getName() + "(" + a.getName() +  ")";

        STO retSTO = new ConstSTO(name, aType);
        boolean operableConsts = (a instanceof ConstSTO) && ((ConstSTO) a).hasValue();

        if (operableConsts) {
            retSTO = new ConstSTO(name, aType, ((ConstSTO) a).getValue());
            retSTO.setNegative();
        }

        retSTO.setRValue();
        return retSTO;
    }
}
