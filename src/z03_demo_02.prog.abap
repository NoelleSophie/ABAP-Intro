*&---------------------------------------------------------------------*
*& Report z03_demo_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_demo_02.

"Wichtige ABAP Standardtypen

TYPES ty_i TYPE i. "Ganze Zahl Bsp. 42
TYPES ty_c40 TYPE c LENGTH 40. "Zeichenkette fester Länge Bsp. 'Hello World'
TYPES ty_n7 TYPE n LENGTH 7. "Numerische Folgen fester Länge Bsp. '589567'
TYPES ty_d TYPE d. "Datum im YYYYMMDD Format Bsp. '20231016'
TYPES ty_t TYPE t. "Zeit im HHMMSS Format Bsp. '105513'
TYPES ty_pl62 TYPE p Length 16 DECIMALS 2. "Kommazahl Bsp. '567.23'
TYPES ty_boolean TYPE c LENGTH 1. " 'Boolscher Wahrheitscwert (Bsp. X)

**********************************************************************
* Gepackte Zahlen
**********************************************************************
* TYPES ty_pl62 TYPE p Length 16 DECIMALS 2.
* Länge in Byte: Length -> 16
* Anzahl Ziffern: 2 * LENGTH - 1 -> 31 (- 1 wegen Vorzeichen)
* Nachkommastellen: DECIMALS -> 2
* Vorkommerstellen: Anzahl Ziffern - DECIMALS -> 29


**********************************************************************
* Deklaration variabler Datenobjekte per...
**********************************************************************
DATA matriculation_number TYPE ty_n7. "lokalem Datentyp
DATA decimal TYPE p LENGTH 8 decimals 3. "ABAP Standardtyp
DATA carrier_id TYPE s_carr_id. "Datenelement (globalem Datentyp)

**********************************************************************
* Wertzuweisungen
**********************************************************************
matriculation_number = '589867'. "Zuweisungsoperator
DATA connection_id TYPE s_conn_id VALUE '0400'. "Statische Vorbelegung
DATA(text) = 'Hello World'. "Inlinedeklaration

WRITE: matriculation_number, connection_id, text.

**********************************************************************
* Initialisierung
**********************************************************************
CLEAR text.
connection_id = '0000'.
text = 'Ciao World'.

**********************************************************************
* Deklaration fixer Datenobjekte
**********************************************************************
CONSTANTS pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.

**********************************************************************
* Eingabeparameter
**********************************************************************
PARAMETERS p_cid TYPE c LENGTH 3.
PARAMETERS p_cid2 TYPE s_carr_id.

WRITE: p_cid, p_cid2.
