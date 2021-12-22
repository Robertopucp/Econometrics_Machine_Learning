clear all 
cap log close
set more off

*	CHANGE DIRECTORY
cd "C:\Users\Roberto Carlos\Desktop\Ciclo-2020-2\Econometria_aplicada\Control_Trails\data"	


********************************************************************************
*	1) XO: 3RD to 6TH GRADE 
********************************************************************************

use "Originales\Ronda2\xo_g3-6_r2.dta", clear
rename CODMOD - CODIGO_EST2, lower
rename (codigo_est nomest) (orden_es nombr_es)


* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS AND DUPLICATES
*---------------------------------------------------------------

drop if inlist(p1, -9,.)  & inlist(p2, -9,.)  & inlist(p3,-9,.)    & inlist(p4, -9,.)   & inlist(p5, -9,.)   & inlist(p6, -9,.)   & inlist(p7, -9,.) ///
	  & inlist(p8, -9,.)  & inlist(p9, -9,.)  & inlist(p10, -9,.)  & inlist(p11,-9,.)   & inlist(p12,-9,.)   & inlist(p13,-9,.)   & inlist(p14,-9,.) ///
	  & inlist(p15,-9,.)  & inlist(p16,-9,.)  & inlist(p171,-9,.)  & inlist(p172,-9,.)  & inlist(p173,-9,.)  & inlist(p18,-9,.)   & inlist(p19,-9,.) ///
	  & inlist(p20,-9,.)  & inlist(p21,-9,.)  & inlist(p22,-9,.)   & inlist(p23,-9,.)   & inlist(p24,-9,.)   & inlist(p25,-9,.)   

	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE SCORES
*----------------
gen sp1_xor2=(p1==4)
gen sp2_xor2=(p2==2)
gen sp3_xor2=(p3==3)
gen sp4_xor2=(p4==3)
gen sp5_xor2=(p5==3)
gen sp6_xor2=(p6==4)
gen sp7_xor2=(p7==2)
gen sp8_xor2=(p8==1)
gen sp9_xor2=(p9==4)
gen sp10_xor2=(p10==4)
gen sp11_xor2=(p11==4)
gen sp12_xor2=(p12==2)
gen sp13_xor2=(p13==1)
gen sp14_xor2=(p14==4)
gen sp15_xor2=(p15==1)
gen sp16_xor2=(p16==2)
gen sp171_xor2=(p171==2|p171==3)
gen sp172_xor2=(p172==1)
gen sp173_xor2=(p173==4)
gen sp18_xor2=(p18==3)
gen sp19_xor2=(p19==1)
gen sp20_xor2=(p20==2)
gen sp21_xor2=(p21==1)																/* P21: 1=CORRECT AND 0=INCORRECT*/
gen sp22_xor2=(p22==4)
gen sp23_xor2=(p23==2)
gen sp24_xor2=(p24==3)
gen sp25_xor2=(p25==4)
egen xo_r2=rowtotal(sp1_xor2-sp25_xor2),missing


* CHECKS
*-------
summ xo_r2 sp*
alpha sp*, item																		/* ALPHA's NEAR 0.5*/


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es xo_r2 sp*
order codest codmod grado seccion orden_es nombr_es xo_r2 sp*
saveold "Intermedias/input_r2_aux1s.dta",replace
keep codest codmod grado seccion orden_es nombr_es xo_r2
saveold "Intermedias/input_r2_aux1.dta",replace




********************************************************************************
*	6) RAVEN: 3RD to 6TH GRADE
********************************************************************************

use "Originales\Ronda2\matrices_g3-6_r2.dta", clear
rename CODMOD - CODIGO_EST2, lower
rename (codigo_est nomest) (orden_es nombr_es)
rename (serie_a_01 serie_a_02 serie_a_03 serie_a_04 serie_a_05 serie_a_06 serie_a_07 serie_a_08 serie_a_09 serie_a_10 serie_a_11 serie_a_12 serie_ab_01 serie_ab_02 serie_ab_03 serie_ab_04 serie_ab_05 serie_ab_06 serie_ab_07 serie_ab_08 serie_ab_09 serie_ab_10 serie_ab_11 serie_ab_12 serie_b_01 serie_b_02 serie_b_03 serie_b_04 serie_b_05 serie_b_06 serie_b_07 serie_b_08 serie_b_09 serie_b_10 serie_b_11 serie_b_12) ///
	   (p1		   p2		  p3	  	 p4	        p5		   p6		  p7		 p8	        p9		   p10        p11        p12        p13         p14         p15         p16	        p17		    p18         p19	        p20	        p21  	    p22 	    p23	        p24         p25	       p26		  p27 	     p28	    p29        p30        p31        p32        p33        p34        p35        p36)
/* NOTE: QUESTIONS P1 TO P12 ARE FROM SERIE "A", QUESTIONS 13 TO 24 ARE FROM SERIE "AB", AND QUESTION 15 TO 36 ARE FROM SERIE "B" */

	   
* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS
*------------------------------------------------
gen todrop=1
forv x=1/36 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*--------------------------
duplicates list codest


