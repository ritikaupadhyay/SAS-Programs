/*
allscore_miss_text.xlsx



instruction:

using Array to replacing 'missing' with blanks in vars

read math science write

then convert the character vars read math science write

to numeric vars
*/
PROC IMPORT DATAFILE="/folders/myfolders/allscore_miss_text.xlsx"
OUT=alls0 DMBS=XLSX REPLACE;
		
RUN;

DATA alls1(DROP=i);
SET alls0;
		
ARRAY oldvar (4) read--write;
ARRAY newvar (4) readN mathN scienceN writeN;
DO i = 1 to 4;
IF oldvar(i) = 'missing' then oldvar(i) = ' ';
newvar(i) = input (oldvar(i), 8.);
END;

label	readN = "Reading Score"
		mathN = "Math Score"
		scienceN = "Science Score"
		writeN = "Writing Score"
		stuid = "Student ID"
		gender = "Gender";

RUN;

PROC PRINT DATA=alls1 (KEEP = stuid gender readN mathN scienceN writeN)
label;
RUN;
