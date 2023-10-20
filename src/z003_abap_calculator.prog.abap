*&---------------------------------------------------------------------*
*& Report z003_abap_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_abap_calculator.

PARAMETERS num1 TYPE i.
PARAMETERS op TYPE c LENGTH 2.
PARAMETERS num2 TYPE i.
DATA result_i TYPE i.

IF ( num1 = 0 OR num2 = 0 ) AND op = '/'.
    WRITE / |Fehler!|.
ELSE.
CASE op.
WHEN '+'.
    result_i = num1 + num2.
    WRITE / | { num1 } + { num2 } =  { result_i }|.
WHEN '-'.
    result_i = Num1 - num2.
    WRITE / | { num1 } - { num2 } =  { result_i }|.
WHEN '*'.
    result_i = num1 * num2.
    WRITE / | { num1 } * { num2 } =  { result_i }|.
WHEN '/'.
    result_i = Num1 / num2.
    WRITE / | { num1 } / { num2 } =  { result_i }|.
WHEN '**'.
    result_i = Num1 ** num2.
    WRITE / | { num1 } ** { num2 } =  { result_i }|.
WHEN OTHERS.
    WRITE / |Error!|.
ENDCASE.
ENDIF.
