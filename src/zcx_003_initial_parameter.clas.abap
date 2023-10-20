CLASS zcx_003_initial_parameter DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    constants:
      begin of ZCX_003_INITIAL_PARAMETER,
        msgid type symsgid value 'z003',
        msgno type symsgno value '004',
        attr1 type scx_attrname value 'PARAMETER',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of ZCX_003_INITIAL_PARAMETER.

      data parameter type string.

    METHODS constructor
      IMPORTING
        textid   LIKE if_t100_message=>t100key OPTIONAL
        previous LIKE previous OPTIONAL
        parameter type string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_003_initial_parameter IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
  super->constructor( previous = previous ).

      if_t100_message~t100key = zcx_003_initial_parameter=>zcx_003_initial_parameter.
      me->parameter = parameter.
  ENDMETHOD.
ENDCLASS.
