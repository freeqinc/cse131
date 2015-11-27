/**
 * Created by FreeQinC on 11/11/15.
 */
public final class ACGstrs {
    // file header
    public static final String FILE_HEADER =
            "\t\n/*\n" +
                    " * Jesse Qin's CSE131 Compiler Generated %s\n" +
                    " */\n\n";

    // separator
    public static final String SEPARATOR = "\t";

    // string templates

    public static final String NEWLINE = "\n";

    public static final String SECTION = ".section" + SEPARATOR + "\"%s\"\n";
    public static final String ALIGN = ".align  " + SEPARATOR + "%s\n";
    public static final String GLOBAL = ".global " + SEPARATOR + "%s\n";
    public static final String SKIP = ".skip   " + SEPARATOR + "%s\n";
    public static final String WORD = ".word   " + SEPARATOR + "%s\n";
    public static final String SINGLE = ".single " + SEPARATOR + "0r%s\n";
    public static final String ASCIZ = ".asciz  " + SEPARATOR + "\"%s\"\n";

    public static final String LD = "ld      " + SEPARATOR + "[%s], %s\n";
    public static final String ST = "st      " + SEPARATOR + "%s, [%s]\n";

    public static final String LABEL = "%s:\n";
    public static final String COMMENT = "! %s\n";

    public static final String SET_OP = "set     ";
    public static final String MOV_OP = "mov     ";
    public static final String FMOVS_OP = "fmovs   ";
    public static final String SAVE_OP = "save    ";
    public static final String CMP_OP = "cmp     ";
    public static final String FCMPS_OP = "fcmps   ";
    public static final String BA_OP = "ba      ";
    public static final String BE_OP = "be      ";
    public static final String FBE_OP = "fbe     ";
    public static final String BNE_OP = "bne     ";
    public static final String FBNE_OP = "fbne    ";
    public static final String BL_OP = "bl      ";
    public static final String FBL_OP = "fbl     ";
    public static final String BLE_OP = "ble     ";
    public static final String FBLE_OP = "fble    ";
    public static final String BG_OP = "bg      ";
    public static final String FBG_OP = "fbg     ";
    public static final String BGE_OP = "bge     ";
    public static final String FBGE_OP = "fbge    ";
    public static final String NOP_OP = "nop     ";
    public static final String ADD_OP = "add     ";
    public static final String FADDS_OP = "fadds   ";
    public static final String SUB_OP = "sub     ";
    public static final String FSUBS_OP = "fsubs   ";
    public static final String AND_OP = "and     ";
    public static final String NEG_OP = "neg     ";
    public static final String FNEGS_OP = "fnegs   ";
    public static final String OR_OP = "or      ";
    public static final String XOR_OP = "xor     ";
    public static final String RET_OP = "ret     ";
    public static final String INC_OP = "inc     ";
    public static final String DEC_OP = "dec     ";
    public static final String RESTORE_OP = "restore ";
    public static final String CALL_OP = "call    ";
    public static final String FDIVS_OP = "fdivs   ";
    public static final String FMULS_OP = "fmuls   ";
    public static final String FITOS_OP = "fitos   ";
    public static final String FSTOI_OP = "fstoi   ";



    public static final String ZERO_PARAM = "%s\n";
    public static final String ONE_PARAM = "%s" + SEPARATOR + "%s\n";
    public static final String TWO_PARAM = "%s" + SEPARATOR + "%s, %s\n";
    public static final String THREE_PARAM = "%s" + SEPARATOR + "%s, %s, %s\n";


    public String getOp(String operator) {
        String res = "";

        switch (operator) {
            case "+":
                res = ADD_OP;
                break;
            case "&&":
                res = BE_OP;
                break;
            case "&":
                res = AND_OP;
                break;
            case "|":
                res = OR_OP;
                break;
            case "^":
                res = XOR_OP;
                break;
            case "--":
                res = SUB_OP;
                break;
            case "==":
                res = BE_OP;
                break;
            case ">=":
                res = BGE_OP;
                break;
            case ">":
                res = BG_OP;
                break;
            case "++":
                res = ADD_OP;
                break;
            case "<=":
                res = BLE_OP;
                break;
            case "<":
                res = BL_OP;
                break;
            case "-":
                res = SUB_OP;
                break;
            case "%":
                res = CALL_OP;
                break;

        }

        return res;
    }


}
