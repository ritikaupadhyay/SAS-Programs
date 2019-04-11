/*
data:

sale_state.xlsx

sale in CA: variables saleCA1 saleCA2 saleCA3

sale in TX: variables saleTX1 saleTX2 saleTX3



Instructions:

1. Use a two-dimensional array to calculate
the total sales for each state (CA, TX) for each year.

2. Print the output with dollar format.
*/

proc import datafile = "/folders/myfolders/sale_state" 
DBMS = xlsx out = sale1 replace ;
run;
 
data sale2;
set sale1;
array sale (2,3) saleCA1 -- saleTX3;
array state_sale (2) state_sale_CA state_sale_TX;
do i = 1 to 2;
state_sale (i) = 0;
 	do j=1 to 3;
          state_sale{i}+sale{i,j};
      end;
   end;
run;
 
proc print data = sale2 (drop = i j);
format saleCA1 -- state_sale_TX dollar10.;
run;