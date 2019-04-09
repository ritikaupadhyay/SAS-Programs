PROC IMPORT DATAFILE = "/folders/myfolders/score_data_miss777" OUT = scoredata0 DBMS=xlsx REPLACE;
run;

DATA scoredata1;
set scoredata0;

IF Score1=777 THEN NS1=.;
ELSE NS1=Score1;

IF Score2=777 THEN NS2=.;
ELSE NS2=Score2;

IF Score3=777 THEN NS3=.;
ELSE NS3=Score3;
AVG_NS1 = mean(NS1);
AVG_NS2 = mean(NS2);
AVG_NS3 = mean(NS3);

run;

PROC PRINT DATA=scoredata1;
run;