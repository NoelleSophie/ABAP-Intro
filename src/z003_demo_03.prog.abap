*&---------------------------------------------------------------------*
*& Report z003_demo_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z003_demo_03.

DATA result_i TYPE i.
DATA result_p TYPE p LENGTH 8 DECIMALS 4.

result_i = 5 + 3. "Addition, / ist der Zeilenumbruch
WRITE: / |5 + 3 = {  result_i }|.

result_i = 5 - 3. "Subtraktion
WRITE: / |5 - 3 = { result_i }|.

result_i = 5 * 3. "Multiplikation
WRITE: / |5 * 3 = { result_i }|.

result_i = 5 / 3. "Division1
WRITE: / |5 / 3 = { result_i }|.

result_p = 5 / 3. "Division2
WRITE: / |5 / 3 = { result_p }|.

result_i = 5 DIV 3. "Ganzzahlige Division
WRITE: / |5 / 3 = { result_i }|.
result_i = 5 MOD 3. "Divisionsrest
WRITE: / |5 / 3 = { result_i }|.

result_i = 5 ** 3. "Potenz
WRITE: / |5 ** 3 = { result_i }|.

**********************************************************************
* Zuweisungsoperatoren
**********************************************************************
result_i = result_i + 1.
result_i += 1.
ADD 1 TO result_i.
WRITE: / |3fache Inkrementierung: { result_i }|.

***********************************************************************
* Numerische Funktionen
**********************************************************************
result_i = abs(  -5 ).
WRITE: / |abs( -5 ) = { result_i }|.

result_p = round( val = '378.9769' dec = 2 ).
WRITE: / |round( val = '378.9769' dec = 2 ) = { result_p }|.
