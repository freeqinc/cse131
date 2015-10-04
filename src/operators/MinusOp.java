package operators;
import STO.*;
import types.*;

/**
 * Created by FreeQinC on 10/3/15.
 */
public class MinusOp extends ArithmeticOp {

    public MinusOp() { super("minus"); }

    public STO checkOperands(STO a, STO b) {
        return new VarSTO("ugly", new IntType());
    }
}
