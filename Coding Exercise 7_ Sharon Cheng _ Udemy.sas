/*
1. Compute each year's salary you will have if you started with $60,000 
at a 3% increase rate per year for 5 years.

2. Conditionally Executing DO Loops:

How many years it will take the salary to reach $100,000 per year
if the salary increase 3% each year, again the initial salary is $60,000.
*/

DATA sal;
salary = 60000;
interest = 0.03;

DO counter = 1 TO 5;
      salary+salary*interest;
      year+1;
      output;
   end;
   format salary dollar10.2;
run;

PROC PRINT DATA = sal;
run;
/*Now using conditional DO loops*/

DATA sal2;

salary = 60000;
interest = 0.03;

DO WHILE (salary <100000);
	salary = salary + (salary * interest);
	year+1;
END;
format salary dollar10.2;
run;

PROC PRINT DATA = sal2;
run;

