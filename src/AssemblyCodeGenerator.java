/**
 * Created by FreeQinC on 11/11/15.
 */

import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import STO.*;
import types.*;
import operators.*;
import java.util.*;

public class AssemblyCodeGenerator {

    // for indentation
    private int m_indentLevel = 0;

    // useful strings
    private static final String ERROR_IO_CLOSE =
            "Unable to close fileWriter";
    private static final String ERROR_IO_CONSTRUCT =
            "Unable to construct FileWriter for file %s";
    private static final String ERROR_IO_WRITE =
            "Unable to write to fileWriter";

    // the filewriter
    private FileWriter m_fileWriter;

    // buffer
    private ArrayList<String> m_buffer = new ArrayList<>();
    private boolean m_isBuffering = false;

    // counters and trackers
    private int m_floatCount = 1;
    private int m_stringCount = 1;
    private int m_cmpCount = 1;
    private int m_ifStmtCount = 1;
    private int m_shortCircuitCount = 1;
    private int m_loopCount = 1;
    private String m_localStaticAppend = "";

    private ArrayList<String> m_ifStmtList = new ArrayList<String>();
    private ArrayList<String> m_shortCircuitList = new ArrayList<String>();
    private ArrayList<String> m_loopList = new ArrayList<String>();



    // ctor
    public AssemblyCodeGenerator(String fileToWrite) {
        try {
            m_fileWriter = new FileWriter(fileToWrite);

            writeAssembly(ACGstrs.FILE_HEADER, (new Date()).toString());
            doAssemblyHeader();

        } catch (IOException e) {
            System.err.printf(ERROR_IO_CONSTRUCT, fileToWrite);
            e.printStackTrace();
            System.exit(1);
        }
    }

    // helpers
    public void decreaseIndent() {
        m_indentLevel--;
    }

    public void increaseIndent() {
        m_indentLevel++;
    }

    public void startBuffer() {
        m_isBuffering = true;
    }

    public void stopBuffer() {
        m_isBuffering = false;
    }

    public void increaseShortCircuit() { m_shortCircuitCount++; }

    public void closeWriter() {
        try {
            m_fileWriter.close();
        } catch (IOException e) {
            System.err.println(ERROR_IO_CLOSE);
            e.printStackTrace();
            System.exit(1);
        }
    }

    public void writeDirectly(ArrayList<String> buffer) {
        for (int i = 0; i < buffer.size(); i += 1) {
            writeAssembly(buffer.get(i));
        }
    }

    public void writeAssembly(String template, String ... params) {
        StringBuilder asStmt = new StringBuilder();

        for (int i = 0; i < m_indentLevel; i++) {
            asStmt.append(ACGstrs.SEPARATOR);
        }

        if (params.length == 0)
            asStmt.append(template);
        else
            asStmt.append(String.format(template, (Object[]) params));


        if (m_isBuffering) {
            m_buffer.add(asStmt.toString());
        } else {
            try {
                m_fileWriter.write(asStmt.toString());
                m_fileWriter.flush();
            } catch (IOException e){
                System.err.println(ERROR_IO_WRITE);
                e.printStackTrace();
            }
        }

    }

    public void clearBuffer() {
        m_buffer.clear();
    }

    public void writeBuffer() {
        stopBuffer();
        if (!bufferEmpty()) {
            writeDirectly(m_buffer);
        }
        clearBuffer();
    }

    public boolean bufferEmpty() {
        return m_buffer.size() == 0;
    }

