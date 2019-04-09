/*data: chara_data2.xlsx; variable DOB is a character var in this data set.

Instructions:

1. Create new variables DOB_year, DOB_month, DOB_day by
extracting year and day from var DOB using SCAN function

extracting month from var DOB using SUBSTR function

2. Create new vars DOB_new1, DOB_new2 by concatenating
vars DOB_year, DOB_month, DOB_day using TRIM and CATX function

The new values must be in the form of 2007, 9, 23.

3. Using TRANWRD function to replace 'missing' with ' 'in var raw_score

4. Using INDEX function to search for 2007 in the values of DOB,

then to create a subset data CD2
*/

PROC IMPORT DATAFILE="/folders/myfolders/chara_data2.xlsx"
OUT=data0
DBMS=XLSX
REPLACE;
RUN;

DATA DATA1;
SET DATA0;
DOB_year = SCAN(DOB, 3) ;
DOB_month = SCAN(DOB, 1);
DOB_day = SCAN(DOB, 2);

DOB_new1 = trim(DOB_month) || "," || trim(DOB_day) || "," ||trim(DOB_year);
DOB_new2 = CATX(',', DOB_MONTH, DOB_day, DOB_year);

raw_score = TRANWRD(raw_score, 'missing', " ");
RUN;

DATA CD2;
SET DATA1;

IF INDEX(DOB, '2007') > 0;
RUN;