* GENERATE SCORES
*----------------
gen sp1_ravenr2=(p1==4)
gen sp2_ravenr2=(p2==5)
gen sp3_ravenr2=(p3==1)
gen sp4_ravenr2=(p4==2)
gen sp5_ravenr2=(p5==6)
gen sp6_ravenr2=(p6==3)
gen sp7_ravenr2=(p7==6)
gen sp8_ravenr2=(p8==2)
gen sp9_ravenr2=(p9==1)
gen sp10_ravenr2=(p10==3)
gen sp11_ravenr2=(p11==4)
gen sp12_ravenr2=(p12==5)
gen sp13_ravenr2=(p13==4)
gen sp14_ravenr2=(p14==5)
gen sp15_ravenr2=(p15==1)
gen sp16_ravenr2=(p16==6)
gen sp17_ravenr2=(p17==2)
gen sp18_ravenr2=(p18==1)
gen sp19_ravenr2=(p19==3)
gen sp20_ravenr2=(p20==4)
gen sp21_ravenr2=(p21==6)
gen sp22_ravenr2=(p22==3)
gen sp23_ravenr2=(p23==5)
gen sp24_ravenr2=(p24==2)
gen sp25_ravenr2=(p25==2)
gen sp26_ravenr2=(p26==6)
gen sp27_ravenr2=(p27==1)
gen sp28_ravenr2=(p28==2)
gen sp29_ravenr2=(p29==1)
gen sp30_ravenr2=(p30==3)
gen sp31_ravenr2=(p31==5)
gen sp32_ravenr2=(p32==6)
gen sp33_ravenr2=(p33==4)
gen sp34_ravenr2=(p34==3)
gen sp35_ravenr2=(p35==4)
gen sp36_ravenr2=(p36==5)
egen raven_r2=rowtotal (sp1_ravenr2-sp36_ravenr2), missing


* CHECKS
*-------
summ raven_r2 sp*
alpha sp*, item


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es raven_r2 sp*
order codest codmod grado seccion orden_es nombr_es raven_r2 sp*
saveold "Intermedias/input_r2_aux6s.dta",replace
keep codest codmod grado seccion orden_es nombr_es raven_r2 
saveold "Intermedias/input_r2_aux6.dta",replace




********************************************************************************
*	12) TEACHER ASSESSMENT: 3RD to 6TH GRADE
********************************************************************************

use "Originales\Ronda2\percepciondocente_g3-6_r2.dta", clear
rename CODMOD - CARACT_C, lower
rename (codigo_est nomest) (orden_es nombr_es)

* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS
*------------------------------------------------
drop if inlist(caract_a, -9,.) & inlist(caract_b, -9,.) & inlist(caract_c, -9,.) 


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


*SKILLS IN MAKING FRIENDS
*-------------------------
gen friendl_r2=caract_a==1 
gen friendm_r2=caract_a==2 
gen friendh_r2=caract_a==3
foreach x in friendl_r2 friendm_r2 friendh_r2 {
replace `x'=. if inlist(caract_a, -9,.)
}

*ACADEMIC EFFORT IN CLASS
*-------------------------
gen effortl_r2=caract_b==1
gen effortm_r2=caract_b==2
gen efforth_r2=caract_b==3
foreach x in effortl_r2 effortm_r2 efforth_r2 {
replace `x'=. if inlist(caract_b, -9,.)
}


