*******************************************************************************
**** 
**** 
**** Cristina Tello-Trillo
**** 
**** Workers' Compensation and Injury Duration: Evidence from a Natural Experiment AER 1995
*******************************************************************************

use "C:\Users\Roberto Carlos\Desktop\Ciclo-2020-2\Econometria_aplicada\Diff-Diff\INJURY.DTA", clear

des 

// sort the data by highearn and afchnge

sort highearn afchnge
by highearn afchnge: sum durat
tab highearn afchnge, sum(durat)

// by state 
sort highearn afchnge ky
tab highearn afchnge if ky==1, sum(durat)

// No outliers with log
histogram durat if ky==0
histogram ldurat if ky==0

// Generate the treatment effect 

gen treated=afchnge*highearn

reg durat afchnge highearn treated

reg durat afchnge highearn treated male  age prewage
reg durat afchnge highearn treated male  age prewage if ky==1 
reg durat afchnge highearn treated male  age prewage if mi==1 

 // Dependent variable is now ldurat 
 
global controls "manuf construc head neck upextr trunk lowback lowextr occdis" 
 
reg ldurat afchnge highearn treated male  age prewage $controls, robust

reg ldurat afchnge highearn treated male  age prewage $controls ///
if ky==1, robust
est store regky

reg ldurat afchnge highearn treated male  age prewage $controls ///
if mi==1, robust
est store regmi

esttab regky regmi, se mtitle("Kentucky" "Michigan")  star(* 0.1 ** 0.05 *** 0.01)



