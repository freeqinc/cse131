package types;

/**
 * Created by FreeQinC on 10/18/15.
 */
public class ArrayType extends CompositeType {

    private int m_dimensionSize = 0;
    private Type m_nextType = null;

    public ArrayType() { super("array", 0); }
    public ArrayType(int size) { super("array", size); }

    public void setNext(Type t) { m_nextType = t; }
    public Type next() { return m_nextType; }

    public void setDimSize(int size) { m_dimensionSize = size; }
    public int getDimSize() { return m_dimensionSize; }

    public String getName() {
        String name = "[" + m_dimensionSize + "]";
        Type next = m_nextType;

        while (next instanceof ArrayType) {
            name += "[" + ((ArrayType) next).getDimSize() + "]";
            next = ((ArrayType) next).next();
        }

        name = next.getName() + name;
        return name;
    }
}
