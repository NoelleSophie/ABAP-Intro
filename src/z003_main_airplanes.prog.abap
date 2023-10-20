*&---------------------------------------------------------------------*
*& Report z003_main_airplanes
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_main_airplanes.

DATA plane TYPE REF TO zcl_003_airplane.
DATA planes TYPE TABLE OF REF TO zcl_003_airplane.

try.
plane = new zcl_003_cargo_plane( name = 'Thranduil' plane_type = 'A333' cargo_in_tons = 500 ).
APPEND plane TO planes.
catch zcx_003_initial_parameter INTO DATA(e).
WRITE e->get_text(  ).
ENDTRY.

try.
plane = NEW zcl_003_cargo_plane( name = 'Elrond' plane_type = 'A35K' cargo_in_tons = 34 ).
APPEND plane TO planes.
catch zcx_003_initial_parameter INTO e.
WRITE e->get_text(  ).
ENDTRY.

try.
plane = NEW zcl_003_passenger_plane( name = 'Galadriel' plane_type = 'E545' number_of_seats = 900 ).
APPEND plane TO planes.
catch zcx_003_initial_parameter INTO e.
WRITE e->get_text(  ).
ENDTRY.

try.
plane = NEW zcl_003_passenger_plane( name = 'Fingon' plane_type = 'FA7X' number_of_seats = 13 ).
APPEND plane TO planes.
catch zcx_003_initial_parameter INTO e.
WRITE e->get_text(  ).
ENDTRY.

try.
plane = NEW zcl_003_passenger_plane( name = 'Arwen' plane_type = 'JS41' number_of_seats = '').
APPEND plane TO planes.
catch zcx_003_initial_parameter INTO e.
WRITE e->get_text(  ).
ENDTRY.

try.
plane = NEW #( name = 'Tauriel' plane_type = '' ).
APPEND plane TO planes.
catch zcx_003_initial_parameter INTO e.
WRITE e->get_text(  ).
ENDTRY.

LOOP AT planes INTO plane.
  WRITE / plane->to_string(  ).
ENDLOOP.

WRITE zcl_003_airplane=>number_of_planes.
