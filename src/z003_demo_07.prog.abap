*&---------------------------------------------------------------------*
*& Report z003_demo_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_demo_07.

PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_cid2.


write: |Anmeldedaten; { sy-uname }|.
write / |Datum des Servers: { sy-datum }|.
write / |Zeit des Servers: { sy-uzeit }|.
write / |Datum des Clients: { sy-datlo }|.
write / |Zeit des Clients: { sy-timlo }|.
write / |Anmeldemandant: { sy-mandt }|.
write / |Anmeldesprache: { sy-langu }|.
