*&---------------------------------------------------------------------*
*& Report z003_demo_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_demo_08.

**********************************************************************
* Definitionen & Deklarationen
**********************************************************************

PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_cid2 TYPE s_carr_id.
PARAMETERS p_chckbx AS CHECKBOX.

PARAMETERS p_opt1 RADIOBUTTON GROUP opts.
PARAMETERS p_opt2 RADIOBUTTON GROUP opts.
PARAMETERS p_opt3 RADIOBUTTON GROUP opts.

**********************************************************************
* Dynamische Vorbelegungen
**********************************************************************
INITIALIZATION.
    if sy-langu = 'E'.
        p_chckbx = abap_true.
    endif.


**********************************************************************
* Eingabeprüfungen
**********************************************************************
AT SELECTION-SCREEN on p_chckbx.
IF p_chckbx = 'X'.  "IF p_chckbx = abap_true.
    message e000(z003) WITH sy-uname.    "Buchstabe Nachrichtentyp z.B. i/s/e, Nachrichtennummer
ENDIF.

**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.
CASE abap_true.
    WHEN p_opt1.
    WRITE / 'Option 1 gesetzt'.
     WHEN p_opt2.
    WRITE / 'Option 2 gesetzt'.
     WHEN p_opt3.
    WRITE / 'Option 3 gesetzt'.
ENDCASE.
