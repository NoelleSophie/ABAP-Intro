*&---------------------------------------------------------------------*
*& Report z003_main_vehicles
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_main_vehicles.

* Demo 1: Objekte und Referenzvariablen

DATA vehicle TYPE REF TO zcl_003_vehicle.
*DATA(vehicle2) = NEW zcl_003_vehicle(  ). "Gleicher Sinn wie oben in nur einer Zeile
DATA vehicles TYPE TABLE OF REF TO zcl_003_vehicle.

WRITE zcl_003_vehicle=>number_of_vehicles.

try.
vehicle = NEW zcl_003_car( make = 'VW' model = 'Up' number_of_seats = 4 ). "Vehicle vehicle = new Vehicle(  );
APPEND vehicle TO vehicles.
catch zcx_003_initial_parameter INTO DATA(e).
WRITE e->get_text(  ).
ENDTRY.

try.
vehicle = NEW zcl_003_vehicle( make = 'MAN' model = 'TGX' ).
APPEND vehicle TO vehicles.
catch zcx_003_initial_parameter INTO e.
WRITE e->get_text(  ).
ENDTRY.

try.
vehicle = NEW zcl_003_vehicle( make = 'PORSCHE' model = '' ).
APPEND vehicle TO vehicles.
catch zcx_003_initial_parameter INTO e.
WRITE e->get_text(  ).
ENDTRY.

"Ausgabe
LOOP AT vehicles INTO vehicle.
  WRITE / vehicle->to_string(  ).
ENDLOOP.
