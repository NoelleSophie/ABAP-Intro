*&---------------------------------------------------------------------*
*& Report z003_demo_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_demo_12.

**********************************************************************
* Deklaration interner Tabellen
**********************************************************************
DATA connections TYPE Z003_connections. "TYPE [Tabellentyp]
DATA connections2 TYPE TABLE OF Z003_connection. "TYPE TABLE OF [Strukturtyp]

**********************************************************************
* Hinzufügen
**********************************************************************
connections = VALUE #(
    ( carrier_id = 'LH' connection_id = '0400' arrival_city = 'NEW YORK' )
    ( carrier_id = 'UA' connection_id = '3517' departure_city = 'FRANKFURT' )
    (  )
    ( carrier_id = 'LH' arrival_city = 'FRANKFURT' ) ).

connections = VALUE #( BASE connections ( carrier_id = 'AA' connection_id = '0017' arrival_city = 'ROME' ) ).
"base extrem wichtig, um nicht zu überschreiben sondern zu ergänzen

APPEND VALUE #( connection_id = '0401' ) TO connections.

DATA connection TYPE z003_connection.
connection-arrival_city = 'MADRID'.
connection-departure_city = 'BERLIN'.

APPEND connection TO connections.
connections = VALUE #( BASE connections ( connection ) ).

**********************************************************************
* Lesen von Datensätzen
**********************************************************************
"Lesen eines Einzelsatzes
IF line_exists( connections[ 10 ] ).
  connection = connections[ 10 ]. "INDEX
ENDIF.

TRY.
    connection = connections[ carrier_id = 'AA' connection_id = '0018' ]. "Komponenten
  CATCH cx_sy_itab_line_not_found.
ENDTRY.

"Lesen mehrerer Datensätze
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  WRITE: / sy-tabix, connection.
ENDLOOP.

**********************************************************************
* Ändern von Datensaätzen
**********************************************************************
" Ändern eines Einzelsatzes
connections[ 1 ]-departure_city = 'FRANKFURT'. "Index
connections[ carrier_id = 'AA' connection_id = '0017' ]-departure_city = 'WALLDORF'. "Komponenten

"Ändernd mehrerer Datensätze
DATA connection_r type ref to z003_connection.

LOOP AT connections REFERENCE INTO connection_r WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
    connection_r->carrier_id = 'LHD'.
ENDLOOP.

**********************************************************************
* Sortieren
**********************************************************************
SORT connections BY carrier_id DESCENDING connection_id ASCENDING departure_city DESCENDING.

**********************************************************************
* Löschen
**********************************************************************
"Löschen eines EInzelsatzes
DELETE connections index 4. "okay
"DELETE connections FROM connection. "sehr schlechte Alternative

"Löschen mehrerer Datensätze
DELETE connections where arrival_city IS INITIAL. "am besten

**********************************************************************
* Größe
**********************************************************************
write / lines( connections ).

WRITE ''.
