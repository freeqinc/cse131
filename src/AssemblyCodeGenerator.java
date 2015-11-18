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
    private int m_ifStmtCount = 1;
    private int m_cmpCount = 1;
    private String m_localStaticAppend = "";


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
        setAddressLoad(expr, "%l7", loadRegister);
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

    public void doLocalVariable(STO sto, STO expr, boolean optStatic) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, sto.getName() + " = " + expr.getName());
        setAddress(sto, "%o1");


        // Handle float register
        String loadRegister = "%o0";
        if (sto.getType() instanceof FloatType)
            loadRegister = "%f0";

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
        setAddress(sto,set);
        writeAssembly(ACGstrs.ST, store, set);
    }

    public void loadSTO(STO sto, String set, String load) {

        // Variable
        if (sto.hasAddress() ) {
            setAddressLoad(sto, set, load);

        // Constant to load
        } else if (sto instanceof ConstSTO && ((ConstSTO) sto).hasValue()) {
            if (sto.getType() instanceof FloatType) {

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


    // Operators / Arithmetic
    //----------------------------------------------------------------

    // Unary ----
    public void doUnaryExpr(Operator o, STO a, STO expr) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, expr.getName());

        // - +
        if (o instanceof UnaryPlus || o instanceof UnaryMinus) {
            doUnarySignOp(o, a, expr);

        // -- ++
        } else if (o instanceof IncOp || o instanceof DecOp) {
            doIncDecOp(o, a, expr);
        }

        decreaseIndent();
    }

    public void doUnarySignOp(Operator o, STO a, STO expr) {
        loadSTO(a, "%l7", "%o0");

        if (o instanceof UnaryMinus) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.NEG_OP, "%o0", "%o0");
        } else if (o instanceof UnaryPlus) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%o0", "%o0");
        }

        storeIntoAddress(expr, "%o1", "%o0");
    }

    public void doIncDecOp(Operator o, STO a, STO expr) {
        String valueToStore = "%o0";

        loadSTO(a, "%l7", "%o0");

        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "1", "%o1");

        if (o instanceof DecOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SUB_OP, "%o0", "%o1", "%o2");
            if (((DecOp) o).isPre())
                valueToStore = "%o2";
        } else if (o instanceof IncOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%o0", "%o1", "%o2");
            if (((IncOp) o).isPre())
                valueToStore = "%o2";
        }


        storeIntoAddress(expr, "%o1", valueToStore);
        storeIntoAddress(a, "%o1", "%o2");
    }

    // Binary ----
    public void doBinaryExpr(STO a, Operator o, STO b, STO expr) {

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, expr.getName());

        loadSTO(a, "%l7", "%o0");
        loadSTO(b, "%l7", "%o1");

        // + - * / %
        if (o instanceof ArithmeticOp) {
            doIntArithmeticOp(o, expr);

        // & | ^
        } else if (o instanceof BitwiseOp) {
            doIntArithmeticOp(o, expr);

        // > < >= <= ==
        } else if (o instanceof ComparisonOp) {
            doComparisonOp(o, expr);
        }

        decreaseIndent();
    }

    public void doIntArithmeticOp(Operator o, STO expr) {

        if (o instanceof AddOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%o0", "%o1", "%o0");
        } else if (o instanceof MinusOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SUB_OP, "%o0", "%o1", "%o0");
        } else if (o instanceof StarOp) {
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".mul");
        } else if (o instanceof SlashOp) {
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".div");
        } else if (o instanceof ModOp) {
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, ".rem");
        } else if (o instanceof BwAndOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.AND_OP, "%o0", "%o1", "%o0");
        } else if (o instanceof BwOrOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.OR_OP, "%o0", "%o1", "%o0");
        } else if (o instanceof BwXorOp) {
            writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.XOR_OP, "%o0", "%o1", "%o0");
        }


        if (o instanceof StarOp || o instanceof SlashOp || o instanceof ModOp) {
            writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%o0", "%o0");
        }

        storeIntoAddress(expr, "%o1", "%o0");
    }

    public void doComparisonOp(Operator o, STO expr) {

        if (o instanceof GTOp) {
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.CMP_OP, "%o0", "%o1");
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BLE_OP, ".$$.cmp." + m_cmpCount);
            writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.MOV_OP, "%g0", "%o0");
            writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.INC_OP, "%o0");
            decreaseIndent();
            writeAssembly(ACGstrs.LABEL, ".$$.cmp." + m_cmpCount++);
            increaseIndent();
        }

        storeIntoAddress(expr, "%o1", "%o0");
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

    }

    public void doIfStmt_2() {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.BA_OP, ".$$.endif." + m_ifStmtCount);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        decreaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "else");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.else." + m_ifStmtCount);
        increaseIndent();
        increaseIndent();
        decreaseIndent();
    }

    public void doIfStmt_3() {
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "endif");
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, ".$$.endif." + m_ifStmtCount++);
    }

    // Functions
    //----------------------------------------------------------------

    public void doFuncDecl_1(String id, Type returnType, boolean optRef) {
        String functionName = id + "." + returnType.getName();
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