*LEVEL OF EDUCATION EXPECTED TO COMPLETE
*---------------------------------------
gen eduexpe_r2=caract_c==1
gen eduexps_r2=caract_c==2
gen eduexpt_r2=caract_c==3
foreach x in eduexpe_r2 eduexps_r2 eduexpt_r2 {
replace `x'=. if inlist(caract_c, -9,.)
}


* CHECKS
*-------
summ friend* effort* eduexp*


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es friendl_r2-eduexpt_r2
order codest codmod grado seccion orden_es nombr_es friendl_r2-eduexpt_r2
saveold "Intermedias/input_r2_aux12.dta",replace




********************************************************************************
*	13) STUDENT SURVEY: 3RD to 6TH GRADE
********************************************************************************

****
*	13.1)SOCIO-DEMOGRAPHIC
****

use "Originales\Ronda2\cestudiante_g3-6_p1_r2.dta", clear
rename CODMOD - CODIGO_EST2, lower
rename (codigo_est nomest) (orden_es nombr_es)


* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS
*------------------------------------------------
drop if inlist(p1,-9,-8,-7,.) & inlist(p2, -9,-8,-7,.)     & inlist(p3,-9,-8,-7,.)      & inlist(p4,-9,-8,-7,.)      & inlist(p5,-9,-8,-7,.)  & inlist(p6,-9,-8,-7,.)  ///
	  & inlist(p7,-9,-8,-7,.) & inlist(p8_a1, -9,-8,-7,.)  & inlist(p8_a2, -9,-8,-7,.)  & inlist(p8_a3, -9,-8,-7,.)  & inlist(p8_a4,-9,-8,-7,.)   

	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE INDICATORS
*-------------------------
gen male_r2=p1==1
rename p2 age_r2
rename p3 sibling_r2
rename p4 ysibling_r2
gen fathlivh_r2=p5==1
gen fathwout_r2=p6==1
gen mothwout_r2=p7==1
gen phone_r2=p8_a1==1
gen electri_r2=p8_a2==1
gen car_r2=p8_a3==1
gen moto_r2=p8_a4==1

replace male_r2=. 		if inlist(p1, -9, -8, -7, .)
replace age_r2=. 		if inlist(age_r2, -9, -8, -7, .)
replace sibling_r2=. 	if inlist(sibling_r2, -9, -8, -7, .)
replace ysibling_r2=. 	if inlist(ysibling_r2, -9, -8, -7, .)
replace fathlivh_r2=. 	if inlist(p5, -9, -8, -7, .)
replace fathwout_r2=. 	if inlist(p6, -9, -8, -7, .)	
replace mothwout_r2=. 	if inlist(p7, -9, -8, -7, .)
replace phone_r2=. 		if inlist(p8_a1, -9, -8, -7, .)
replace electri_r2=. 	if inlist(p8_a2, -9, -8, -7, .)
replace car_r2=. 		if inlist(p8_a3, -9, -8, -7, .)
replace moto_r2=. 		if inlist(p8_a4, -9, -8, -7, .)


* CHECKS
*-------
summ male_r2-moto_r2 age_r2 sibling_r2 ysibling_r2


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es age_r2 sibling_r2 ysibling_r2 male_r2-moto_r2 
order codest codmod grado seccion orden_es nombr_es age_r2 sibling_r2 ysibling_r2 male_r2-moto_r2 
saveold "Intermedias/input_r2_aux13_1.dta",replace



****
*	13.2)COMPUTER ACCESS AND USE
****

use "Originales\Ronda2\cestudiante_g3-6_p2_r2.dta", clear
rename CODMOD - FICHA2, lower
rename (codigo_est nomest) (orden_es nombr_es)


* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS
*------------------------------------------------
drop if inlist(p1,-9,-8,.) & inlist(p2,-9,-8,.) & p4_a1==. & p4_b1==. & p4_a2==. & p4_b2==. & p4_a3==. & p4_b3==. & p4_a4==. & p4_b4==. & p4_a5==. & p4_b5==. ///
	  & inlist(p5_a1,-9,-8,.)  & inlist(p5_a2,-9,-8,.) & inlist(p5_a3,-9,-8,.) & inlist(p5_a4,-9,-8,.) & inlist(p5_a5,-9,-8,.) ///
	  & inlist(p6_a1,-9,-8,.)  & inlist(p6_a2,-9,-8,.) & inlist(p6_a3,-9,-8,.) & inlist(p6_a4,-9,-8,.) & inlist(p7,-9,-8,.)    ///
	  & inlist(p8_a1,-9,-8,.)  & inlist(p8_a2,-9,-8,.) & inlist(p8_a3,-9,-8,.) & inlist(p8_a4,-9,-8,.) & inlist(p8_a5,-9,-8,.) & inlist(p8_a6,-9,-8,.)

	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE INDICATORS
*--------------------
gen pchome_r2=p1==1
gen pcuyest_r2=!inlist(p4_a1,0,.)| !inlist(p4_b1,0,.)| !inlist(p4_a2,0,.)| !inlist(p4_b2,0,.)| !inlist(p4_a3,0,.)| !inlist(p4_b3,0,.)| !inlist(p4_a4,0,.)| !inlist(p4_b4,0,.)| !inlist(p4_a5,0,.)| !inlist(p4_b5,0,.)

forval x=1/5 {
replace p4_a`x'=0 if p4_a`x'==. & p4_b`x'!=.
replace p4_b`x'=0 if p4_b`x'==. & p4_a`x'!=.
}

gen pcuytwsch_r2=p4_a1*60+ p4_b1 
gen pcuytwhome_r2=p4_a2*60+ p4_b2 
gen pcuytwcafe_r2=p4_a3*60+ p4_b3 
gen pcuytwfri_r2=p4_a4*60+ p4_b4 
gen pcuytwothr_r2=p4_a5*60+ p4_b5
gen pcuweek_r2=p5_a1==1 | p5_a2==1 | p5_a3==1 | p5_a4==1 | p5_a5==1
gen pcuwsch_r2=p5_a1==1 
gen pcuwhome_r2=p5_a2==1  
gen pcuwcafe_r2=p5_a3==1   
gen pcuwfri_r2=p5_a4==1  
gen pcuwothr_r2=p5_a5==1 
gen pcthwork_r2=p6_a1==1  
gen pctgame_r2=p6_a2==1  
gen pctmusic_r2=p6_a3==1 
gen pctvideo_r2=p6_a4==1 
gen inthome_r2=p2==1
gen intuweek_r2=p7==1
gen inttmail_r2=p8_a1==1  
gen inttchat_r2=p8_a2==1  
gen inttgame_r2=p8_a3==1  
gen inttinfo_r2=p8_a4==1  
gen inttvide_r2=p8_a5==1  
gen inttbook_r2=p8_a6==1 


replace pchome_r2=. 	if inlist(p1, -9,-8,.)
replace inthome_r2=. 	if inlist(p2, -9,-8,.)
replace pcuyest_r2=.    if p4_a1==. & p4_b1==.&p4_a2==. & p4_b2==.&p4_a3==. & p4_b3==.&p4_a4==. & p4_b4==.&p4_a5==. & p4_b5==.
replace pcuweek_r2=. 	if inlist(p5_a1, -9,-8,.) & inlist(p5_a2, -9,-8,.) & inlist(p5_a3, -9,-8,.) & inlist(p5_a4, -9,-8,.) & inlist(p5_a5, -9,-8,.)
replace pcuwsch_r2=. 	if inlist(p5_a1, -9,-8,.) 
replace pcuwhome_r2=. 	if inlist(p5_a2, -9,-8,.)  
replace pcuwcafe_r2=. 	if inlist(p5_a3, -9,-8,.)    
replace pcuwfri_r2=. 	if inlist(p5_a4, -9,-8,.)  
replace pcuwothr_r2=. 	if inlist(p5_a5, -9,-8,.)
replace pcthwork_r2=. 	if inlist(p6_a1, -9,-8,.) 
replace pctgame_r2=. 	if inlist(p6_a2, -9,-8,.) 
replace pctmusic_r2=. 	if inlist(p6_a3, -9,-8,.) 
replace pctvideo_r2=. 	if inlist(p6_a4, -9,-8,.)
replace intuweek_r2=. 	if inlist(p7, -9,-8,.) 
replace inttmail_r2=. 	if inlist(p8_a1, -9,-8,.)
replace inttchat_r2=. 	if inlist(p8_a2, -9,-8,.)  
replace inttgame_r2=. 	if inlist(p8_a3, -9,-8,.)  
replace inttinfo_r2=. 	if inlist(p8_a4, -9,-8,.)  
replace inttvide_r2=. 	if inlist(p8_a5, -9,-8,.)  
replace inttbook_r2=. 	if inlist(p8_a6, -9,-8,.)
foreach x in pcuyest pcuytwsch pcuytwhome pcuytwcafe pcuytwfri pcuytwothr pcuweek pcuwsch pcuwhome pcuwcafe pcuwfri pcuwothr pcthwork pctgame pctmusic pctvideo intuweek inttmail inttchat inttgame inttinfo inttvide inttbook{
	replace `x'_r2=0 if p3==2 
	}
