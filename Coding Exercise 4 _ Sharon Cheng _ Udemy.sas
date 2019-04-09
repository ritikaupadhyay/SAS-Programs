/*1. import sale.xlsx and create SAS data set 'sale0'

2. create data 'sale1' with data step program:
a. assign labels to:
	emid	= employee id
	sale_m1 = sale in Jan.
	sale_m2 = sale in Feb.
	sale_m3 = sale in Mar.

b. calculate average sale of three months' sales and assign format to average sale with $ , commas 
and two decimal places

assign same format to sale_m1, sale_m2 and sale_m3

3. Print data 'sales1' with labels and formats*/

PROC IMPORT DATAFILE='/folders/myfolders/Sale.xlsx' OUT=sale0 DBMS=xlsx REPLACE;
RUN;
DATA sale1;
set sale0;
average_sales = mean(sale_m1, sale_m2, sale_m3);

label	emid = 'Employee ID'
		sale_m1 = 'Sales in Jan.'
		sale_m2 = 'Sales in Feb.'
		sale_m3 = 'Sales in Mar.'
		average_sales = 'Average Sales';


FORMAT average_sales sale_m1 -- sale_m3 DOLLARX10.2;


PROC PRINT DATA=sale1 label;
run;
/*
1. Re-run the codes in coding Exercise 1

2. create format 'salegroup' for averagesale with following categories

and store the format in library 'myfmts'

low-<700 = 'need improvement'

700-<900 = 'good'

900-high = 'top sale'

3. in Proc Print: reference/use the format 'salegroup' stored in the Myfmts library as if in a new SAS session,
meaning need to include LIBNAME statement
*/

libname myfmts "/folders/myfolders";

PROC FORMAT LIBRARY=myfmts;

VALUE SALEGROUP	LOW-<700 = 'Needs Improvement'
					700-<900 = 'Good'
					900-HIGH = 'Top Sale!';
RUN;

LIBNAME myfmts "folders/myfolders";
OPTIONS FMTSEARCH=(MYFMTS, WORK, LIBRARY);
PROC PRINT DATA=SALE1 LABEL;
FORMAT AVERAGE_SALES SALEGROUP.;
RUN;
