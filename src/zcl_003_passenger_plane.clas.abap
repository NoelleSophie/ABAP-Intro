CLASS zcl_003_passenger_plane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_003_airplane.

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        name            TYPE string
        plane_type      TYPE string
        number_of_seats TYPE i
         RAISING zcx_003_initial_parameter.

        methods to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_003_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = name plane_type = plane_type ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
  string = |{ name } { plane_type }({ number_of_seats } Seats)|.
  ENDMETHOD.

ENDCLASS.