foreach x in inttmail inttchat inttgame inttinfo inttvide inttbook{
	replace `x'_r2=0 if p7==2 
	}


	
* CHECKS
*-------
summ pchome_r2-inttbook_r2


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es pchome_r2-inttbook_r2
order codest codmod grado seccion orden_es nombr_es pchome_r2-inttbook_r2
saveold "Intermedias/input_r2_aux13_2.dta",replace



****
*	13.3)TIME USE
****

use "Originales\Ronda2\cestudiante_g3-6_p1_r2.dta", clear
rename CODMOD - CODIGO_EST2, lower
rename (codigo_est nomest) (orden_es nombr_es)

* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS
*------------------------------------------------
drop if inlist(p11_a1,-9,-8,.) & inlist(p11_a2,-9,-8,.) & inlist(p11_a3,-9,-8,.) & inlist(p11_a4,-9,-8,.) & inlist(p11_a5,-9,-8,.) & inlist(p11_a6,-9,-8,.) ///
	  & inlist(p11_a7,-9,-8,.) & inlist(p11_a8,-9,-8,.) & inlist(p11_a9,-9,-8,.) & inlist(p11_a10,-9,-8,.) & inlist(p11_a11,-9,-8,.) ///
	  & p12_1==. & p12_2==. & p12_3==. &  p12_4==. &  p13_1==. &  p13_2==. &  p13_3==. &  p13_4==. &  p14_1==. & p14_2==. & p14_3==. & p14_4==.
	  
	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE INDICATORS
*--------------------
gen uthelpho_r2=p11_a1==1  
gen utcaring_r2=p11_a2==1  
gen utshopp_r2=p11_a3==1  
gen utwstree_r2=p11_a4==1  
gen utwstore_r2=p11_a5==1  
gen uthwork_r2=p11_a6==1  
gen utplay_r2=p11_a7==1  
gen utwattv_r2=p11_a8==1  
gen utpc_r2=p11_a9==1  
gen utread_r2=p11_a10==1  
gen utintcaf_r2=p11_a11==1 

replace uthelpho_r2=. 	if inlist(p11_a1,-9,-8,.)  
replace utcaring_r2=. 	if inlist(p11_a1,-9,-8,.)    
replace utshopp_r2=. 	if inlist(p11_a1,-9,-8,.)   
replace utwstree_r2=. 	if inlist(p11_a1,-9,-8,.)    
replace utwstore_r2=. 	if inlist(p11_a1,-9,-8,.)    
replace uthwork_r2=. 	if inlist(p11_a1,-9,-8,.)    
replace utplay_r2=. 	if inlist(p11_a1,-9,-8,.)    
replace utwattv_r2=. 	if inlist(p11_a1,-9,-8,.)    
replace utpc_r2=. 		if inlist(p11_a1,-9,-8,.)   
replace utread_r2=. 	if inlist(p11_a1,-9,-8,.)    
replace utintcaf_r2=. 	if inlist(p11_a1,-9,-8,.)   


* CHECKS
*-------
sum uthelpho_r2 - utintcaf_r2


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es uthelpho_r2 - utintcaf_r2
order codest codmod grado seccion orden_es nombr_es uthelpho_r2 - utintcaf_r2
saveold "Intermedias/input_r2_aux13_3.dta",replace



****
*	13.4)SOCIAL NETWORKS: WEAK FRIENDS
****
use "Intermedias/input_r2_aux1.dta",clear
merge 1:1 codest using  "Intermedias/input_r2_aux6.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux12.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_1.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_2.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_3.dta",nogen
keep if grado>=3 & grado<=6
saveold "Intermedias/input_r2_aux13_4a.dta",replace

use "Originales\Ronda2\cestudiante_g3-6_p1_r2.dta", clear
rename CODMOD - CODIGO_EST2, lower
rename (codigo_est nomest) (orden_es nombr_es)

* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS
*------------------------------------------------
drop if inlist(p11_a1,-9,-8,.) & inlist(p11_a2,-9,-8,.) & inlist(p11_a3,-9,-8,.) & inlist(p11_a4,-9,-8,.) & inlist(p11_a5,-9,-8,.) & inlist(p11_a6,-9,-8,.) ///
	  & inlist(p11_a7,-9,-8,.) & inlist(p11_a8,-9,-8,.) & inlist(p11_a9,-9,-8,.) & inlist(p11_a10,-9,-8,.) & inlist(p11_a11,-9,-8,.) ///
	  & p12_1==. & p12_2==. & p12_3==. &  p12_4==. &  p13_1==. &  p13_2==. &  p13_3==. &  p13_4==. &  p14_1==. & p14_2==. & p14_3==. & p14_4==.
	  
	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


*-------------------------------------------------------------------------------------------------
* NUMBER OF FRIENDS (BEST, HOMEWORK, VISIT HOME)= NUMBER OF KIDS WHO REPORT AN STUDENT AS A FRIEND
*------------------------------------------------------------------------------------------------- 
merge 1:1 codest using "Intermedias/input_r2_aux13_4a.dta", nogenerate
merge 1:1 codest using "Auxiliares\listas_final.dta", keep(match) nogenerate
sort codest orden_es
gen temp=1
qui summ orden_es
qui local j=r(max)																	/*PROVIDES THE GREATEST NUMBER FOR THE VARIABLE ORDEN_ES (THE ORDER OF THE KID IN A SECTION)*/
rename (p12_1 	   p12_2 	  p12_3 	 p12_4 	    p13_1      p13_2 	  p13_3      p13_4 	    p14_1      p14_2 	  p14_3      p14_4) ///
	   (p12_fcode1 p12_fcode2 p12_fcode3 p12_fcode4 p13_fcode1 p13_fcode2 p13_fcode3 p13_fcode4 p14_fcode1 p14_fcode2 p14_fcode3 p14_fcode4) 

	   
	   ***************************************************************
	   ****************************************************************
	   ***************************************************************
	   
quietly forv k=12/14 {																	
    
	/*P12 TO P14 ARE THE QUESTION FOR BEST/HOMEWORK/VISIT FRIENDS*/

	quietly foreach x in p`k'_fcode1 p`k'_fcode2 p`k'_fcode3 p`k'_fcode4 {				/*EACH STUDENT CAN REPORT UP TO FOUR FRIENDS: THE ORDER CODE OF FRIEND 1 IS REPORTED IN P`k'_FCODE1, AND SO FORTH */
		replace `x'=. if `x'==orden_es												/*IF A STUDENT REPORTS HIMSELF AS A FRIEND, WE SET THAT ENTRY AS A MISSING */
		
		quietly forv i=1/`j' {
			qui egen `x'1_`i'=sum(temp) if  `x'==`i', by (codmod grado seccion)		/*GENERATE A VARIABLE WITH THE NUMBER OF TIMES A STUDENT IS REPORTED AS A FRIEND PER SECTION. WE HAVE AS MANY VARIABLES AS STUDENTS PER SECTION */
			qui egen `x'2_`i'=mean(`x'1_`i'), by (codmod grado seccion)				/*COPY THE SAME NUMBER CALCULATED IN THE PREVIOUS STEP TO EACH STUDENT IN A SECTION */
			qui gen `x'3_`i'=`x'2_`i' if orden_es==`i'								/*GENERATE A VARIABLE WITH THE NUMBER OF FRIENDS (BEST/HOME/VISIT) EACH STUDENT HAS */
			qui replace `x'3_`i'=0 if `x'3_`i'==.									
			qui drop `x'1_`i' `x'2_`i'
			
			qui egen plott`x'1_`i'=sum(temp) if  `x'==`i' & temp==participated_in_lottery, by (codmod grado seccion)		/*REPLICATE THE SAME PROCESS BUT RESTRICTED ONLY TO FRIENDS THAT PARTICIPATED IN THE LOTTERY.*/
			qui egen plott`x'2_`i'=mean(plott`x'1_`i'), by (codmod grado seccion)											/*OUTPUT: NUMBER OF "PARTICIPATING" FRIENDS EACH STUDENT HAS. */
			qui gen  plott`x'3_`i'=plott`x'2_`i' if orden_es==`i'																
			qui replace plott`x'3_`i'=0 if plott`x'3_`i'==.									
			qui drop plott`x'1_`i' plott`x'2_`i'
			
			qui egen wlott`x'1_`i'=sum(temp) if  `x'==`i' & temp== won_lottery, by (codmod grado seccion)		/*REPLICATE THE SAME PROCESS BUT RESTRICTED ONLY TO FRIENDS THAT WON THE LOTTERY.*/
			qui egen wlott`x'2_`i'=mean(wlott`x'1_`i'), by (codmod grado seccion)								/*OUTPUT: NUMBER OF "WINNING" FRIENDS EACH STUDENT HAS. */
			qui gen  wlott`x'3_`i'=wlott`x'2_`i' if orden_es==`i'																
			qui replace wlott`x'3_`i'=0 if wlott`x'3_`i'==.									
			qui drop wlott`x'1_`i' wlott`x'2_`i'
			
		}
	}
}

