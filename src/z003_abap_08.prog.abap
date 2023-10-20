*&---------------------------------------------------------------------*
*& Report z003_abap_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_abap_08.

PARAMETERS p_cid TYPE s_customer.

DATA bookings TYPE TABLE OF Zabap_booking.

TRY.
bookings = zcl_003_helper=>get_bookings( p_cid ).
CATCH zcx_no_booking_found INTO DATA(e).
MESSAGE e->get_text(  ) TYPE 'E'.
ENDTRY.

delete bookings where flight_date < sy-datum.

loop at bookings REFERENCE INTO data(booking).
booking->price *= '1.1'.
endloop.

sort bookings by price DESCENDING.

cl_demo_output=>display( bookings ).

*write: 'Bookings ID', 'Carrier ID', 'Connection ID', 'Flight Date', 'Price', 'Currency Code'.
*LOOP at bookings into data(booking).
*write: / booking-booking_id, booking-carrier_id, booking-connection_id, booking-flight_date, booking-price, booking-currency_code.
*ENDLOOP.
