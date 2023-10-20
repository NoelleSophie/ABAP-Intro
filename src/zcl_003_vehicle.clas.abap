CLASS zcl_003_vehicle DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA make TYPE string READ-ONLY.
    DATA model TYPE string READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        make  TYPE string
        model TYPE string
        RAISING
        zcx_003_initial_parameter.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_003_vehicle IMPLEMENTATION.

  METHOD constructor.
    IF make IS INITIAL.
      RAISE EXCEPTION TYPE zcx_003_initial_parameter
        EXPORTING
          parameter = 'MAKE'.
    ENDIF.

    IF model IS INITIAL.
      RAISE EXCEPTION TYPE zcx_003_initial_parameter
        EXPORTING
          parameter = 'MODEL'.
    ENDIF.

    me->make = make.
    me->model = model.
    number_of_vehicles += 1.
  ENDMETHOD.

  METHOD to_string.
    string = |Vehicle: { make } { model }|.
  ENDMETHOD.

ENDCLASS.