egen wfrndbest_r2=rowtotal(p12_fcode13* p12_fcode23* p12_fcode33* p12_fcode43*), missing
egen wfrndwork_r2=rowtotal(p13_fcode13* p13_fcode23* p13_fcode33* p13_fcode43*), missing
egen wfrndvist_r2=rowtotal(p14_fcode13* p14_fcode23* p14_fcode33* p14_fcode43*), missing

egen wfrndbestplott_r2=rowtotal(plottp12_fcode13* plottp12_fcode23* plottp12_fcode33* plottp12_fcode43*), missing
egen wfrndworkplott_r2=rowtotal(plottp13_fcode13* plottp13_fcode23* plottp13_fcode33* plottp13_fcode43*), missing
egen wfrndvistplott_r2=rowtotal(plottp14_fcode13* plottp14_fcode23* plottp14_fcode33* plottp14_fcode43*), missing

egen wfrndbestwlott_r2=rowtotal(wlottp12_fcode13* wlottp12_fcode23* wlottp12_fcode33* wlottp12_fcode43*), missing
egen wfrndworkwlott_r2=rowtotal(wlottp13_fcode13* wlottp13_fcode23* wlottp13_fcode33* wlottp13_fcode43*), missing
egen wfrndvistwlott_r2=rowtotal(wlottp14_fcode13* wlottp14_fcode23* wlottp14_fcode33* wlottp14_fcode43*), missing

drop  p12_fcode13* p12_fcode23* p12_fcode33* p12_fcode43* p13_fcode13* p13_fcode23* p13_fcode33* p13_fcode43* p14_fcode13* p14_fcode23* p14_fcode33* p14_fcode43* plott* wlott*


