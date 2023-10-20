*&---------------------------------------------------------------------*
*& Report z003_abap_cal2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_abap_cal2.

PARAMETERS num1 TYPE p LENGTH 16 DECIMALS 2.
PARAMETERS num2 TYPE p LENGTH 16 DECIMALS 2.
DATA result_i TYPE p LENGTH 16 DECIMALS 2.

PARAMETERS p_add RADIOBUTTON GROUP opts.
PARAMETERS p_mns RADIOBUTTON GROUP opts.
PARAMETERS p_mltpl RADIOBUTTON GROUP opts.
PARAMETERS p_div RADIOBUTTON GROUP opts.
PARAMETERS p_xpon RADIOBUTTON GROUP opts.
PARAMETERS p_sr RADIOBUTTON GROUP opts.
PARAMETERS p_perc RADIOBUTTON GROUP opts.
DATA op TYPE c.

CASE abap_true.
    WHEN p_add.
    op = '+'.
     WHEN p_mns.
    op = '-'.
     WHEN p_mltpl.
    op = '*'.
    WHEN p_div.
    op = '/'.
    WHEN p_xpon.
    op = '**'.
    WHEN p_perc.
    op = '%'.
    WHEN p_sr.
    op = 'sr'.
ENDCASE.

IF ( num1 = 0 OR num2 = 0 ) AND op = '/'.
    message e002(z003).
ELSE.
    CASE op.
        WHEN '+'.
            result_i = num1 + num2.
            WRITE / | { num1 } + { num2 } =  { result_i }|.
        WHEN '-'.
            result_i = num1 - num2.
            WRITE / | { num1 } - { num2 } =  { result_i }|.
        WHEN '*'.
            result_i = num1 * num2.
            WRITE / | { num1 } * { num2 } =  { result_i }|.
        WHEN '/'.
            result_i = num1 / num2.
            WRITE / | { num1 } / { num2 } =  { result_i }|.
        WHEN '**'.
            result_i = num1 ** num2.
            WRITE / | { num1 } ** { num2 } =  { result_i }|.
        WHEN '%'.
            DATA(result) = zcl_003_cal2=>percentage( value1 = num1 value2 = num2 ). "Wertübergabe
            WRITE / |{ num1 } % von { num2 } = { result }|.
        WHEN 'sr'.
            result_i = sqrt( num1 ).
            WRITE / | squareroot { num1 } =  { result_i }|.
        WHEN OTHERS.
            WRITE / |Error!|.
    ENDCASE.
ENDIF.