    // Constants
    //----------------------------------------------------------------
    public void doAssemblyHeader() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".rodata");
        writeAssembly(ACGstrs.ALIGN, "4");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.intFmt");
        increaseIndent();
        writeAssembly(ACGstrs.ASCIZ, "%d");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.strFmt");
        increaseIndent();
        writeAssembly(ACGstrs.ASCIZ, "%s");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.strTF");
        increaseIndent();
        writeAssembly(ACGstrs.ASCIZ, "false\\0\\0\\0true");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.strEndl");
        increaseIndent();
        writeAssembly(ACGstrs.ASCIZ, "\\n");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.strArrBound");
        increaseIndent();
        writeAssembly(ACGstrs.ASCIZ, "Index value of %d is outside legal range [0,%d).\\n");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.strNullPtr");
        increaseIndent();
        writeAssembly(ACGstrs.ASCIZ, "Attempt to dereference NULL pointer.\\n");
        writeAssembly(ACGstrs.NEWLINE);

        writeAssembly(ACGstrs.SECTION, ".text");
        writeAssembly(ACGstrs.ALIGN, "4");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.printBool");
        increaseIndent();
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "-96", "%sp");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ".$$.strTF", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%g0", "%i0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BE_OP, ".$$.printBool2");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%o0", "8", "%o0");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.printBool2");
        increaseIndent();
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "printf");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        writeAssembly(ACGstrs.NEWLINE);

        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.arrCheck");
        increaseIndent();
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "-96", "%sp");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%i0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BL_OP, ".$$.arrCheck2");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%i0", "%i1");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BGE_OP, ".$$.arrCheck2");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.arrCheck2");
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ".$$.strArrBound", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%i0", "%o1");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "printf");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%i1", "%o2");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "exit");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o0");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        writeAssembly(ACGstrs.NEWLINE);

        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.ptrCheck");
        increaseIndent();
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "-96", "%sp");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%i0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BNE_OP, ".$$.ptrCheck2");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ".$$.strNullPtr", "%o0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "printf");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "exit");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o0");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.ptrCheck2");
        increaseIndent();
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);

        writeAssembly(ACGstrs.NEWLINE);
        decreaseIndent();
    }

    // Variables
    //----------------------------------------------------------------


    public void doInitGlobalStatic(STO sto, ConstSTO expr, boolean optStatic) {
        clearBuffer();
        stopBuffer();

        increaseIndent();
        doSection(".data");

        if (!optStatic)
            writeAssembly(ACGstrs.GLOBAL, sto.getName());
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL,  m_localStaticAppend + sto.getName());
        increaseIndent();


        // if value is float
        if (sto.getType() instanceof FloatType) {
            writeAssembly(ACGstrs.SINGLE, expr.getFloatValue()+"");
        // if value is int or bool
        } else {
            writeAssembly(ACGstrs.WORD, expr.getIntValue()+"");
        }

        doSection(".text");
        decreaseIndent();
    }

    public void doUninitGlobalStatic(STO sto, boolean optStatic) {
        increaseIndent();
        doSection(".bss");
        if (!optStatic)
            writeAssembly(ACGstrs.GLOBAL, sto.getName());
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, m_localStaticAppend + sto.getName());
        increaseIndent();
        writeAssembly(ACGstrs.SKIP, "4");

        doSection(".text");
        decreaseIndent();
    }

    public void doAssignFlush(STO sto, STO expr, FuncSTO bufferFunc) {
        String functionName = ".$.init." + sto.getName();

        String loadRegister = "%o0";
        if (sto.getType() instanceof FloatType)
            loadRegister = "%f0";

        writeAssembly(ACGstrs.LABEL, functionName);
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "SAVE." + functionName, "%g1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "%g1", "%sp");

        writeBuffer();

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, sto.getName() + " = " + expr.getName());
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, sto.getName(), "%o1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%g0", "%o1", "%o1");
        loadSTO(expr, "%l7", "%o0");

        assignFitos(sto, expr, bufferFunc);

        writeAssembly(ACGstrs.ST, loadRegister, "%o1");
        decreaseIndent();



        doFuncDecl_2(functionName, bufferFunc);

        increaseIndent();
        doSection(".init");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, functionName);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        doSection(".text");
        decreaseIndent();

    }

    public void doLocalVariable(STO sto, STO expr, boolean optStatic, FuncSTO func) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, sto.getName() + " = " + expr.getName());
        setAddress(sto, "%o1");

        // Handle float register
        String loadRegister = "%o0";
        if (sto.getType() instanceof FloatType)
            loadRegister = "%f0";

        /*
        // Literal
        if (!expr.hasAddress()) {

            // Float
            if (expr.getType() instanceof FloatType) {
                loadFloat(((ConstSTO)expr).getFloatValue() + "", "%l7", "%f0");

            // Non-float
            } else if (expr instanceof ConstSTO){
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((ConstSTO) expr).getIntValue() + "", "%o0");
            }

        // Variable/Expression
        } else {
            setAddressLoad(expr, "%l7", loadRegister);
        }
        */

        loadSTO(expr, "%l7", "%o0");

        assignFitos(sto, expr, func);

        writeAssembly(ACGstrs.ST, loadRegister, "%o1");
        decreaseIndent();
    }

    // Designators
    //----------------------------------------------------------------

    public void doDesignatorID(STO sto) {
        setAddressLoad(sto, "%l7", "%o0");
    }


    // Helpers
    //----------------------------------------------------------------
    public void doSection(String section) {
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, section);
        writeAssembly(ACGstrs.ALIGN, "4");
    }

    public void setAddress(STO sto, String set) {
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, sto.getOffset(), set);
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, sto.getBase(), set, set);
    }

    public void setAddressLoad(STO sto, String set, String load) {
        setAddress(sto, set);
        writeAssembly(ACGstrs.LD, set, load);
    }

    public void storeIntoAddress(STO sto, String set, String store) {
        setAddress(sto, set);
        writeAssembly(ACGstrs.ST, store, set);
    }

    public void loadSTO(STO sto, String set, String load) {

        // Deal with float
        if (sto.getType() instanceof FloatType)
            load = "%f" + load.charAt(2);


        // Variable
        if (sto.hasAddress() ) {
            setAddressLoad(sto, set, load);

        // Constant to load
        } else if (sto instanceof ConstSTO && ((ConstSTO) sto).hasValue()) {
            if (sto.getType() instanceof FloatType) {
                loadFloat(((ConstSTO) sto).getFloatValue() + "", set, load);
            } else {
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((ConstSTO) sto).getIntValue() + "", load);
            }
        }
    }

    public String loadFloat(String f, String set, String load) {
        String floatLabel = ".$$.float." + m_floatCount++;

        doSection(".rodata");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, floatLabel);
        increaseIndent();
        writeAssembly(ACGstrs.SINGLE, f);

        doSection(".text");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, floatLabel, set);
        writeAssembly(ACGstrs.LD, set, load);

        return floatLabel;
    }

    public String loadString(String s) {
        String stringLabel = ".$$.str." + m_stringCount++;

        doSection(".rodata");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, stringLabel);
        increaseIndent();
        writeAssembly(ACGstrs.ASCIZ, s);

        doSection(".text");

        return stringLabel;
    }

    public void doCall(String function) {
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, function);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
    }

    public void doReturn() {
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
    }


    public void assignFitos(STO left, STO right, FuncSTO func) {
        if (left.getType() instanceof FloatType && !(right.getType() instanceof FloatType)) {
            VarSTO padding = new VarSTO("padding", new FloatType());
            func.allocateLocalVar(padding);
            storeIntoAddress(padding, "%l7", "%o0");
            writeAssembly(ACGstrs.LD, "%l7", "%f0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FITOS_OP, "%f0", "%f0");
        }
    }

    // Operators / Arithmetic
    //----------------------------------------------------------------

    // Unary ----
    public void doUnaryExpr(Operator o, STO a, STO expr) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, expr.getName());


        String reg = "%o0";

        if (a.getType() instanceof FloatType)
            reg = "%f0";

        loadSTO(a, "%l7", reg);


        // - +
        if (o instanceof UnaryPlus || o instanceof UnaryMinus) {
            doUnarySignOp(o, a, expr, reg);

        // -- ++
        } else if (o instanceof IncOp || o instanceof DecOp) {
            doIncDecOp(o, a, expr, reg);

        // !
        } else if (o instanceof NotOp) {
            doNotOp(o, a, expr, reg);
        }

        decreaseIndent();
    }

    public void doUnarySignOp(Operator o, STO a, STO expr, String reg) {
        String neg = ACGstrs.NEG_OP;
        String mov = ACGstrs.MOV_OP;

        if (expr.getType() instanceof FloatType) {
            neg = ACGstrs.FNEGS_OP;
            mov = ACGstrs.FMOVS_OP;
        }

        if (o instanceof UnaryMinus) {
            writeAssembly(ACGstrs.TWO_PARAM, neg, reg, reg);
        } else if (o instanceof UnaryPlus) {
            writeAssembly(ACGstrs.TWO_PARAM, mov, reg, reg);
        }

        storeIntoAddress(expr, "%o1", reg);
    }

    public void doIncDecOp(Operator o, STO a, STO expr, String reg) {
        String valueToStore = "%o0";
        String reg0 = "%o0";
        String reg1 = "%o1";
        String reg2 = "%o2";
        String sub = ACGstrs.SUB_OP;
        String add = ACGstrs.ADD_OP;

        if (expr.getType() instanceof FloatType) {
            reg0 = "%f0";
            reg1 = "%f1";
            reg2 = "%f2";
            valueToStore = "%f0";
            sub = ACGstrs.FSUBS_OP;
            add = ACGstrs.FADDS_OP;

            loadFloat("1.0", "%l7", "%f1");
        } else {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "1", "%o1");
        }


        if (o instanceof DecOp) {
            writeAssembly(ACGstrs.THREE_PARAM, sub, reg0, reg1, reg2);
            if (((DecOp) o).isPre())
                valueToStore = "%" + valueToStore.charAt(1) + "2";
        } else if (o instanceof IncOp) {
            writeAssembly(ACGstrs.THREE_PARAM, add, reg0, reg1, reg2);
            if (((IncOp) o).isPre())
                valueToStore = "%" + valueToStore.charAt(1) + "2";
        }


        storeIntoAddress(expr, "%o1", valueToStore);
        storeIntoAddress(a, "%o1", reg2);
    }

    public void doNotOp(Operator o, STO a, STO expr, String reg) {
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.XOR_OP, "%o0", "1" ,"%o0");
        storeIntoAddress(expr, "%o1", "%o0");
    }

    // Binary ----
    public Vector<String> getBinarySTORegs(STO a, STO b) {
        Vector<String> regs = new Vector<String>();

        if (a.getType() instanceof FloatType)
            regs.addElement("%f0");
        else
            regs.addElement("%o0");

        if (b.getType() instanceof FloatType)
            regs.addElement("%f1");
        else
            regs.addElement("%o1");

        return regs;
    }

    public void doTypePromotionLeft(STO a, STO b, FuncSTO func, Vector<String> regs) {
        Type aT = a.getType();
        Type bT = b.getType();

        if (!(aT instanceof FloatType) && (bT instanceof FloatType)) {
            VarSTO padding = new VarSTO("padding", new FloatType());
            func.allocateLocalVar(padding);

            storeIntoAddress(padding, "%l7", regs.get(0));
            writeAssembly(ACGstrs.LD, "%l7", "%f0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FITOS_OP, "%f0", "%f0");
            regs.set(0, "%f0");
        }
    }

    public void doTypePromotionRight(STO a, STO b, FuncSTO func, Vector<String> regs) {
        Type aT = a.getType();
        Type bT = b.getType();

        if ((aT instanceof FloatType) && !(bT instanceof FloatType)) {
            VarSTO padding = new VarSTO("padding", new FloatType());
            func.allocateLocalVar(padding);

            storeIntoAddress(padding, "%l7", regs.get(1));
            writeAssembly(ACGstrs.LD, "%l7", "%f1");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FITOS_OP, "%f1", "%f1");
            regs.set(1, "%f1");
        }
    }

    public void doBinaryExpr(STO a, Operator o, STO b, STO expr, FuncSTO func) {

        if (o instanceof BooleanOp) {
            return;
        }

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, expr.getName());

        Vector<String> regs = getBinarySTORegs(a, b);

        loadSTO(a, "%l7", regs.get(0));
        doTypePromotionLeft(a, b, func, regs);

        loadSTO(b, "%l7", regs.get(1));
        doTypePromotionRight(a, b, func, regs);


        // + - * / %
        if (o instanceof ArithmeticOp) {
            doArithmeticOp(o, expr, regs);

        // & | ^
        } else if (o instanceof BitwiseOp) {
            doArithmeticOp(o, expr, regs);

        // > < >= <= ==
        } else if (o instanceof ComparisonOp) {
            doComparisonOp(o, expr, regs);

        }

        decreaseIndent();
    }

    public void doArithmeticOp(Operator o, STO expr, Vector<String> regs) {
        String op1 = regs.get(0);
        String op2 = regs.get(1);

        String add = ACGstrs.ADD_OP;
        String sub = ACGstrs.SUB_OP;

        if (expr.getType() instanceof FloatType) {
            add = ACGstrs.FADDS_OP;
            sub = ACGstrs.FSUBS_OP;
        }

        if (o instanceof AddOp) {
            writeAssembly(ACGstrs.THREE_PARAM, add, op1, op2, op1);
        } else if (o instanceof MinusOp) {
            writeAssembly(ACGstrs.THREE_PARAM, sub, op1, op2, op1);
        } else if (o instanceof StarOp) {
            if (expr.getType() instanceof FloatType)
                writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.FMULS_OP, op1, op2, op1);
            else
                writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".mul");
        } else if (o instanceof SlashOp) {
            if (expr.getType() instanceof FloatType)
                writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.FDIVS_OP, op1, op2, op1);
            else
                writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".div");
        } else if (o instanceof ModOp) {
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".rem");
        } else if (o instanceof BwAndOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.AND_OP, op1, op2, op1);
        } else if (o instanceof BwOrOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.OR_OP, op1, op2, op1);
        } else if (o instanceof BwXorOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.XOR_OP, op1, op2, op1);
        }


        if (!(expr.getType() instanceof FloatType) && (o instanceof StarOp || o instanceof SlashOp || o instanceof ModOp)) {
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%o0", "%o0");
        }

        storeIntoAddress(expr, "%o1", op1);
    }

    public void doComparisonOp(Operator o, STO expr, Vector<String> regs) {
        String op1 = regs.get(0);
        String op2 = regs.get(1);

        boolean floatExpr = op1.equals("%f0") || op2.equals("%f1");

        String cmp = ACGstrs.CMP_OP, ble = ACGstrs.BLE_OP, bl = ACGstrs.BL_OP, bge = ACGstrs.BGE_OP, bg = ACGstrs.BG_OP;
        String bne = ACGstrs.BNE_OP, be = ACGstrs.BE_OP;

        if (floatExpr) {
            cmp = ACGstrs.FCMPS_OP;
            ble = ACGstrs.FBLE_OP;
            bl = ACGstrs.FBL_OP;
            bge = ACGstrs.FBGE_OP;
            bg = ACGstrs.FBG_OP;
            bne = ACGstrs.FBNE_OP;
            be = ACGstrs.FBE_OP;
        }

        writeAssembly(ACGstrs.TWO_PARAM, cmp, op1, op2);
        if (floatExpr)
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        if (o instanceof GTOp) {
            writeAssembly(ACGstrs.ONE_PARAM, ble, ".$$.cmp." + m_cmpCount);
        } else if (o instanceof GTEOp) {
            writeAssembly(ACGstrs.ONE_PARAM, bl, ".$$.cmp." + m_cmpCount);
        } else if (o instanceof LTOp) {
            writeAssembly(ACGstrs.ONE_PARAM, bge, ".$$.cmp." + m_cmpCount);
        } else if (o instanceof LTEOp) {
            writeAssembly(ACGstrs.ONE_PARAM, bg, ".$$.cmp." + m_cmpCount);
        } else if (o instanceof EQUOp) {
            writeAssembly(ACGstrs.ONE_PARAM, bne, ".$$.cmp." + m_cmpCount);
        } else if (o instanceof NEQOp) {
            writeAssembly(ACGstrs.ONE_PARAM, be, ".$$.cmp." + m_cmpCount);
        }

        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%g0", "%o0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.INC_OP, "%o0");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.cmp." + m_cmpCount++);
        increaseIndent();

        storeIntoAddress(expr, "%o1", "%o0");
    }

    public void doShortCircuitLHS(STO a, Operator o) {
        String branch = ACGstrs.BE_OP;
        if (o instanceof OrOp) {
            branch = ACGstrs.BNE_OP;
        }

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Short Circuit LHS");
        loadSTO(a, "%l7", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, branch, ".$$.andorSkip." + m_shortCircuitCount);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();

        m_shortCircuitList.add(m_shortCircuitCount++ + "");
    }

    public void doShortCircuitRHS(STO a, Operator o, STO b, STO expr, String scOut) {
        String shortCircuitCount = m_shortCircuitList.get(m_shortCircuitList.size() - 1);
        String branch = ACGstrs.BE_OP;
        String first = "1";
        String second = "0";
        if (o instanceof OrOp) {
            branch = ACGstrs.BNE_OP;
            first = "0";
            second = "1";
        }

        if (scOut.equals("%o0")) {
            increaseIndent();
            writeAssembly(ACGstrs.NEWLINE);
            writeAssembly(ACGstrs.COMMENT, expr.getName());
            decreaseIndent();
        }

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Short Circuit RHS");
        loadSTO(b, "%l7", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, branch, ".$$.andorSkip." + shortCircuitCount);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BA_OP, ".$$.andorEnd." + shortCircuitCount);
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, first, scOut);
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.andorSkip." + shortCircuitCount);
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, second, scOut);
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.andorEnd." + shortCircuitCount);

        m_shortCircuitList.remove(m_shortCircuitList.size() - 1);

        if (scOut.equals("%o0")) {
            increaseIndent();
            storeIntoAddress(expr, "%o1", "%o0");
            decreaseIndent();
        }
    }

    // Other expressions
    //----------------------------------------------------------------

    public void doAssignExpr(STO left, STO right, FuncSTO func) {
        String stReg = "%o0";

        if (left.getType() instanceof FloatType) {
            stReg = "%f0";
        }

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, left.getName() + " = " + right.getName());
        setAddress(left, "%o1");
        loadSTO(right, "%l7", "%o0");
        assignFitos(left, right, func);
        writeAssembly(ACGstrs.ST, stReg, "%o1");
        decreaseIndent();
    }

    // Statements
    //----------------------------------------------------------------

    public void doIfStmt(STO expr) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "if ( " + expr.getName() + " )");


        // Folded constant
        if (!expr.hasAddress()) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((ConstSTO)expr).getIntValue() + "", "%o0");

        // Expr
        } else {
            loadSTO(expr, "%l7", "%o0");
        }

        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BE_OP, ".$$.else." + m_ifStmtCount);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        m_ifStmtList.add(m_ifStmtCount++ + "");
    }

    public void doIfStmt_2() {
        String currStmt = m_ifStmtList.get(m_ifStmtList.size()-1);

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BA_OP, ".$$.endif." + currStmt);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        decreaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "else");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.else." + currStmt);
        increaseIndent();
        increaseIndent();
        decreaseIndent();
    }

    public void doIfStmt_3() {
        String currStmt = m_ifStmtList.get(m_ifStmtList.size()-1);

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "endif");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.endif." + currStmt);

        m_ifStmtList.remove(m_ifStmtList.size()-1);
    }

    // Loops
    //----------------------------------------------------------------
    public void openLoop() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Start of loop body");
    }

    public void closeLoop() {
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "End of loop body");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BA_OP, ".$$.loopCheck." + m_loopList.get(m_loopList.size()-1));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.loopEnd." + m_loopList.get(m_loopList.size()-1));
        decreaseIndent();
        m_loopList.remove(m_loopList.size()-1);
    }

    public void doContinueStmt() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "continue");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BA_OP, ".$$.loopCheck." + m_loopList.get(m_loopList.size()-1));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();
    }

    public void doBreakStmt() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "break");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BA_OP, ".$$.loopEnd." + m_loopList.get(m_loopList.size()-1));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();
    }

    public void doWhileLoop_1() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "while ( ... )");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.loopCheck." + m_loopCount);
        increaseIndent();

        m_loopList.add(m_loopCount++ + "");
    }

    public void doWhileLoop_2(STO expr) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Check loop condition");
        loadSTO(expr, "%l7", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BE_OP, ".$$.loopEnd." + m_loopList.get(m_loopList.size()-1));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();
    }

    // Functions
    //----------------------------------------------------------------

    public String getFuncName(FuncSTO func) {
        Vector<STO> params= func.getParams();

        String functionName = func.getFuncName();

        if (params == null) {
            functionName += ".void";
        } else {
            for (int i = 0; i < params.size(); i++) {
                functionName += "." + params.get(i).getType().getName();
            }
        }

        return functionName;
    }

    public void doFuncDecl_1(String id, FuncSTO func) {
        String functionName = getFuncName(func);

        m_localStaticAppend = functionName + ".";

        increaseIndent();
        writeAssembly(ACGstrs.GLOBAL, id);
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, id);
        writeAssembly(ACGstrs.LABEL, functionName);
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "SAVE." + functionName, "%g1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "%g1", "%sp");
    }

    public void doFormalParams() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Store params");
        decreaseIndent();
    }

    public void doFuncDecl_2(String functionName, FuncSTO func) {
        String stackSize = func == null ? "0" : func.stackSize();

        if (functionName == null) {
            functionName = getFuncName(func);
        }

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "End of function " + functionName);
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, functionName + ".fini");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        writeAssembly("SAVE." + functionName + " = -(92 + " + stackSize + ") & -8\n");
        writeAssembly(ACGstrs.NEWLINE);

        decreaseIndent();

        writeAssembly(ACGstrs.LABEL, functionName + ".fini");
        increaseIndent();
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "-96", "%sp");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        decreaseIndent();

        m_localStaticAppend = "";
    }

    public void doVoidReturnStmt(FuncSTO func) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "return;");

        doCall(getFuncName(func) + ".fini");
        doReturn();
        decreaseIndent();
    }

    public void doReturnStmt(FuncSTO func, STO expr) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "return " + expr.getName() + ";");

        loadSTO(expr, "%l7", "%i0");

        doCall(getFuncName(func) + ".fini");
        doReturn();
        decreaseIndent();
    }

    public void doFuncCall(FuncSTO sto, Vector<STO> args) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, sto.getName() + "(...)");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, getFuncName(sto));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        storeIntoAddress(sto, "%o1", "%o0");

        decreaseIndent();
    }

    public void doExitStmt(STO expr) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "exit(" + expr.getName() + ")");
        loadSTO(expr, "%l7", "%o0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "exit");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();
    }

    // IO
    //----------------------------------------------------------------

    public void doEndLine() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "cout << endl");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ".$$.strEndl", "%o0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "printf");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();
    }

    public void doCin(STO sto) {
        String funcCall = "inputInt";
        String stReg = "%o0";

        if (sto.getType() instanceof FloatType) {
            funcCall = "inputFloat";
            stReg = "%f0";
        }

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "cin >> " + sto.getName());
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, funcCall);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        storeIntoAddress(sto, "%o1", stReg);
        decreaseIndent();
    }


    public void doCout(STO sto) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "cout << " + sto.getName());

        printFmt(sto);
        decreaseIndent();
    }

    public void doStringCout(ConstSTO sto) {
        increaseIndent();

        String label = loadString(sto.getStringLit());
        writeAssembly(ACGstrs.COMMENT, "cout << " + sto.getName());
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ".$$.strFmt", "%o0" );
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, label, "%o1" );

        printFmtCall(sto.getType());
        decreaseIndent();
    }

    public void printFmt(STO sto) {
        Type type = sto.getType();

        // Variable
        if (sto.hasAddress()) {
            if (type instanceof IntType) {
                setAddressLoad(sto, "%l7", "%o1");
            } else if (type instanceof BoolType) {
                setAddressLoad(sto, "%l7", "%o0");
            } else if (type instanceof FloatType) {
                setAddressLoad(sto, "%l7", "%f0");
            }

        // Constant
        } else {
            if (type instanceof IntType) {
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((ConstSTO)sto).getIntValue() + "", "%o1" );
            } else if (type instanceof BoolType) {
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((ConstSTO)sto).getIntValue() + "", "%o0" );
            } else if (type instanceof FloatType) {
                loadFloat(((ConstSTO)sto).getFloatValue() + "", "%l7", "%f0");
            }
        }

        printFmtCall(sto.getType());
    }

    public void printFmtCall(Type type) {
        if (type instanceof IntType) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ".$$.intFmt", "%o0");
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "printf");
        } else if (type instanceof BoolType) {
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".$$.printBool");
        } else if (type instanceof FloatType) {
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "printFloat");
        } else if (type instanceof StringType) {
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, "printf");
        }
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
    }


    public static void main(String args[]) {
//        AssemblyCodeGenerator myAsWriter = new AssemblyCodeGenerator("rc.s");
//
//        myAsWriter.increaseIndent();
//        myAsWriter.writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, String.valueOf(4095), "%l0");
//        myAsWriter.increaseIndent();
//        myAsWriter.writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, String.valueOf(1024), "%l1");
//        myAsWriter.decreaseIndent();
//
//        myAsWriter.writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, String.valueOf(512), "%l2");
//
//        myAsWriter.decreaseIndent();
//        myAsWriter.closeWriter();
    }



}