*-----------------------------------------------
* GENERATE NUMBER OF ONE-WAY/WEAK TOTAL CONTACTS
*-----------------------------------------------
forv k=13/14 {																	/* SET TO MISSING P6_FCODE IF THE SAME STUDENT WAS REPORTED AS A FRIEND IN P7_FCODE OR P8_FCODE*/
	forv j=1/4 {
		forv i=1/4 {
			replace  p12_fcode`j'=. if  p12_fcode`j'== p`k'_fcode`i'
			}
		}
	}

forv j=1/4 {																	/* SET TO MISSING P7_FCODE IF THE SAME STUDENT WAS REPORTED AS A FRIEND IN P8_FCODE*/
	forv i=1/4 {
		replace  p13_fcode`j'=. if  p13_fcode`j'== p14_fcode`i'
		}
	}



qui summ orden_es
qui local j=r(max)

qui forv k=12/14 {																	/*P6 TO P8 ARE THE QUESTION FOR BEST/HOMEWORK/VISIT FRIENDS*/

	qui foreach x in p`k'_fcode1 p`k'_fcode2 p`k'_fcode3 p`k'_fcode4 {				/*EACH STUDENT CAN REPORT UP TO FOUR FRIENDS: THE ORDER CODE OF FRIEND 1 IS REPORTED IN P`k'_FCODE1, AND SO FORTH */
		replace `x'=. if `x'==orden_es												/*IF A STUDENT REPORTS HIMSELF AS A FRIEND, WE SET THAT ENTRY AS A MISSING */
		
		qui forv i=1/`j' {
			qui egen `x'1_`i'=sum(temp) if  `x'==`i', by (codmod grado seccion)		/*GENERATE A VARIABLE WITH THE NUMBER OF TIMES A STUDENT IS REPORTED AS A FRIEND PER SECTION. WE HAVE AS MANY VARIABLES AS STUDENTS PER SECTION */
			qui egen `x'2_`i'=mean(`x'1_`i'), by (codmod grado seccion)				/*COPY THE SAME NUMBER CALCULATED IN THE PREVIOUS STEP TO EACH STUDENT IN A SECTION */
			qui gen `x'3_`i'=`x'2_`i' if orden_es==`i'								/*GENERATE A VARIABLE WITH THE NUMBER OF FRIENDS (BEST/HOME/VISIT) EACH STUDENT HAS */
			qui replace `x'3_`i'=0 if `x'3_`i'==.									
			qui drop `x'1_`i' `x'2_`i'
			
			qui egen plott`x'1_`i'=sum(temp) if  `x'==`i' & temp==participated_in_lottery, by (codmod grado seccion)		/*REPLICATE THE SAME PROCESS BUT RESTRICTED ONLY TO FRIENDS THAT PARTICIPATED IN THE LOTTERY.*/
			qui egen plott`x'2_`i'=mean(plott`x'1_`i'), by (codmod grado seccion)											/*OUTPUT: NUMBER OF "PARTICIPATING" FRIENDS EACH STUDENT HAS. */
			qui gen  plott`x'3_`i'=plott`x'2_`i' if orden_es==`i'																
			qui replace plott`x'3_`i'=0 if plott`x'3_`i'==.									
			qui drop plott`x'1_`i' plott`x'2_`i'
			
			qui egen wlott`x'1_`i'=sum(temp) if  `x'==`i' & temp== won_lottery, by (codmod grado seccion)		/*REPLICATE THE SAME PROCESS BUT RESTRICTED ONLY TO FRIENDS THAT WON THE LOTTERY.*/
			qui egen wlott`x'2_`i'=mean(wlott`x'1_`i'), by (codmod grado seccion)								/*OUTPUT: NUMBER OF "WINNING" FRIENDS EACH STUDENT HAS. */
			qui gen  wlott`x'3_`i'=wlott`x'2_`i' if orden_es==`i'																
			qui replace wlott`x'3_`i'=0 if wlott`x'3_`i'==.									
			qui drop wlott`x'1_`i' wlott`x'2_`i'
			
		}
	}
}

egen wfrndtot_r2=rowtotal(p12_fcode13* p12_fcode23* p12_fcode33* p12_fcode43* p13_fcode13* p13_fcode23* p13_fcode33* p13_fcode43* p14_fcode13* p14_fcode23* p14_fcode33* p14_fcode43*), missing
egen wfrndtotplott_r2=rowtotal(plottp12_fcode13* plottp12_fcode23* plottp12_fcode33* plottp12_fcode43* plottp13_fcode13* plottp13_fcode23* plottp13_fcode33* plottp13_fcode43* plottp14_fcode13* plottp14_fcode23* plottp14_fcode33* plottp14_fcode43*), missing
egen wfrndtotwlott_r2=rowtotal(wlottp12_fcode13* wlottp12_fcode23* wlottp12_fcode33* wlottp12_fcode43* wlottp13_fcode13* wlottp13_fcode23* wlottp13_fcode33* wlottp13_fcode43* wlottp14_fcode13* wlottp14_fcode23* wlottp14_fcode33* wlottp14_fcode43*), missing

drop temp p12_fcode13* p12_fcode23* p12_fcode33* p12_fcode43* p13_fcode13* p13_fcode23* p13_fcode33* p13_fcode43* p14_fcode13* p14_fcode23* p14_fcode33* p14_fcode43* plott* wlott*


* CHECKS
*-------
sum wfrndbest_r2 wfrndwork_r2 wfrndvist_r2 wfrndtot_r2 wfrndbestplott_r2 wfrndworkplott_r2 wfrndvistplott_r2 wfrndtotplott_r2 wfrndbestwlott_r2 wfrndworkwlott_r2 wfrndvistwlott_r2 wfrndtotwlott_r2


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es wfrndbest_r2 wfrndwork_r2 wfrndvist_r2 wfrndtot_r2 wfrndbestplott_r2 wfrndworkplott_r2 wfrndvistplott_r2 wfrndtotplott_r2 wfrndbestwlott_r2 wfrndworkwlott_r2 wfrndvistwlott_r2 wfrndtotwlott_r2
order codest codmod grado seccion orden_es nombr_es wfrndbest_r2 wfrndwork_r2 wfrndvist_r2 wfrndtot_r2 wfrndbestplott_r2 wfrndworkplott_r2 wfrndvistplott_r2 wfrndtotplott_r2 wfrndbestwlott_r2 wfrndworkwlott_r2 wfrndvistwlott_r2 wfrndtotwlott_r2
saveold "Intermedias/input_r2_aux13_4.dta",replace


****
*	13.5)SOCIAL NETWORKS: STRONG FRIENDS
****
use "Originales\Ronda2\cestudiante_g3-6_p1_r2.dta", clear
rename CODMOD - CODIGO_EST2, lower
rename (codigo_est nomest) (orden_es nombr_es)

* DROP OBSERVATIONS WITH MISSING IN ALL QUESTIONS
*------------------------------------------------
drop if inlist(p11_a1,-9,-8,.) & inlist(p11_a2,-9,-8,.) & inlist(p11_a3,-9,-8,.) & inlist(p11_a4,-9,-8,.) & inlist(p11_a5,-9,-8,.) & inlist(p11_a6,-9,-8,.) ///
	  & inlist(p11_a7,-9,-8,.) & inlist(p11_a8,-9,-8,.) & inlist(p11_a9,-9,-8,.) & inlist(p11_a10,-9,-8,.) & inlist(p11_a11,-9,-8,.) ///
	  & p12_1==. & p12_2==. & p12_3==. &  p12_4==. &  p13_1==. &  p13_2==. &  p13_3==. &  p13_4==. &  p14_1==. & p14_2==. & p14_3==. & p14_4==.
	  
	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


*--------------------------------------------------------------------------------------------------------------------------------
* GENERATE NUMBER OF RECIPROCAL/STRONG FRIENDS (BEST, HOMEWORK, VISIT HOME)= NUMBER OF KIDS WHO REPORT AN STUDENT AS A FRIEND AND 
*																			 THAT STUDENT REPORT THEM AS A FRIEND TOO. 
*---------------------------------------------------------------------------------------------------------------------------------
merge 1:1 codest using "Auxiliares\listas_final.dta", keep(match) nogenerate
sort codest orden_es
qui summ orden_es
qui local j=r(max)																	/*PROVIDES THE GREATEST NUMBER FOR THE VARIABLE ORDEN_ES (THE ORDER OF THE KID IN A SECTION)*/
qui local x=`j'-1
rename (p12_1 	   p12_2 	  p12_3 	 p12_4 	    p13_1      p13_2 	  p13_3      p13_4 	    p14_1      p14_2 	  p14_3      p14_4) ///
	   (p12_fcode1 p12_fcode2 p12_fcode3 p12_fcode4 p13_fcode1 p13_fcode2 p13_fcode3 p13_fcode4 p14_fcode1 p14_fcode2 p14_fcode3 p14_fcode4) 
	   
	   
* BEST FRIENDS
*-------------
forv k=1/`j'{

	forv i=1/`j' {
	qui bysort codmod grado seccion: gen v`k'_`i'=(p12_fcode1==`k'| p12_fcode2==`k'| p12_fcode3==`k'| p12_fcode4==`k') if orden_es==`i'      /*GENERATE A DUMMY THAT IS EQUAL TO 1 IF STUDENT "i" REPORTS STUDENT "k" AS A FRIEND*/
	qui egen t`k'_`i'=mean(v`k'_`i'), by ( codmod grado seccion)																			 /*GENERATE A VARIABLE WITH THE SAME VALUE OF THE DUMMY CREATED IN THE PREVIOUS STEP FOR EACH SECTION*/
	qui drop v`k'_`i'
	}
	
}


