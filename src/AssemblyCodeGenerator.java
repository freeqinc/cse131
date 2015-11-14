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


    public void doSTOLoad(STO sto, String set, String load) {
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, sto.getOffset(), set);
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, sto.getBase(), set, set);
        writeAssembly(ACGstrs.LD, set, load);
    }


    //----------------------------------------------------------------

    public void doUninitGlobalStatic(STO sto, boolean optStatic) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".bss");
        writeAssembly(ACGstrs.ALIGN, "4");
        if (!optStatic)
            writeAssembly(ACGstrs.GLOBAL, sto.getName());
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, sto.getName());
        increaseIndent();
        writeAssembly(ACGstrs.SKIP, "4");
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".text");
        writeAssembly(ACGstrs.ALIGN, "4");
        decreaseIndent();
    }

    public void doAssignFlush(STO sto, STO expr) {
        String functionName = ".$.init." + sto.getName();

        writeAssembly(ACGstrs.LABEL, functionName);
        increaseIndent();
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, "SAVE." + functionName, "%g1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "%g1", "%sp");
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);

        writeAssembly(ACGstrs.COMMENT, sto.getName() + " = " + expr.getName());
        writeAssembly(ACGstrs.TWO_PARAM, ACGstrs.SET_OP, sto.getName(), "%o1");
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.ADD_OP, "%g0", "%o1", "%o1");
        doSTOLoad(expr, "%l7", "%o0");
        writeAssembly(ACGstrs.ST, "%o0", "%o1");
        decreaseIndent();


        doFuncDecl_2(functionName);

        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".init");
        writeAssembly(ACGstrs.ALIGN, "4");
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, functionName);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".text");
        writeAssembly(ACGstrs.ALIGN, "4");
        decreaseIndent();

    }

    public void doInitGlobalStatic(STO sto, ConstSTO expr, boolean optStatic) {
        increaseIndent();
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".data");
        writeAssembly(ACGstrs.ALIGN, "4");
        if (!optStatic)
            writeAssembly(ACGstrs.GLOBAL, sto.getName());
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, sto.getName());
        increaseIndent();


        // if value is float
        if (sto.getType() instanceof FloatType) {
            writeAssembly(ACGstrs.SINGLE, expr.getFloatValue()+"");
        // if value is int or bool
        } else {
            writeAssembly(ACGstrs.WORD, expr.getIntValue()+"");
        }

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".text");
        writeAssembly(ACGstrs.ALIGN, "4");
        decreaseIndent();
    }

    public void doDesignatorID(STO sto) {
        doSTOLoad(sto, "%l7", "%o0");
    }

    public void doBinaryExpr(STO a, Operator o, STO b) {

    }

    //----------------------------------------------------------------

    public void doFuncDecl_1(String id, Type returnType, boolean optRef) {
        String functionName = id + "." + returnType.getName();

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

    public void doFuncDecl_2(String functionName) {
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.COMMENT, "End of function " + functionName);
        writeAssembly(ACGstrs.ONE_PARAM, ACGstrs.CALL_OP, functionName + ".fini");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.NOP_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        writeAssembly("SAVE." + functionName + " = -(92 + 0) & -8\n");
        writeAssembly(ACGstrs.NEWLINE);

        decreaseIndent();

        writeAssembly(ACGstrs.LABEL, functionName + ".fini");
        increaseIndent();
        writeAssembly(ACGstrs.THREE_PARAM, ACGstrs.SAVE_OP, "%sp", "-96", "%sp");
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RET_OP);
        writeAssembly(ACGstrs.ZERO_PARAM, ACGstrs.RESTORE_OP);
        decreaseIndent();
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
