*&---------------------------------------------------------------------*
*& Report z003_abap_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_abap_02.

PARAMETERS p_id TYPE s_customer.
PARAMETERS p_name TYPE s_custname.
PARAMETERS p_city TYPE city.
PARAMETERS p_count Type s_country.

WRITE: / |{ p_id }, { p_name }, { p_city } ({ p_count })| .
