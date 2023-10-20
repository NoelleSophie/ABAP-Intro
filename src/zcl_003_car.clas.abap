CLASS zcl_003_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_003_vehicle.

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        make            TYPE string
        model           TYPE string
        number_of_seats TYPE i
        RAISING zcx_003_initial_parameter.

        methods to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_003_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make = make model = model ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
  string = |{ make } { model }({ number_of_seats } Seats)|.
  ENDMETHOD.
ENDCLASS.
