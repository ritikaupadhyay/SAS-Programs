/*
data: allscore.xlsx

Instructions:

1. Generate proc univariate outputs for all 4 score variables
	a. Using macro variables to replace score variable names
	b. Using a macro with parameter
*/

proc import datafile="/folders/myfolders/allscore"
out=score_data dbms=xlsx replace;
run;
/*read, math, science, write scores*/


%let score = read;
proc univariate data= score_data;
var &score;
title "Univariate of &score";
run;


%let score = math;
proc univariate data= score_data;
var &score;
title "Univariate of &score";
run;

%let score = science;
proc univariate data= score_data;
var &score;
title "Univariate of &score";
run;

%let score = write;
proc univariate data= score_data;
var &score;
title "Univariate of &score";
run;

/*Using a macro with a parameter*/
%macro scoresmac(score=);
	proc univariate data= score_data;
	var &score;
	title "Univariate of &score";
	run;
%mend scoresmac;

%scoresmac(score=read)
%scoresmac(score=math)
%scoresmac(score=science)
%scoresmac(score=write)