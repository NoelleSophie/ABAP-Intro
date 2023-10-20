*&---------------------------------------------------------------------*
*& Report z003_demo_14
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_demo_14.

DATA connection    TYPE spfli.                       " Struktur
DATA connections   TYPE TABLE OF spfli.              " Interne Tabelle

DATA carrier_id    TYPE s_carr_id      VALUE 'LH'.
DATA connection_id TYPE s_conn_id      VALUE '0400'.

" SQL Standard
" SELECT [Spalte 1], [Spalte 2]...
"   FROM [Datenbanktabelle]
"   WHERE [Bedingung]

" ---------------------------------------------------------------------
" Lesen eines Einzelsatzes
" ---------------------------------------------------------------------
SELECT SINGLE FROM spfli
  FIELDS *
  WHERE carrid = @carrier_id AND connid = @connection_id
  INTO @connection.
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

" ---------------------------------------------------------------------
" Lesen mehrerer Datensätze
" ---------------------------------------------------------------------
SELECT FROM spfli
  FIELDS *
  WHERE airpfrom = 'FRA'
  INTO TABLE @connections.
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING i_structure_name = 'SPFLI'
  TABLES    t_outtab         = connections.

" ---------------------------------------------------------------------
" Definition der Zielvariablen
" ---------------------------------------------------------------------
" Angabe einer passenden Zielvariablen
DATA connection2 TYPE z003_connection.

SELECT SINGLE FROM spfli
  FIELDS carrid, connid, cityfrom, cityto
  WHERE carrid = @carrier_id AND connid = @connection_id
  INTO @connection2.
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

" Kopieren namensgleicher Felder
SELECT SINGLE FROM spfli
  FIELDS carrid, connid, cityfrom, cityto
  WHERE carrid = @carrier_id AND connid = @connection_id
  INTO CORRESPONDING FIELDS OF @connection.
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

" Inlinedeklaration
SELECT SINGLE FROM spfli
  FIELDS carrid, connid, cityfrom, cityto
  WHERE carrid = @carrier_id AND connid = @connection_id
  INTO @DATA(connection3).
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.
