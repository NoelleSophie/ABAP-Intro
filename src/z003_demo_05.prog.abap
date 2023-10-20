*&---------------------------------------------------------------------*
*& Report z003_demo_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_demo_05.

DATA carrier_id TYPE s_carr_id VALUE 'LH'.
DATA flight_date TYPE s_date VALUE '20231016'.
DATA error.

**********************************************************************
* Vergleichsoperatoren & Logische Operatoren
**********************************************************************
* Vergleichsoperatoren: >, >=, <, <=, =, <> ( ungleich )
* Logische Operatoren:  AND, OR, NOT

**********************************************************************
* Einfachverzweigungen
**********************************************************************
IF flight_date >= '20230101' AND flight_date <= '20231231' OR NOT carrier_id = 'UA'. "AND stärker als OR
    WRITE 'Bedingung erfüllt'.
ELSE.
    WRITE 'Bedingung nicht erfüllt'.
ENDIF.

IF error IS NOT INITIAL. " IF eeror = abap_true. "IF error = 'X'
    WRITE 'Fehler'.
ENDIF.

**********************************************************************
* Komplexe Fallunterscheidungen
**********************************************************************
CASE carrier_id.
    WHEN 'LH'.
        WRITE 'Lufthansa'.
    WHEN 'UA'.
        WRITE 'United Airlines'.
    WHEN OTHERS.
        WRITE carrier_id.
ENDCASE.
