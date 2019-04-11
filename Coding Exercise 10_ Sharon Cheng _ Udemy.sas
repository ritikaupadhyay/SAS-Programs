/*
DATA: 
score_data_id_class.xlsx (student-level info)
class_info.xlsx (class-level info)

Instructions:

1. Merge class information to student-level data by variable class.
2. Only retain observations with class-level information in the merged data.
*/


PROC IMPORT DATAFILE="/folders/myfolders/score_data_id_class"
OUT=score dbms=xlsx REPLACE;
RUN;

PROC IMPORT DATAFILE="/folders/myfolders/class_info"
OUT=class dbms=xlsx REPLACE;
RUN;

DATA mergedata;
merge score (in=stu) class (in=cl);
by class;
if stu and cl;
run;

proc print data=mergedata;
run;

proc print data=score;
run;

proc print data=class;
run;