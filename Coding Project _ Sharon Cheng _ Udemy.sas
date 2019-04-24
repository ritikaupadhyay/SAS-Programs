proc import datafile="/folders/myfolders/Weight_loss"
out=WL0 dbms=xlsx replace;
run;

proc means data=WL0;
run;

proc freq data=WL0;
run;

data WL1;
set WL0;

array w[3] weight0-weight2;

do i=1 to 3;
if w[i]=9999 then w[i]=.;
end;

wd1 = weight0 - weight1;
wd2 = weight0 - weight2;
wd12 = weight1 - weight2;
drop i;
run;
proc means data=WL1 MAXDEC = 1 n mean max min;
VAR wd2 walk_steps;
run;

proc freq data=WL1;
table wd2 walk_steps;
run;

data WL2;
set WL1;
length walk_cat wd2_group $20;

if walk_steps < 5000
	then walk_cat = 'less than 5,000';
else if walk_steps > 5000 and walk_steps <=10000
	then walk_cat = '5,000 - 10,000';
else if walk_steps > 10000
	then walk_cat = 'greater than 10,000';
else walk_cat = "missing";
	

if wd2 ne . and wd2 <=0
	then wd2_group = 'no weight loss';
else if wd2 > 0 and wd2 <=5
	then wd2_group = 'lost upto 5 lbs';
else if wd2 > 5
	then wd2_group = 'lost more than 5 lbs';
else wd2_group= 'missing';
	

libname projectd "/folders/myfolders";
data projectd.weight_loss;
set WL2;
run;