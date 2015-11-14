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

    public static final String LABEL = "%s:\n";

    public static final String SET_OP = "set     ";
    public static final String MOV_OP = "mov     ";
    public static final String SAVE_OP = "save    ";
    public static final String CMP_OP = "cmp     ";
    public static final String BE_OP = "be      ";
    public static final String BNE_OP = "bne     ";
    public static final String BL_OP = "bl      ";
    public static final String BLE_OP = "ble     ";
    public static final String BG_OP = "bg      ";
    public static final String BGE_OP = "bge     ";
    public static final String NOP_OP = "nop     ";
    public static final String ADD_OP = "add     ";
    public static final String RET_OP = "ret     ";
    public static final String RESTORE_OP = "restore ";
    public static final String CALL_OP = "call    ";


    public static final String ZERO_PARAM = "%s\n";
    public static final String ONE_PARAM = "%s" + SEPARATOR + "%s\n";
    public static final String TWO_PARAM = "%s" + SEPARATOR + "%s, %s\n";
    public static final String THREE_PARAM = "%s" + SEPARATOR + "%s, %s, %s\n";


}
