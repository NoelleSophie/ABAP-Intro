CLASS zcl_003_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA name TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.

     CLASS-DATA number_of_planes TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        name       TYPE string
        plane_type TYPE string.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_003_airplane IMPLEMENTATION.

  METHOD constructor.

  IF name IS INITIAL.
      RAISE EXCEPTION TYPE zcx_003_initial_parameter
        EXPORTING
          parameter = 'NAME'.
    ENDIF.

    IF plane_type IS INITIAL.
      RAISE EXCEPTION TYPE zcx_003_initial_parameter
        EXPORTING
          parameter = 'PLANE TYPE'.
    ENDIF.
    me->name = name.
    me->plane_type = plane_type.
    number_of_planes += 1.
  ENDMETHOD.

  METHOD to_string.
    string = |Airplane: { name } { plane_type }|.
  ENDMETHOD.

ENDCLASS.
