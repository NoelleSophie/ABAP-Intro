CLASS zcl_003_caclculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
        importing
                             value1 type Z003_decimal
                             value2 type Z003_decimal
            RETURNING VALUE(result) type Z003_decimal "public static double divide (double value1, double value2)
            RAISING cx_sy_zerodivide.
            " ( return value1 / value2; )
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_003_caclculator IMPLEMENTATION.

    METHOD divide.
        result = value1 / value2.
    ENDMETHOD.

ENDCLASS.
