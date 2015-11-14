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
    private String m_buffer = "";


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

    public void closeWriter() {
        try {
            m_fileWriter.close();
        } catch (IOException e) {
            System.err.println(ERROR_IO_CLOSE);
            e.printStackTrace();
            System.exit(1);
        }
    }

    public void writeDirectly(String str) {
        try {
            m_fileWriter.write(str);
            m_fileWriter.flush();
        } catch (IOException e){
            System.err.println(ERROR_IO_WRITE);
            e.printStackTrace();
        }
    }

    public void writeAssembly(String template, String ... params) {
        StringBuilder asStmt = new StringBuilder();

        for (int i = 0; i < m_indentLevel; i++) {
            asStmt.append(ACGstrs.SEPARATOR);
        }

        asStmt.append(String.format(template, (Object[]) params));

        try {
            m_fileWriter.write(asStmt.toString());
            m_fileWriter.flush();
        } catch (IOException e){
            System.err.println(ERROR_IO_WRITE);
            e.printStackTrace();
        }
    }

    public void bufferAssembly(String template, String ... params) {
        StringBuilder asStmt = new StringBuilder();

        for (int i = 0; i < m_indentLevel; i++) {
            asStmt.append(ACGstrs.SEPARATOR);
        }

        asStmt.append(String.format(template, (Object[]) params));

        m_buffer += asStmt.toString();
    }

    public void clearBuffer() {
        m_buffer = "";
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
        writeAssembly(ACGstrs.NEWLINE);
        decreaseIndent();
    }


    public void doUninitGlobalStatic(STO sto) {
        increaseIndent();
        writeAssembly(ACGstrs.SECTION, ".bss");
        writeAssembly(ACGstrs.ALIGN, "4");
        writeAssembly(ACGstrs.GLOBAL, sto.getName());
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, sto.getName());
        increaseIndent();
        writeAssembly(ACGstrs.SKIP, "4");
        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".text");
        writeAssembly(ACGstrs.ALIGN, "4");
        writeAssembly(ACGstrs.NEWLINE);
        decreaseIndent();
    }

    public void doInitGlobalStatic(STO sto, ConstSTO expr) {
        increaseIndent();
        writeAssembly(ACGstrs.SECTION, ".data");
        writeAssembly(ACGstrs.ALIGN, "4");
        writeAssembly(ACGstrs.GLOBAL, sto.getName());
        decreaseIndent();
        writeAssembly(ACGstrs.LABEL, sto.getName());
        increaseIndent();

        // if value is float
        if (expr.getType() instanceof FloatType) {
            writeAssembly(ACGstrs.SINGLE, expr.getFloatValue()+"");
        // if value is int or bool
        } else {
            writeAssembly(ACGstrs.WORD, expr.getIntValue()+"");
        }

        writeAssembly(ACGstrs.NEWLINE);
        writeAssembly(ACGstrs.SECTION, ".text");
        writeAssembly(ACGstrs.ALIGN, "4");
        writeAssembly(ACGstrs.NEWLINE);
        decreaseIndent();
    }

    public void doBinaryExpr(STO a, Operator o, STO b) {

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