forv k=1/`j'{

local z=`k'+1

	forv i=`z'/`j' {
	qui gen f`k'_`i'=(t`k'_`i'==1& t`i'_`k'==1) if orden_es==`i' | orden_es==`k'								/*GENERATE A DUMMY THAT IS EQUAL TO 1 IF STUDENT "i" REPORTS STUDENT "k" AS A FRIEND AND STUDENT "k" REPORTS STUDENT "i" AS A FRIEND*/
	qui replace f`k'_`i'=0 if f`k'_`i'==.
	}
	
}
drop t*
egen rfrndbest_r2=rowtotal( f1_2 -f`x'_`j'), missing															 /*GENERATE THE NUMBER OF RECIPROCAL BEST FRIENDS*/
drop f1_2 -f`x'_`j'



* HOMEWORK FRIENDS
*-----------------
forv k=1/`j'{

	forv i=1/`j' {
	qui bysort codmod grado seccion: gen v`k'_`i'=(p13_fcode1==`k' | p13_fcode2==`k'  | p13_fcode3==`k'  | p13_fcode4==`k') if orden_es==`i'
	qui egen t`k'_`i'=mean(v`k'_`i'), by ( codmod grado seccion)
	qui drop v`k'_`i'
	}
	
}


forv k=1/`j'{

local z=`k'+1

	forv i=`z'/`j' {
	qui gen f`k'_`i'=(t`k'_`i'==1& t`i'_`k'==1) if orden_es==`i' | orden_es==`k'
	qui replace f`k'_`i'=0 if f`k'_`i'==.
	}
	
}
drop t*
egen rfrndwork_r2=rowtotal(f1_2 -f`x'_`j'), missing
drop f1_2 -f`x'_`j'



