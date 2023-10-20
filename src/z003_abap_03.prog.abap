*&---------------------------------------------------------------------*
*& Report z003_abap_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_abap_03.

PARAMETERS p_op1 TYPE z003_operand_1.
PARAMETERS p_opr.
PARAMETERS p_op2 TYPE z003_operand_2.

TYPES ty_decimal TYPE p LENGTH 16 DECIMALS 2.
DATA result TYPE ty_decimal.

**********************************************************************
* Eingabeprüfungen
**********************************************************************
AT SELECTION-SCREEN ON p_opr.
  IF p_opr <> '+' AND p_opr <> '-' AND p_opr <> '*' AND p_opr <> '/'.
    MESSAGE e003(z003) WITH p_opr.
  ENDIF.

AT SELECTION-SCREEN ON p_op2.
  IF p_opr = '/' AND p_op2 IS INITIAL.
    MESSAGE e002(z003).
  ENDIF.

**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.
  CASE p_opr.
    WHEN '+'.
      result = p_op1 + p_op2.
    WHEN '-'.
      result = p_op1 - p_op2.
    WHEN '*'.
      result = p_op1 * p_op2.
    WHEN '/'.
      result = p_op1 / p_op2.
  ENDCASE.

  WRITE |{ p_op1 } { p_opr } { p_op2 } = { result }|.
