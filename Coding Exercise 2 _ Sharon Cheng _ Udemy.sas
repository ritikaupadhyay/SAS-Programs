/*1. Create a temporary SAS data 'scoredata0' by
	 Importing an Excel data file score_data.xlsx into SAS (Note: score_data.xlsx is in the downloadable DATA.zip in lecture 2)
2. Create a permanent SAS data set score.scoredata from 'scoredata0'
3. Go to libraries folder in SAS studio, find the data sets in the WORK library
or the SCORE library
4. Both data sets should have 11 observations and 5 variables
*/

proc import datafile = "/folders/myfolders/score_data" 
DBMS = xlsx out = scoredata0 replace ;
run;
 
LIBNAME score "/folders/myfolders";
 
data score.scoredata;
set scoredata0;
run;