* VISIT HOME FRIENDS
*-------------------
forv k=1/`j'{

	forv i=1/`j' {
	qui bysort codmod grado seccion: gen v`k'_`i'=(p14_fcode1==`k' | p14_fcode2==`k'  | p14_fcode3==`k'  | p14_fcode4==`k') if orden_es==`i'
	qui egen t`k'_`i'=mean(v`k'_`i'), by ( codmod grado seccion)
	qui drop v`k'_`i'
	}
	
}


forv k=1/`j'{

local z=`k'+1

	forv i=`z'/`j' {
	qui gen f`k'_`i'=(t`k'_`i'==1& t`i'_`k'==1) if orden_es==`i' | orden_es==`k'
	qui replace f`k'_`i'=0 if f`k'_`i'==.
	}
	
}

drop t*
egen rfrndvist_r2=rowtotal(f1_2 -f`x'_`j'), missing
drop f1_2 -f`x'_`j'
egen rfrndtot_r2=rowtotal(rfrndbest_r2 rfrndwork_r2 rfrndvist_r2)


* CHECKS
*-------
summ rfrndbest_r2 rfrndwork_r2 rfrndvist_r2 rfrndtot_r2


format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es rfrndbest_r2 rfrndwork_r2 rfrndvist_r2 rfrndtot_r2
order codest codmod grado seccion orden_es nombr_es rfrndbest_r2 rfrndwork_r2 rfrndvist_r2 rfrndtot_r2
saveold "Intermedias/input_r2_aux13_5.dta",replace




****
*	13.6)SKILLS: OBJECTIVE PC AND INTERNET TEST
****

use "Originales\Ronda2\cestudiante_g3-6_p2_r2.dta", clear
rename CODMOD -  CODIGO_EST2, lower
rename (codigo_est nomest) (orden_es nombr_es)


* KEEP OBSERVATIONS THAT ANSWERED WHETHER THEY HAVE PC OR LAPTOP AT HOME (P4)
*----------------------------------------------------------------------------
keep if p3==1 | p3==2

	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE SCORES: OBJECTIVE PC AND INTERNET TEST
*----------------
gen dttypew_r2=(p91==3)
gen dtmouse_r2=(p92==1)
gen dtshift_r2=(p93==1)
gen dtnews_r2=(p94==2)
gen dtemail_r2=(p95==3)
gen dtuemail1_r2=(p96_a1==2)
gen dtuemail2_r2=(p96_a2==1)
gen dtuemail3_r2=(p96_a3==2)
gen dtuemail4_r2=(p96_a4==2)
gen dtuinter1_r2=(p97_a1==1)
gen dtuinter2_r2=(p97_a2==2)
gen dtuinter3_r2=(p97_a3==1)
gen dtuinter4_r2=(p97_a4==1)
gen dtuinter5_r2=(p97_a5==1)
egen pcotskill_r2=rowtotal(dttypew_r2 dtmouse_r2 dtshift_r2 dtnews_r2 dtemail_r2),missing
egen pcotskill2_r2=rowtotal(dtuemail1_r2-dtuinter5_r2),missing
egen pcotskill3_r2=rowtotal(dttypew_r2-dtuinter5_r2),missing


* GENERATE SCORES: SELF-REPORTED PC AND INTERNET SKILLS
*----------------
gen dttopc_r2=p10_a1==1 
gen dtcfold_r2=p10_a2==1 
gen dtdelef_r2=p10_a3==1 
gen dtcopyf_r2=p10_a4==1 
gen dtopweb_r2=p10_a5==1
gen dtyahgog_r2=p10_a6==1 
gen dtsemail_r2=p10_a7==1 
gen dtattaf_r2=p10_a8==1
gen dtprint_r2=p10_a9==1 
gen dtexcel_r2=p10_a10==1 
gen dtword_r2=p10_a11==1
egen pcsrskill_r2=rowtotal(dttopc_r2-dtattaf_r2), missing
egen pcsrskill2_r2=rowtotal(dttopc_r2-dtword_r2), missing


* CHECKS
*----------------
summ pcotskill* pcsrskill* dt*
alpha dt*,item																		/*ALPHAS NEAR 0.4*/

format codest %20.0f
keep codest codmod grado seccion orden_es nombr_es pcotskill* pcsrskill* dttypew_r2-dtuinter5_r2 dttopc_r2-dtword_r2
order codest codmod grado seccion orden_es nombr_es pcotskill* pcsrskill* dttypew_r2-dtuinter5_r2 dttopc_r2-dtword_r2
saveold "Intermedias/input_r2_aux13_6s.dta",replace
keep codest codmod grado seccion orden_es nombr_es pcotskill* pcsrskill*
saveold "Intermedias/input_r2_aux13_6.dta",replace


********************************************************************************
*	19) MERGING DATASETS FOR WAVE 2
********************************************************************************

use "Intermedias/input_r2_aux1.dta",clear
merge 1:1 codest using  "Intermedias/input_r2_aux6.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux12.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_1.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_2.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_3.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_4.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_5.dta",nogen
merge 1:1 codest using  "Intermedias/input_r2_aux13_6.dta",nogen
rename (grado seccion) (grado_r2 seccion_r2)
saveold "Intermedias/input_r2.dta",replace 


cd "C:\Users\Roberto Carlos\Desktop\Ciclo-2020-2\Econometria_aplicada\Control_Trails\data\Intermedias"	
!erase input_r2_*.dta
clear all
