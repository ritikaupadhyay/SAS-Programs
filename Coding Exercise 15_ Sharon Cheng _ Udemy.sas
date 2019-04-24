/*
data:	allscore.xlsx --> import to create SAS data set allScore0
		score_data_id.xlsx --> import to create SAS data set Score_data0



Instructions:

1. Use SELECT to create a new table 'allScore1' with variables stuid, math from table 'allScore0'
2. Use SELECT to create a new table 'Score_data1' with variables stu_id, score2 from table 'Score_data0'
3. Join the tables Score_data1 and allScore1 on stuid = stu_id using keyword JOIN
	a. keep only the matching students
	b. keep all the students from table allScore1
	c. include all the students in both tables
*/

proc import datafile="/folders/myfolders/allscore"
out=allScore0 dbms=xlsx replace;
run;

proc import datafile="/folders/myfolders/score_data_id"
out=Score_data0 dbms=xlsx replace;
run;

PROC SQL;
CREATE TABLE allScore1 AS
	SELECT stuid, math
	FROM allScore0;

CREATE TABLE Score_data1 AS
	SELECT stu_id, score2
	FROM Score_data0;
QUIT;

proc print data=allScore1;
title "All Score Dataset";
run;

proc print data=Score_data1;
title "Score Data Dataset";
run;

title "INNER JOIN";
PROC SQL;
SELECT * FROM allScore1, Score_data1
WHERE stuid = stu_id;
QUIT;

title "LEFT JOIN";
PROC SQL;
SELECT stuid, math, stu_id, score2
FROM allScore1 AS a LEFT JOIN Score_data1 AS s
ON stuid = stu_id;
QUIT;

title "RIGHT JOIN";
PROC SQL;
SELECT stuid, math, stu_id, score2
FROM allScore1 AS a RIGHT JOIN Score_data1 AS s
ON stuid = stu_id;
QUIT;

