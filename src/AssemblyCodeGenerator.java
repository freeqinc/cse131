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
    private StructType m_currStruct = null;
    private int m_floatCount = 1;
    private int m_stringCount = 1;
    private int m_cmpCount = 1;
    private int m_ifStmtCount = 1;
    private int m_shortCircuitCount = 1;
    private int m_loopCount = 1;
    private int m_dtorCount = 1;
    private boolean m_inLocalFunction = false;
    private int m_localCtorsMade = 0;
    private String m_localStaticAppend = "";
    private boolean m_newStmtFlag = false;

    private ArrayList<String> m_ifStmtList = new ArrayList<String>();
    private ArrayList<String> m_shortCircuitList = new ArrayList<String>();
    private ArrayList<String> m_loopList = new ArrayList<String>();
    private ArrayList<STO> m_iteratorList = new ArrayList<STO>();
    private ArrayList<ArrayList<String>> m_ctorDtorList = new ArrayList<ArrayList<String>>();
    private ArrayList<ArrayList<String>> m_ctorDtorList_G = new ArrayList<ArrayList<String>>();
    private HashMap<String, Integer> m_staticMangle = new HashMap<String, Integer>();


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


        String mangle = "";
        if (!optStatic) {
            writeAssembly(ACGstrs.GLOBAL, sto.getName());
        } else {

            if (m_staticMangle.containsKey(sto.getName())) {
                mangle = "$" + m_staticMangle.get(sto.getName());
                m_staticMangle.put(sto.getName(), m_staticMangle.get(sto.getName())+1);
            } else {
                m_staticMangle.put(sto.getName(), 1);
            }

            sto.setOffset(m_localStaticAppend + sto.getName() + mangle);

        }
        decreaseIndent();


        writeAssembly(ACGstrs.LABEL,  m_localStaticAppend + sto.getName() + mangle);
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


        String mangle = "";

        if (!optStatic) {
            writeAssembly(ACGstrs.GLOBAL, sto.getName());
        } else {

            if (m_staticMangle.containsKey(sto.getName())) {
                mangle = "$" + m_staticMangle.get(sto.getName());
                m_staticMangle.put(sto.getName(), m_staticMangle.get(sto.getName())+1);
            } else {
                m_staticMangle.put(sto.getName(), 1);
            }

            sto.setOffset(m_localStaticAppend + sto.getName() + mangle);
        }
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, m_localStaticAppend + sto.getName() + mangle);
        increaseIndent();
        writeAssembly(ACGstrs.SKIP, sto.getType().getSize() + "");

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

    public void doInternalStaticFlush(STO sto, STO expr, FuncSTO currFunc) {
        String labelName = ".$.init." + getFuncName(currFunc) + "." + sto.getName();

        increaseIndent();
        doSection(".bss");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, labelName );
        increaseIndent();
        writeAssembly(ACGstrs.SKIP, sto.getType().getSize() + "");
        doSection(".text");

        String loadRegister = "%o0";
        if (sto.getType() instanceof FloatType)
            loadRegister = "%f0";

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Start init guard");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, labelName, "%o0");
        writeAssembly(ACGstrs.LD, "%o0", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BNE_OP, labelName + ".done");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        decreaseIndent();
        writeBuffer();
        increaseIndent();

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, sto.getName() + " = " + expr.getName());
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, sto.getOffset(), "%o1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%g0", "%o1", "%o1");
        loadSTO(expr, "%l7", "%o0");
        writeAssembly(ACGstrs.ST, loadRegister, "%o1");


        assignFitos(sto, expr, currFunc);


        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "End init guard");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, labelName, "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o1");
        writeAssembly(ACGstrs.ST, "%o1", "%o0");

        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, labelName + ".done");
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

        loadSTO(expr, "%l7", "%o0");

        assignFitos(sto, expr, func);

        writeAssembly(ACGstrs.ST, loadRegister, "%o1");
        decreaseIndent();
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
        if (sto.isReference()) {
            writeAssembly(ACGstrs.LD, set, set);
        }
    }

    public void setAddressNoDeref(STO sto, String set) {
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, sto.getOffset(), set);
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, sto.getBase(), set, set);
    }

    public void setAddressLoad(STO sto, String set, String load) {
        setAddress(sto, set);
        writeAssembly(ACGstrs.LD, set, load);
    }

    public void setAddressLoadNoDeref(STO sto, String set, String load) {
        setAddressNoDeref(sto, set);
        writeAssembly(ACGstrs.LD, set, load);
    }

    public void storeIntoAddress(STO sto, String set, String store) {
        setAddress(sto, set);
        writeAssembly(ACGstrs.ST, store, set);
    }

    public void storeIntoAddressNoDeref(STO sto, String set, String store) {
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, sto.getOffset(), set);
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, sto.getBase(), set, set);
        writeAssembly(ACGstrs.ST, store, set);
    }

    public void loadSTONoDeref(STO sto, String set, String load) {

        // Deal with float
        if (sto.getType() instanceof FloatType)
            load = "%f" + load.charAt(2);


        // Variable
        if (sto.hasAddress() ) {
            setAddressLoadNoDeref(sto, set, load);

            // Constant to load
        } else if (sto instanceof ConstSTO && ((ConstSTO) sto).hasValue()) {
            if (sto.getType() instanceof FloatType) {
                loadFloat(((ConstSTO) sto).getFloatValue() + "", set, load);
            } else {
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((ConstSTO) sto).getIntValue() + "", load);
            }
        }
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


    public void castFitos(Type type, STO sto, STO result, FuncSTO func) {
        if (type instanceof FloatType && !(sto.getType() instanceof FloatType)) {
            VarSTO padding = new VarSTO("padding", new FloatType());
            func.allocateLocalVar(padding);
            storeIntoAddress(padding, "%l7", "%o0");
            writeAssembly(ACGstrs.LD, "%l7", "%f0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FITOS_OP, "%f0", "%f0");
            storeIntoAddress(result, "%o1", "%f0");
        } else {
            storeIntoAddress(result, "%o1", "%o0");
        }
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

    public void assignFitos(STO left, STO right, FuncSTO func, int reg) {
        if (left.getType() instanceof FloatType && !(right.getType() instanceof FloatType)) {
            VarSTO padding = new VarSTO("padding", new FloatType());
            func.allocateLocalVar(padding);
            storeIntoAddress(padding, "%l7", "%o" + reg);
            writeAssembly(ACGstrs.LD, "%l7", "%f" + reg);
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FITOS_OP, "%f" + reg, "%f" + reg);
        }
    }

    public void assignFitosReturnStmt(STO left, STO right, FuncSTO func) {
        if (left.getType() instanceof FloatType && !(right.getType() instanceof FloatType)) {
            VarSTO padding = new VarSTO("padding", new FloatType());
            func.allocateLocalVar(padding);
            storeIntoAddress(padding, "%l7", "%i0");
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

        if (a.getType() instanceof PointerType) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((PointerType)a.getType()).deReference().getSize() + "", "%o1");
        } else if (expr.getType() instanceof FloatType) {
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

    public void doAssignCompositeExpr(STO left, STO right, FuncSTO func) {
        String stReg = "%o0";

        if (left.getType() instanceof FloatType) {
            stReg = "%f0";
        }

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, left.getName() + " = " + right.getName());
        setAddress(left, "%o0");
        setAddress(right, "%o1");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, left.getType().getSize() + "", "%o2");
        doCall("memmove");
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

    public void doNewStmt(STO sto) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "new( " + sto.getName() + " )");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((PointerType) sto.getType()).deReference().getSize() + "", "%o1");
        doCall("calloc");
        storeIntoAddress(sto, "%o1", "%o0");
        decreaseIndent();

        if (((PointerType) sto.getType()).deReference() instanceof StructType)
            m_newStmtFlag = true;
    }

    public void doDeleteStmt(STO sto) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "delete( " + sto.getName() + " )");
        loadSTO(sto, "%l7", "%o0");
        doCall(".$$.ptrCheck");
        loadSTO(sto, "%l7", "%o0");
        doCall("free");
        storeIntoAddress(sto, "%o1", "%g0");
        decreaseIndent();
    }

    public void callDtor(STO sto, FuncSTO func, String id) {
        VarSTO starred = new VarSTO("*" + sto.getName());
        doDesignatorStar(sto, starred, func);

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, starred.getName() + ".~" + id + "(...)");
        setAddressNoDeref(starred, "%o0");
        writeAssembly(ACGstrs.LD, "%o0", "%o0");
        doCall(id+".$"+id+".void");
        decreaseIndent();
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


    public void doForEach_1(STO iter, STO arr, FuncSTO func, boolean optref) {
        String size = "4";
        size = ((ArrayType)arr.getType()).next().getSize() + "";


        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "foreach ( ... )");
        writeAssembly(ACGstrs.COMMENT, "traversal ptr = --array");
        setAddress(arr, "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, size, "%o1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SUB_OP, "%o0", "%o1", "%o0");

        VarSTO traversalPtr = new VarSTO("traversalPtr", new IntType());
        func.allocateLocalVar(traversalPtr);
        m_iteratorList.add(traversalPtr);

        storeIntoAddress(traversalPtr, "%o1", "%o0");

        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.loopCheck." + m_loopCount);
        m_loopList.add(m_loopCount++ + "");
        increaseIndent();

        increaseIndent();
        writeAssembly(ACGstrs.COMMENT, "++traversal ptr");
        loadSTO(m_iteratorList.get(m_iteratorList.size() - 1), "%o1", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, size, "%o2");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%o0", "%o2", "%o0");
        writeAssembly(ACGstrs.ST, "%o0", "%o1");

        writeAssembly(ACGstrs.COMMENT, "traversal ptr < array end addr?");
        setAddress(arr, "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, arr.getType().getSize() + "", "%o1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%o0", "%o1", "%o1");
        loadSTO(m_iteratorList.get(m_iteratorList.size() - 1), "%o0", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%o1");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BGE_OP, ".$$.loopEnd." + m_loopList.get(m_loopList.size()-1));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        writeAssembly(ACGstrs.COMMENT, "iterVar = currentElem");
        setAddressNoDeref(iter, "%o1");
        if ((iter.getType() instanceof FloatType) && !(((ArrayType) arr.getType()).getBaseType() instanceof FloatType)) {
            writeAssembly(ACGstrs.LD, "%o0", "%f0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FITOS_OP, "%f0", "%f0");
            writeAssembly(ACGstrs.ST, "%f0", "%o1");
        } else {
            if (!optref)
                writeAssembly(ACGstrs.LD, "%o0", "%o0");
            writeAssembly(ACGstrs.ST, "%o0", "%o1");
        }


        decreaseIndent();
    }

    // Structs
    //----------------------------------------------------------------

    public void doStructOpen(StructType struct) {
        m_currStruct = struct;
    }

    public void doStructClose() {
        m_currStruct = null;
    }

    public void doStructCtor(String id, FuncSTO ctor, Vector<STO> params) {
        doFuncDecl_1(id, ctor);
        doFormalParams(params);
        doFuncDecl_2(null, ctor);
    }

    public void doStructCtor_2(String id, FuncSTO ctor, Vector<STO> params) {
        FuncSTO ctor2 = new FuncSTO("$" + id);
        ctor2.setReturnType(new VoidType());


        doFuncDecl_1("$" + id, ctor2);
        doFormalParams(params);
        doFuncDecl_2(null, ctor2);
    }

    public void doStructCtorCall(StructType sType, STO var, FuncSTO ctor, Vector<STO> args, FuncSTO currFunc) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, var.getName() + "." + sType.getId() + "(...)");
        setAddressNoDeref(var, "%o0");


        if (args != null) {
            Vector<STO> params = ctor.getParams();
            STO param;
            STO arg;
            String setReg;

            for (int i = 0; i < args.size(); i++) {
                param = params.get(i);
                arg = args.get(i);
                setReg = (arg.getType() instanceof FloatType) ? "f" : "o";

                writeAssembly(ACGstrs.COMMENT, param.getName() + " <- " + arg.getName());
                if (param.isReference()) {
                    setAddress(arg, "%o" + (i + 1));
                } else {
                    loadSTO(arg, "%l7", "%" + setReg + (i + 1));
                }

                assignFitos(param, arg, currFunc, i + 1);
            }
        }

        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, getFuncName(ctor));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        decreaseIndent();

        doDtorSetup(var, sType.getId(), currFunc);
    }

    public void doDtorSetup(STO sto, String structID, FuncSTO currFunc) {
        if (m_newStmtFlag) {
            m_newStmtFlag = false;
            return;
        }

        increaseIndent();
        doSection(".bss");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.ctorDtor." + m_dtorCount);

        ArrayList<String> entry = new ArrayList<String>();
        entry.add(".$$.ctorDtor." + m_dtorCount);
        entry.add(structID + ".$" + structID + ".void");

//        System.out.println(sto.getName() + " " + sto.getBase() + " " + m_dtorCount);
        STO checker = sto.arrayParent() != null ? sto.arrayParent() : sto;
        if (m_inLocalFunction && !checker.getBase().equals("%g0")) {
            m_ctorDtorList.add(entry);
        } else {
            m_ctorDtorList_G.add(entry);
        }

        increaseIndent();
        writeAssembly(ACGstrs.SKIP, "4");
        doSection(".text");
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ".$$.ctorDtor." + m_dtorCount++, "%o0");
        if (sto.belongsTo() != null) {
            setAddress(sto.belongsTo(), "%o1");
        } else {
            setAddress(sto, "%o1");
        }
        writeAssembly(ACGstrs.ST, "%o1", "%o0");
        decreaseIndent();


