/* ****************************************************************************
Program name: 			ece_r2.do
Previous file: 			---
Author:					Grade
Date created: 			04-October-2013
Date last modified: 	04-October-2013
Project: 				OLPC Peru Home Internet 
Purpose: 				Process the ECE from 2011 (related to Round 2) and  ///
						generates a student level database with the indicators to be used in the analysis

Files used:
                ece2011_g2_r2.dta
				school_pairs_final.dta
				match_ece_2011.dta
                

Files created:
                Intermedias\ece_r2.dta
	
NOTE: 
*******************************************************************************/
clear all 
cap log close
set more off

*	CHANGE DIRECTORY
cd "D:\DATA.IDB\Documents\Dropbox\OLPC Peru\Bases"	


use "Originales\Ronda2\ece2011_g2_r2.dta", clear

*keep only the experimental schools

ren  cod_mod7 codmod
joinby codmod using "Auxiliares\school_pairs_final.dta", unm(m)
keep if _merge==3
drop _merge

*generate full name of students
egen full_name=concat(paterno materno nombres), punct(" ")

*insert student ids
joinby codmod full_name using "Auxiliares\match_ece_2011.dta",unm(m) 
tab _merge
drop _merge
keep if codest~=.

keep codest grupo_3c grupo_3m m500_c_11 m500_m_11 peso_c_11 peso_m_11

save "Intermedias\ece_r2.dta", replace
clear
