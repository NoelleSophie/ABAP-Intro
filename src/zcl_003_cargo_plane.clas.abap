CLASS zcl_003_cargo_plane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_003_airplane.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        name            TYPE string
        plane_type      TYPE string
        cargo_in_tons TYPE i
        RAISING zcx_003_initial_parameter.

        METHODS to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_003_cargo_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = name plane_type = plane_type ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
  string = |{ name } { plane_type }({ cargo_in_tons } Tons of Cargo)|.
  ENDMETHOD.
ENDCLASS.