//        if (m_inLocalFunction)
//            m_localCtorsMade++;
    }

    public void doDtorTeardowns() {
        String dtorLabel;
        String dtorName;

        int size = m_ctorDtorList.size();
        for (int i = 0; i < size; i++) {
            dtorLabel = m_ctorDtorList.get(m_ctorDtorList.size()-1).get(0);
            dtorName = m_ctorDtorList.get(m_ctorDtorList.size()-1).get(1);

            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, dtorLabel, "%o0");
            writeAssembly(ACGstrs.LD, "%o0", "%o0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BE_OP, dtorLabel + ".fini.skip");
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
            doCall(dtorName);
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, dtorLabel, "%o0");
            writeAssembly(ACGstrs.ST, "%g0", "%o0");

            decreaseIndent();
            writeAssembly(ACGstrs.LABEL, dtorLabel + ".fini.skip");
            increaseIndent();

            m_ctorDtorList.remove(m_ctorDtorList.size()-1);
        }
    }

    public void doDtorTeardowns_G() {
        String dtorLabel;
        String dtorName;

        int size = m_ctorDtorList_G.size();
        for (int i = 0; i < size; i++) {
            dtorLabel = m_ctorDtorList_G.get(m_ctorDtorList_G.size()-1).get(0);
            dtorName = m_ctorDtorList_G.get(m_ctorDtorList_G.size()-1).get(1);

            writeAssembly(ACGstrs.LABEL, dtorLabel + ".fini");
            increaseIndent();
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "-96", "%sp");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, dtorLabel, "%o0");
            writeAssembly(ACGstrs.LD, "%o0", "%o0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BE_OP, dtorLabel + ".fini.skip");
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
            doCall(dtorName);
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, dtorLabel, "%o0");
            writeAssembly(ACGstrs.ST, "%g0", "%o0");

            decreaseIndent();
            writeAssembly(ACGstrs.LABEL, dtorLabel + ".fini.skip");
            increaseIndent();
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);

            doSection(".fini");
            doCall(dtorLabel + ".fini");
            doSection(".text");
            decreaseIndent();

            m_ctorDtorList_G.remove(m_ctorDtorList_G.size()-1);
        }
    }


    public void doStructInst(STO sto, FuncSTO bufferFunc) {
        String functionName = ".$.init." + sto.getName();

        writeAssembly(ACGstrs.LABEL, functionName);
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "SAVE." + functionName, "%g1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "%g1", "%sp");

        writeBuffer();

        doFuncDecl_2(functionName, bufferFunc);

        increaseIndent();
        doSection(".init");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, functionName);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        doSection(".text");
        decreaseIndent();
    }

    public void doStaticStructInst(STO sto, FuncSTO currFunc) {
        String labelName = ".$.init." + getFuncName(currFunc) + "." + sto.getName();

        increaseIndent();
        doSection(".bss");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, labelName );
        increaseIndent();
        writeAssembly(ACGstrs.SKIP, "4");
        doSection(".text");

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Start init guard");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, labelName, "%o0");
        writeAssembly(ACGstrs.LD, "%o0", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BNE_OP, labelName + ".done");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        decreaseIndent();
        writeBuffer();
        increaseIndent();


        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "End init guard");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, labelName, "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o1");
        writeAssembly(ACGstrs.ST, "%o1", "%o0");

        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, labelName + ".done");
    }

    public void doStructArrayInst(STO sto, FuncSTO func) {
        String functionName = ".$.init." + sto.getName();

        writeAssembly(ACGstrs.LABEL, functionName);
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "SAVE." + functionName, "%g1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "%g1", "%sp");

        writeBuffer();

        doFuncDecl_2(functionName, func);

        increaseIndent();
        doSection(".init");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, functionName);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        doSection(".text");
        decreaseIndent();

    }

    public void doStaticStructArrayInst(STO sto, FuncSTO currFunc) {
        String labelName = ".$.init." + getFuncName(currFunc) + "." + sto.getName();

        increaseIndent();
        doSection(".bss");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, labelName );
        increaseIndent();
        writeAssembly(ACGstrs.SKIP, "4");
        doSection(".text");


        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Start init guard");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, labelName, "%o0");
        writeAssembly(ACGstrs.LD, "%o0", "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BNE_OP, labelName + ".done");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        decreaseIndent();
        writeBuffer();
        increaseIndent();

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "End init guard");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, labelName, "%o0");
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o1");
        writeAssembly(ACGstrs.ST, "%o1", "%o0");

        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, labelName + ".done");
    }

    // Designators
    //----------------------------------------------------------------

    public void doDesignatorDot(String member, STO sto, STO result, FuncSTO func) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, result.getName());

        if (sto.getName().equals("this"))
            setAddress(sto, "%o0");
        else
            setAddress(sto, "%o0");

        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((StructType)sto.getType()).offsetOf(member) + "", "%o1" );
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%g0", "%o1", "%o1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%o0", "%o1", "%o0");

        if (result instanceof FuncSTO) {
        } else {
            func.allocateLocalVarPtr(result);
        }
        storeIntoAddressNoDeref(result, "%o1", "%o0");
        decreaseIndent();
    }

    public void doDesignatorAmpersand(STO sto, STO result, FuncSTO func) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, result.getName());
        setAddress(sto, "%o0");

        func.allocateLocalVar(result);
        storeIntoAddress(result, "%o1", "%o0");
        decreaseIndent();
    }

    public void doDesignatorStar(STO sto, STO result, FuncSTO func) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, result.getName());
        loadSTO(sto, "%l7", "%o0");
        doCall(".$$.ptrCheck");
        func.allocateLocalVarPtr(result);
        storeIntoAddress(result, "%o1", "%o0");
        result.setReference();
        decreaseIndent();
    }

    public void doDesignatorBracket(STO sto, STO expr, STO result, FuncSTO func) {
        String multiplier = "4";

        if (sto.getType() instanceof ArrayType) {
            multiplier = ((ArrayType) sto.getType()).next().getSize() + "";
        } else if (sto.getType() instanceof PointerType) {
            multiplier = ((PointerType) sto.getType()).deReference().getSize() + "";
        }

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, result.getName());
        loadSTO(expr, "%l7", "%o0");

        if (sto.getType() instanceof ArrayType) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, ((ArrayType) sto.getType()).getDimSize() + "", "%o1");
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".$$.arrCheck");
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        }

        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, multiplier, "%o1");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".mul");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%o0", "%o1");

        if (sto.getType() instanceof ArrayType) {
            setAddress(sto, "%o0");
        } else if (sto.getType() instanceof PointerType) {
            loadSTO(sto, "%l7", "%o0");
        }

        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".$$.ptrCheck");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        if (result.isReference()) {
            func.allocateLocalVarPtr(result);
        } else {
            func.allocateLocalVar(result);
        }

        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%o0", "%o1", "%o0");
        storeIntoAddressNoDeref(result, "%o1", "%o0");

        decreaseIndent();

    }


    public void doDesignatorCast(Type type, STO sto, STO result, FuncSTO func) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, result.getName());
        loadSTO(sto, "%l7", "%o0");

        func.allocateLocalVar(result);


        // bool -> int float pointer
        if (sto.getType() instanceof BoolType) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BE_OP, ".$$.cmp." + m_cmpCount);
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%g0", "%o0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o0");
            decreaseIndent();
            writeAssembly(ACGstrs.LABEL, ".$$.cmp." + m_cmpCount++);
            increaseIndent();

        // int float pointer -> bool
        } else if (type instanceof BoolType) {

            if (sto.getType() instanceof FloatType) {
                VarSTO padding = new VarSTO("padding", new FloatType());
                func.allocateLocalVar(padding);
                storeIntoAddress(padding, "%l7", "%g0");
                writeAssembly(ACGstrs.LD, "%l7", "%f1");
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FITOS_OP, "%f1", "%f1");
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FCMPS_OP, "%f0", "%f1");
                writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
                writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.FBE_OP, ".$$.cmp." + m_cmpCount);
            } else {
                writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%g0");
                writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BE_OP, ".$$.cmp." + m_cmpCount);
            }

            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%g0", "%o0");
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "1", "%o0");
            decreaseIndent();
            writeAssembly(ACGstrs.LABEL, ".$$.cmp." + m_cmpCount++);
            increaseIndent();

        // float -> int pointer
        } else if (sto.getType() instanceof FloatType && !(type instanceof FloatType)) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.FSTOI_OP, "%f0", "%f0");
        }


        if (sto.getType() instanceof FloatType && !(type instanceof BoolType)) {
            storeIntoAddress(result, "%o1", "%f0");
        } else {
            castFitos(type, sto, result, func);
        }


        decreaseIndent();
    }

    // Arrays
    //----------------------------------------------------------------

    // Functions
    //----------------------------------------------------------------

    public String getFuncName(FuncSTO func) {
        Vector<STO> params = func.getParams();

        String functionName = func.getFuncName();

        if (m_currStruct != null) {
            functionName = m_currStruct.getId() + "." + functionName;
        } else if (func.memberOf() != null) {
            functionName = func.memberOf() + "." + functionName;
        }

        if (func.isExtern()) {

        } else if (params == null) {
            functionName += ".void";
        } else if (params.size() == 0) {
            functionName += ".void";
        } else {
            for (int i = 0; i < params.size(); i++) {
                functionName += "." + params.get(i).getType().getName();
            }
        }

        functionName = functionName.replace("[", "$");
        functionName = functionName.replace("]", "$");
        functionName = functionName.replace("*", "$");

        return functionName;
    }

    public void doFuncDecl_1(String id, FuncSTO func) {
        m_localCtorsMade = 0;
        m_inLocalFunction = true;

        String functionName = getFuncName(func);

        m_localStaticAppend = functionName + ".";
        m_staticMangle.clear();

        if (!func.isOverloaded() && m_currStruct == null) {
            increaseIndent();
            writeAssembly(ACGstrs.GLOBAL, id);
            decreaseIndent();
            writeAssembly(ACGstrs.LABEL, id);
        }
        writeAssembly(ACGstrs.LABEL, functionName);
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "SAVE." + functionName, "%g1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "%g1", "%sp");
    }

    public void doFormalParams(Vector<STO> params) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "Store params");

        int shift = 0;
        if (m_currStruct != null) {
            writeAssembly(ACGstrs.ST, "%i0" , "%fp+68" );
            shift += 1;
        }

        int i = 0;
        if (params != null) {
            STO param;
            String stReg;

            for (i = 0; i < params.size(); i++) {
                param = params.get(i);
                stReg = "%i" + (i + shift);
                if ((param.getType() instanceof FloatType) && !param.isReference()) {
                    stReg = "%f" + (i + shift);
                }

                param.setOffset((Integer.parseInt(param.getOffset()) + (shift * 4)) + "");
                writeAssembly(ACGstrs.ST, stReg, param.getBase() + "+" + param.getOffset());
            }

        }


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

        doDtorTeardowns();

        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        decreaseIndent();

        m_localStaticAppend = "";
        m_inLocalFunction = false;
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

        if (func.returnsByReference()) {
            setAddress(expr, "%i0");
        } else {
            loadSTO(expr, "%l7", "%i0");
        }

        assignFitosReturnStmt(new VarSTO("temp", func.getReturnType()), expr, func);

        doCall(getFuncName(func) + ".fini");
        doReturn();
        decreaseIndent();
    }

    public void doFuncCall(FuncSTO sto, Vector<STO> args, FuncSTO currFunc) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);


        int shift = 0;
        if (sto.memberOf() != null) {
            writeAssembly(ACGstrs.COMMENT, sto.belongsTo().getName() + "." + sto.getName() + "(...)");
            setAddress(sto.belongsTo(), "%o0");
            shift += 1;
        } else {
            writeAssembly(ACGstrs.COMMENT, sto.getName() + "(...)");
        }


        if (args != null) {
            Vector<STO> params = sto.getParams();
            STO param;
            STO arg;
            String setReg;

            for (int i = 0; i < args.size(); i++) {
                param = params.get(i);
                arg = args.get(i);
                setReg = (arg.getType() instanceof FloatType) ? "f" : "o";

                writeAssembly(ACGstrs.COMMENT, param.getName() + " <- " + arg.getName());
                if (param.isReference()) {
                    setAddress(arg, "%o" + (i + shift));
                } else {
                    loadSTO(arg, "%l7", "%" + setReg + (i + shift));
                }

                assignFitos(param, arg, currFunc, i);
            }
        }

        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, getFuncName(sto));
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        if (!(sto.getReturnType() instanceof VoidType)) {
            if (sto.getReturnType() instanceof FloatType && !sto.returnsByReference())
                storeIntoAddress(sto, "%o1", "%f0");
            else
                storeIntoAddress(sto, "%o1", "%o0");
        }

        decreaseIndent();

        if (sto.memberOf() != null && sto.memberOf().equals(sto.getName())) {
                doDtorSetup(sto.belongsTo(), sto.memberOf(), currFunc);
        }
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
