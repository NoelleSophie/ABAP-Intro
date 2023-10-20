CLASS zcl_003_cal2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  CLASS-METHODS percentage
        importing
                             value1 type Z003_decimal
                             value2 type Z003_decimal
            RETURNING VALUE(result) type Z003_decimal "public static double divide (double value1, double value2)
            RAISING cx_sy_zerodivide.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_003_cal2 IMPLEMENTATION.
    METHOD percentage.
        result = ( value1 / 100 ) * value2.
    ENDMETHOD.
ENDCLASS.
