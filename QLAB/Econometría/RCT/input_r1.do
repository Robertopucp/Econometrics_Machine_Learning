
clear all 
cap log close
set more off


*	CHANGE DIRECTORY
cd "C:\Users\Roberto Carlos\Desktop\Ciclo-2020-2\Econometria_aplicada\Control_Trails\data"	


********************************************************************************
*	4) MATH
********************************************************************************
/*NOTE: THIS INSTRUMENT HAS TWO PARTS FOR STUDENTS IN 2ND AND 3RD GRADE. 
		EACH PART HAS THE SAME QUESTIONS, BUT THE ORDER OF THE QUESTIONS ARE DIFFERENT.///
		WE FOLLOW THIS PROCEDURE TO PREVENT STUDENTS FROM CHEATING */

		
****
*	4.1) GENERATE SCORES FOR MATH: 2ND GRADE
****

* STANDARIZE ORDER OF VARIABLES OF FORM 2 ACCORDING TO FORM 1
*------------------------------------------------------------
use "Originales\Ronda1\logico_g2_f2_r1.dta",clear
rename (p5 p6 p1 p2 p3 p4 p9 p10 p11 p12 p13 p7  p8  p15 p14 p16 p17 p18 p19 p20 p25 p26 p27 p21 p22 p23 p24 p30 p29 p28 p32 p31 p34 p33) ///
       (p1 p2 p3 p4	p5 p6 p7 p8	 p9	 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34)

gen forma=2

append using "Originales\Ronda1\logico_g2_f1_r1.dta"
replace forma=1 if forma==.


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/34 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
// Permite mostrar obervaciones repetidas de una variabe

duplicates list codest


* GENERATE SCORES
*----------------
gen sp1_mathr1=(p1==3)
gen sp2_mathr1=(p2==3)
gen sp3_mathr1=(p3==1)
gen sp4_mathr1=(p4==1)
gen sp5_mathr1=(p5==3)
gen sp6_mathr1=(p6==2)
gen sp7_mathr1=(p7==1)
gen sp8_mathr1=(p8==6)
gen sp9_mathr1=(p9==8)
gen sp10_mathr1=(p10==4)
gen sp11_mathr1=(p11==5)
gen sp12_mathr1=(p12==2)
gen sp13_mathr1=(p13==1)
gen sp14_mathr1=(p14==3)
gen sp15_mathr1=(p15==3)
gen sp16_mathr1=(p16==5)
gen sp17_mathr1=(p17==67)
gen sp18_mathr1=(p18==79)
gen sp19_mathr1=(p19==15)
gen sp20_mathr1=(p20==40)
gen sp21_mathr1=(p21==7)
gen sp22_mathr1=(p22==14)
gen sp23_mathr1=(p23==21)
gen sp24_mathr1=(p24==5)
gen sp25_mathr1=(p25==55)
gen sp26_mathr1=(p26==11)
gen sp27_mathr1=(p27==3)
gen sp28_mathr1=(p28==3)
gen sp29_mathr1=(p29==7)
gen sp30_mathr1=(p30==2)
gen sp31_mathr1=(p31==5)
gen sp32_mathr1=(p32==8)
gen sp33_mathr1=(p33==2)
gen sp34_mathr1=(p34==1)
egen math_r1=rowtotal(sp1_mathr1 - sp34_mathr1), missing


* CHECKS
*-------
summ math_r1 sp*
alpha sp*, item
saveold "Intermedias/input_r1_aux4_1s.dta",replace
collapse sp1_mathr1 - sp34_mathr1,by(forma)
xpose,clear varname           // Transpuesta de la matrix
gen dif=v1-v2
gsort -dif
list


use "Intermedias/input_r1_aux4_1s.dta",clear
format codest %20.0f 
keep codest codmod grado seccion orden_es math_r1 sp1_mathr1 - sp34_mathr1
order codest codmod grado seccion orden_es  math_r1 sp1_mathr1 - sp34_mathr1
saveold "Intermedias/input_r1_aux4_1s.dta",replace
keep codest codmod grado seccion orden_es  math_r1
saveold "Intermedias/input_r1_aux4_1.dta",replace



****
*	4.2) GENERATE SCORES FOR MATH: 3RD GRADE
****

* STANDARIZE ORDER OF VARIABLES OF FORM 2 ACCORDING TO FORM 1
*------------------------------------------------------------
use "Originales\Ronda1\logico_g3_f2_r1.dta",clear
rename (p1 p4 p5 p6 p7 p2 p3 p8 p9 p10 p11 p16 p17 p18 p12 p13 p14 p15 p19 p20 p21 p22 p23 p24 p26 p25 p27 p29 p28 p30 p31 p33 p34 p32 p35) ///
	   (p1 p2 p3 p4	p5 p6 p7 p8	p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35)

gen forma=2
append using "Originales\Ronda1\logico_g3_f1_r1.dta"
replace forma=1 if forma==.


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/35 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest
gen aux=uniform()
sort codest aux
bysort codest: gen aux2=_n
keep if aux2==1
drop aux aux2


* GENERATE SCORES
*----------------
gen sp1_mathr1=(p1==1)
gen sp2_mathr1=(p2==6)
gen sp3_mathr1=(p3==8)
gen sp4_mathr1=(p4==4)
gen sp5_mathr1=(p5==5)
gen sp6_mathr1=(p6==3)
gen sp7_mathr1=(p7==67)
gen sp8_mathr1=(p8==79)
gen sp9_mathr1=(p9==40)
gen sp10_mathr1=(p10==2)
gen sp11_mathr1=(p11==2)
gen sp12_mathr1=(p12==3)
gen sp13_mathr1=(p13==14)
gen sp14_mathr1=(p14==1)
gen sp15_mathr1=(p15==1)
gen sp16_mathr1=(p16==55)
gen sp17_mathr1=(p17==11)
gen sp18_mathr1=(p18==3)
gen sp19_mathr1=(p19==1)
gen sp20_mathr1=(p20==3)
gen sp21_mathr1=(p21==2)
gen sp22_mathr1=(p22==2)
gen sp23_mathr1=(p23==2)
gen sp24_mathr1=(p24==8)
gen sp25_mathr1=(p25==2)
gen sp26_mathr1=(p26==2)
gen sp27_mathr1=(p27==3)
gen sp28_mathr1=(p28==3)
gen sp29_mathr1=(p29==1)
gen sp30_mathr1=(p30==3)
gen sp31_mathr1=(p31==1)
gen sp32_mathr1=(p32==2)
gen sp33_mathr1=(p33==3)
gen sp34_mathr1=(p34==3)
gen sp35_mathr1=(p35==3)
egen math_r1=rowtotal(sp1_mathr1 - sp35_mathr1), missing


* CHECKS
*-------
summ math_r1 sp*
alpha sp*, item
saveold "Intermedias/input_r1_aux4_2s.dta",replace
collapse sp1_mathr1 - sp35_mathr1,by(forma)
xpose,clear varname
gen dif=v1-v2
gsort -dif
list


use "Intermedias/input_r1_aux4_2s.dta",clear
format codest %20.0f
keep codest codmod grado seccion orden_es  math_r1 sp1_mathr1 - sp35_mathr1
saveold "Intermedias/input_r1_aux4_2s.dta",replace
keep codest codmod grado seccion orden_es  math_r1 
saveold "Intermedias/input_r1_aux4_2.dta",replace



****
*	4.3) GENERATE SCORES FOR MATH: 4TH GRADE
****
use "Originales\Ronda1\logico_g4_r1.dta",clear

* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/35 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE SCORES
*----------------
gen sp1_mathr1=(p1==503)
gen sp2_mathr1=(p2==8015)
gen sp3_mathr1=(p3==206)
gen sp4_mathr1=(p4==2)
gen sp5_mathr1=(p5==3)
gen sp6_mathr1=(p6==1)
gen sp7_mathr1=(p7==1)
gen sp8_mathr1=(p8==9590)
gen sp9_mathr1=(p9==793)
gen sp10_mathr1=(p10==1094)
gen sp11_mathr1=(p11==75)
gen sp12_mathr1=(p12==62)
gen sp13_mathr1=(p13==3)
gen sp14_mathr1=(p14==1)
gen sp15_mathr1=(p15==2)
gen sp16_mathr1=(p16==3)
gen sp17_mathr1=(p17==4)
gen sp18_mathr1=(p18==2)
gen sp19_mathr1=(p19==2)
gen sp20_mathr1=(p20==3)
gen sp21_mathr1=(p21==2)
gen sp22_mathr1=(p22==3)
gen sp23_mathr1=(p23==3)
gen sp24_mathr1=(p24==48)
gen sp25_mathr1=(p25==54)
gen sp26_mathr1=(p26==7)
gen sp27_mathr1=(p27==424)
gen sp28_mathr1=(p28==6080)
gen sp29_mathr1=(p29==3840)
gen sp30_mathr1=(p30==4)
gen sp31_mathr1=(p31==21)
gen sp32_mathr1=(p32==67.5)																			/*NO ONE ANSWERED THIS QUESTION CORRECTLY */
gen sp33_mathr1=(p33==30)
gen sp34_mathr1=(p34==4)
gen sp35_mathr1=(p35==52)
egen math_r1=rowtotal(sp1_mathr1 - sp35_mathr1), missing


* CHECKS
*-------
summ math_r1 sp*
alpha sp*, item


format codest %20.0f
keep codest codmod grado seccion orden_es  math_r1 sp1_mathr1 - sp35_mathr1
saveold "Intermedias/input_r1_aux4_3s.dta",replace
keep codest codmod grado seccion orden_es  math_r1
saveold "Intermedias/input_r1_aux4_3.dta",replace



****
*	4.4) GENERATE SCORES FOR MATH: 5TH GRADE
****
use "Originales\Ronda1\logico_g5_r1.dta",clear


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
drop if inlist(p1, -9,.)  & inlist(p2, -9,.)  & inlist(p3_1,-9,.)  & inlist(p3_2,-9,.)  & inlist(p3_3,-9,.)  & inlist(p3_4,-9,.)  & inlist(p3_5,-9,.) ///
	  & inlist(p3_6,-9,.) & inlist(p3_7,-9,.) & inlist(p3_8,-9,.)  & inlist(p4, -9,.)   & inlist(p5, -9,.)   & inlist(p6, -9,.)   & inlist(p7, -9,.) ///
	  & inlist(p8, -9,.)  & inlist(p9, -9,.)  & inlist(p10, -9,.)  & inlist(p11,-9,.)   & inlist(p12,-9,.)   & inlist(p13,-9,.)   & inlist(p14,-9,.) ///
	  & inlist(p15,-9,.)  & inlist(p16,-9,.)  & inlist(p17,-9,.)   & inlist(p18,-9,.)   & inlist(p19,-9,.)   & inlist(p20,-9,.)   & inlist(p21,-9,.) ///
	  & inlist(p22,-9,.)  & inlist(p23,-9,.)  & inlist(p24,-9,.)   & inlist(p25,-9,.)   & inlist(p26,-9,.)   & inlist(p27,-9,.)   & inlist(p28,-9,.) ///
	  & inlist(p29,-9,.)  & inlist(p30,-9,.)  & inlist(p31_1,-9,.) & inlist(p31_2,-9,.) & inlist(p31_3,-9,.) & inlist(p31_4,-9,.) & inlist(p32,-9,.) /// 
	  & inlist(p33,-9,.)  & inlist(p34,-9,.)  & inlist(p35,-9,.)   & inlist(p36_1,-9,.) & inlist(p36_2,-9,.) & inlist(p37,-9,.) 

	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE SCORES
*----------------
gen sp1_mathr1=(p1==79)
gen sp2_mathr1=(p2==2482)

forval x=1/8 {																	 /* VALUES ARE NOT VISIBLE IN THE BROWSE WINDOWS IN STATA, BUT THEY EXIST.*/
gen g_p3_`x'=p3_`x'>0&p3_`x'<100												 /* EACH QUESTIONS FROM P3_1 TO P3_8 REGISTER EACH NUMBER CHOSEN BY THE KID*/
replace g_p3_`x'=. if p3_`x'==.
gen b_p3_`x'=p3_`x'>100
replace b_p3_`x'=. if p3_`x'==.
}
egen Tsp3=rowtotal( g_p3_1 g_p3_2 g_p3_3 g_p3_4 g_p3_5 g_p3_6 g_p3_7 g_p3_8), missing
egen Tb_p3=rowtotal( b_p3_1 b_p3_2 b_p3_3 b_p3_4 b_p3_5 b_p3_6 b_p3_7 b_p3_8), missing
gen sp3_mathr1=Tsp3==5&Tb_p3==0
drop Tsp3 Tb_p3 g_* b_*

gen sp4_mathr1=(p4==75)
gen sp5_mathr1=(p5==16)
gen sp6_mathr1=(p6==3)
gen sp7_mathr1=(p7==2)
gen sp8_mathr1=(p8==1)
gen sp9_mathr1=(p9==7814)
gen sp10_mathr1=(p10==1094)
gen sp11_mathr1=(p11==2548)
gen sp12_mathr1=(p12==15)
gen sp13_mathr1=(p13==780)
gen sp14_mathr1=(p14==2500)
gen sp15_mathr1=(p15==48)
gen sp16_mathr1=(p16==54)
gen sp17_mathr1=(p17==729)
gen sp18_mathr1=(p18==134)
gen sp19_mathr1=(p19==7)
gen sp20_mathr1=p20>=1.399&p20<1.401													 /*YOU NEED YO SET THE RANGE p20>=1.399&p20<1.401 TO GET A DUMMY WITH VALUE EQUAL TO ONE WHEN p20=1.4*/
gen sp21_mathr1=(p21==59.5)
gen sp22_mathr1=(p22==424)
gen sp23_mathr1=(p23==6080)
gen sp24_mathr1=(p24==21)
gen sp25_mathr1=p25==67.5
gen sp26_mathr1=(p26==3)
gen sp27_mathr1=(p27==4)
gen sp28_mathr1=(p28==1)
gen sp29_mathr1=(p29==30)
gen sp30_mathr1=(p30==4)
gen sp31_mathr1=((p31_1>.099 & p31_1<.101) & p31_2==.25 & p31_3==.5 & p31_4==1)  /*YOU NEED YO SET THE RANGE p31_1>.099 & p31_1<.101 BECAUSE P31_1=0.1 IS NOT RECOGNIZED BY THE PROGRAM*/
gen sp32_mathr1=(p32==245)
gen sp33_mathr1=(p33==21)
gen sp34_mathr1=(p34==3)
gen sp35_mathr1=(p35==4)
gen sp36_mathr1=(p36_1/p36_2==0.5)
gen sp37_mathr1=(p37==21)
egen math_r1=rowtotal(sp1_mathr1-sp37_mathr1)


* CHECKS
*-------
summ math_r1 sp*
alpha math_r1 sp*, item


format codest %20.0f
keep codest codmod grado seccion orden_es  math_r1  sp1_mathr1 - sp37_mathr1
order codest codmod grado seccion orden_es  math_r1  sp1_mathr1 - sp37_mathr1
saveold "Intermedias/input_r1_aux4_4s.dta",replace
keep codest codmod grado seccion orden_es  math_r1
saveold "Intermedias/input_r1_aux4_4.dta",replace



****
*	4.5) GENERATE SCORES FOR MATH: 6TH GRADE
****
use "Originales\Ronda1\logico_g6_r1.dta",clear


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
drop if inlist(p1, -9,.)   & inlist(p2, -9,.)   & inlist(p3, -9,.)   & inlist(p4, -9,.) & inlist(p5, -9,.) & inlist(p6, -9,.) & inlist(p7, -9,.) ///
	  & inlist(p8, -9,.)   & inlist(p9, -9,.)   & inlist(p10,-9,.)   & inlist(p11,-9,.) & inlist(p12,-9,.) & inlist(p13,-9,.) & inlist(p14,-9,.) ///
	  & inlist(p15,-9,.)   & inlist(p16,-9,.)   & inlist(p17,-9,.)   & inlist(p18,-9,.) & inlist(p19,-9,.) & inlist(p20,-9,.) & inlist(p21,-9,.) ///
	  & inlist(p22,-9,.)   & inlist(p23,-9,.)   & inlist(p24,-9,.)   & inlist(p25,-9,.) & inlist(p26,-9,.) & inlist(p27,-9,.) & inlist(p28_1,-9,.) ///
	  & inlist(p28_2,-9,.) & inlist(p29_1,-9,.) & inlist(p29_2,-9,.) & inlist(p30,-9,.) & inlist(p31,-9,.) & inlist(p32,-9,.) & inlist(p33,-9,.) ///
	  & inlist(p34,-9,.) 

	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE SCORES
*----------------
gen sp1_mathr1=(p1==3)
gen sp2_mathr1=(p2==2)
gen sp3_mathr1=(p3==1)
gen sp4_mathr1=(p4==2548)
gen sp5_mathr1=(p5==2500)
gen sp6_mathr1=(p6==1)
gen sp7_mathr1=(p7==7)
gen sp8_mathr1=(p8==1)
gen sp9_mathr1=(p9==6080)
gen sp10_mathr1=p10==67.5
gen sp11_mathr1=(p11==25)
gen sp12_mathr1=(p12==18)
gen sp13_mathr1=(p13==245)
gen sp14_mathr1=(p14==21)
gen sp15_mathr1=(p15==21)
gen sp16_mathr1=(p16==4)
gen sp17_mathr1=(p17==4)
gen sp18_mathr1=(p18==3)
gen sp19_mathr1=(p19==1)
gen sp20_mathr1=(p20==2)
gen sp21_mathr1=(p21==1)
gen sp22_mathr1=(p22==3)
gen sp23_mathr1=(p23==4)
gen sp24_mathr1=(p24==1)
gen sp25_mathr1=(p25==4)
gen sp26_mathr1=(p26==2)
gen sp27_mathr1=(p27==1)
gen sp28_mathr1=(p28_1/p28_2>=0.33 & p28_1/p28_2<0.34)
gen p29_mathr1=(p29_1/p29_2==0.5)
gen sp30_mathr1=(p30==59.5)
gen sp31_mathr1=(p31==1)
gen sp32_mathr1=(p32==3)
gen sp33_mathr1=(p33==3)
gen sp34_mathr1=(p34==4)
egen math_r1=rowtotal(sp1_mathr1 - sp34_mathr1), missing


* CHECKS
*-------
summ math_r1 sp*
alpha math_r1 sp*, item


format codest %20.0f
keep codest codmod grado seccion orden_es  math_r1 sp1_mathr1 - sp34_mathr1
order codest codmod grado seccion orden_es  math_r1 sp1_mathr1 - sp34_mathr1
saveold "Intermedias/input_r1_aux4_5s.dta",replace
keep codest codmod grado seccion orden_es  math_r1 
saveold "Intermedias/input_r1_aux4_5.dta",replace




********************************************************************************
*	5) LECTORA
********************************************************************************

****
*	5.1) GENERATE SCORES FOR LECTORA: 2ND GRADE
****

* STANDARIZE ORDER OF VARIABLES OF FORM 2 ACCORDING TO FORM 1
*------------------------------------------------------------
use "Originales\Ronda1\lectora_g2_f2_r1.dta",clear
rename (p6 p7 p1 p2 p3 p4 p5 p9 p8 p11 p12 p13 p10 p14 p150 p16 p19 p20 p17 p18 p21 p22 p23 p24 p250 p26) ///
       (p1 p2 p3 p4 p5 p6 p7 p8	p9 p10 p11 p12 p13 p14 p15 p16	p17	p18	p19	p20	p21	p22	p23	p24	p25	 p26)

gen forma=2
append using "Originales\Ronda1\lectora_g2_f1_r1.dta"
replace forma=1 if forma==.


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/26 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest
gen aux=uniform()
sort codest aux
bysort codest: gen aux2=_n
keep if aux2==1
drop aux aux2


* GENERATE SCORES
*----------------
gen sp1_readr1=(p1==1)
gen sp2_readr1=(p2==1)
gen sp3_readr1=(p3==3)
gen sp4_readr1=(p4==2)
gen sp5_readr1=(p5==1)
gen sp6_readr1=(p6==2)
gen sp7_readr1=(p7==3)
gen sp8_readr1=(p8==2)
gen sp9_readr1=(p9==3)
gen sp10_readr1=(p10==3)
gen sp11_readr1=(p11==1)
gen sp12_readr1=(p12==2)
gen sp13_readr1=(p13==2)
gen sp14_readr1=(p14==3)
gen sp15_readr1=(p15==1)
gen sp16_readr1=(p16==2)
gen sp17_readr1=(p17==2)
gen sp18_readr1=(p18==2)
gen sp19_readr1=(p19==2)
gen sp20_readr1=(p20==1)
gen sp21_readr1=(p21==3)
gen sp22_readr1=(p22==2)
gen sp23_readr1=(p23==2)
gen sp24_readr1=(p24==2)
gen sp25_readr1=(p25==3)
gen sp26_readr1=(p26==1)
egen read_r1=rowtotal(sp1_readr1 - sp26_readr1), missing


* CHECKS
*-------
summ read_r1 sp*
alpha sp*, item
saveold "Intermedias/input_r1_aux5_1s.dta",replace
collapse sp1_readr1 - sp26_readr1,by(forma)
xpose,clear varname
gen dif=v1-v2
gsort -dif
list


use "Intermedias/input_r1_aux5_1s.dta",clear
format codest %20.0f
keep codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp26_readr1
order codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp26_readr1
saveold "Intermedias/input_r1_aux5_1s.dta",replace
keep codest codmod grado seccion orden_es  read_r1
saveold "Intermedias/input_r1_aux5_1.dta",replace



****
*	5.2) GENERATE SCORES FOR LECTORA: 3RD GRADE
****

* STANDARIZE ORDER OF VARIABLES OF FORM 2 ACCORDING TO FORM 1
*------------------------------------------------------------
use "Originales\Ronda1\lectora_g3_f2_r1.dta",clear
rename (p3 p4 p5 p6 p7 p1 p2 p8 p9 p10 p11 p13 p12 p19 p20 p21 p14 p15 p16 p17 p18 p25 p26 p27 p28 p29 p30 p22 p23 p24) ///
       (p1 p2 p3 p4 p5 p6 p7 p8	p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30)

gen forma=2
append using "Originales\Ronda1\lectora_g3_f1_r1.dta"
replace forma=1 if forma==.


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/30 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest
gen aux=uniform()
sort codest aux
bysort codest: gen aux2=_n
keep if aux2==1
drop aux aux2


* GENERATE SCORES
*----------------
gen sp1_readr1=(p1==3)
gen sp2_readr1=(p2==2)
gen sp3_readr1=(p3==1)
gen sp4_readr1=(p4==2)
gen sp5_readr1=(p5==3)
gen sp6_readr1=(p6==2)
gen sp7_readr1=(p7==3)
gen sp8_readr1=(p8==2)
gen sp9_readr1=(p9==3)
gen sp10_readr1=(p10==3)
gen sp11_readr1=(p11==1)
gen sp12_readr1=(p12==3)
gen sp13_readr1=(p13==2)
gen sp14_readr1=(p14==3)
gen sp15_readr1=(p15==2)
gen sp16_readr1=(p16==2)
gen sp17_readr1=(p17==1)
gen sp18_readr1=(p18==3)
gen sp19_readr1=(p19==3)
gen sp20_readr1=(p20==2)
gen sp21_readr1=(p21==1)
gen sp22_readr1=(p22==2)
gen sp23_readr1=(p23==2)
gen sp24_readr1=(p24==3)
gen sp25_readr1=(p25==1)
gen sp26_readr1=(p26==2)
gen sp27_readr1=(p27==3)
gen sp28_readr1=(p28==3)
gen sp29_readr1=(p29==1)
gen sp30_readr1=(p30==2)
egen read_r1=rowtotal(sp1_readr1 - sp30_readr1), missing


* CHECKS
*-------
summ read_r1 sp*
alpha sp*, item
saveold "Intermedias/input_r1_aux5_2s.dta",replace
collapse sp1_readr1 - sp30_readr1,by(forma)
xpose,clear varname
gen dif=v1-v2
gsort -dif
list


use "Intermedias/input_r1_aux5_2s.dta",clear
format codest %20.0f
keep codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp30_readr1
order codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp30_readr1
saveold "Intermedias/input_r1_aux5_2s.dta",replace
keep codest codmod grado seccion orden_es  read_r1
saveold "Intermedias/input_r1_aux5_2.dta",replace



****
*	5.3) GENERATE SCORES FOR LECTORA: 4TH GRADE
****
use "Originales\Ronda1\lectora_g4_r1.dta",clear
rename CODMOD - FICHA2, lower


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/29 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest
gen aux=uniform()
sort codest aux
bysort codest: gen aux2=_n
keep if aux2==1
drop aux aux2


* GENERATE SCORES
*----------------
gen sp1_readr1=(p1==2)
gen sp2_readr1=(p2==3)
gen sp3_readr1=(p3==2)
gen sp4_readr1=(p4==1)
gen sp5_readr1=(p5==2)
gen sp6_readr1=(p6==3)
gen sp7_readr1=(p7==3)
gen sp8_readr1=(p8==1)
gen sp9_readr1=(p9==2)
gen sp10_readr1=(p10==2)
gen sp11_readr1=(p11==1)
gen sp12_readr1=(p12==3)
gen sp13_readr1=(p13==2)
gen sp14_readr1=(p14==2)
gen sp15_readr1=(p15==2)
gen sp16_readr1=(p16==1)
gen sp17_readr1=(p17==3)
gen sp18_readr1=(p18==3)
gen sp19_readr1=(p19==2)
gen sp20_readr1=(p20==1)
gen sp21_readr1=(p21==2)
gen sp22_readr1=(p22==3)
gen sp23_readr1=(p23==4)
gen sp24_readr1=(p24==3)
gen sp25_readr1=(p25==1)
gen sp26_readr1=(p26==3)
gen sp27_readr1=(p27==4)
gen sp28_readr1=(p28==3)
gen sp29_readr1=(p29==1)
egen read_r1=rowtotal(sp1_readr1 - sp29_readr1), missing


* CHECKS
*-------
sum read_r1 sp*
alpha sp*,item


format codest %20.0f
keep codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp29_readr1
order codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp29_readr1
saveold "Intermedias/input_r1_aux5_3s.dta",replace
keep codest codmod grado seccion orden_es  read_r1
saveold "Intermedias/input_r1_aux5_3.dta",replace



****
*	5.4) GENERATE SCORES FOR LECTORA: 5TH GRADE
****
use "Originales\Ronda1\lectora_g5_r1.dta",clear
rename CODMOD - FICHA2, lower


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/27 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest
gen aux=uniform()
sort codest aux
bysort codest: gen aux2=_n
keep if aux2==1
drop aux aux2


* GENERATE SCORES
*----------------
gen sp1_readr1=(p1==2)
gen sp2_readr1=(p2==1)
gen sp3_readr1=(p3==1)
gen sp4_readr1=(p4==2)
gen sp5_readr1=(p5==2)
gen sp6_readr1=(p6==1)
gen sp7_readr1=(p7==2)
gen sp8_readr1=(p8==1)
gen sp9_readr1=(p9==2)
gen sp10_readr1=(p10==4)
gen sp11_readr1=(p11==2)
gen sp12_readr1=(p12==3)
gen sp13_readr1=(p13==4)
gen sp14_readr1=(p14==2)
gen sp15_readr1=(p15==3)
gen sp16_readr1=(p16==2)
gen sp17_readr1=(p17==1)
gen sp18_readr1=(p18==3)
gen sp19_readr1=(p19==1)
gen sp20_readr1=(p20==3)
gen sp21_readr1=(p21==1)
gen sp22_readr1=(p22==4)
gen sp23_readr1=(p23==1)
gen sp24_readr1=(p24==4)
gen sp25_readr1=(p25==3)
gen sp26_readr1=(p26==4)
gen sp27_readr1=(p27==2)
egen read_r1=rowtotal(sp1_readr1 - sp27_readr1), missing


* CHECKS
*-------
sum read_r1 sp*
alpha sp*,item


format codest %20.0f
keep codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp27_readr1
order codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp27_readr1
saveold "Intermedias/input_r1_aux5_4s.dta",replace
keep codest codmod grado seccion orden_es  read_r1
saveold "Intermedias/input_r1_aux5_4.dta",replace



****
*	5.5) GENERATE SCORES FOR LECTORA: 6TH GRADE
****
use "Originales\Ronda1\lectora_g6_r1.dta",clear
rename CODMOD - FICHA2, lower


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/25 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest
gen aux=uniform()
sort codest aux
bysort codest: gen aux2=_n
keep if aux2==1
drop aux aux2


* GENERATE SCORES
*----------------
gen sp1_readr1=(p1==2)
gen sp2_readr1=(p2==2)
gen sp3_readr1=(p3==1)
gen sp4_readr1=(p4==2)
gen sp5_readr1=(p5==4)
gen sp6_readr1=(p6==2)
gen sp7_readr1=(p7==3)
gen sp8_readr1=(p8==2)
gen sp9_readr1=(p9==1)
gen sp10_readr1=(p10==3)
gen sp11_readr1=(p11==1)
gen sp12_readr1=(p12==4)
gen sp13_readr1=(p13==1)
gen sp14_readr1=(p14==2)
gen sp15_readr1=(p15==4)
gen sp16_readr1=(p16==2)
gen sp17_readr1=(p17==3)
gen sp18_readr1=(p18==1)
gen sp19_readr1=(p19==4)
gen sp20_readr1=(p20==3)
gen sp21_readr1=(p21==2)
gen sp22_readr1=(p22==3)
gen sp23_readr1=(p23==3)
gen sp24_readr1=(p24==2)
gen sp25_readr1=(p25==2)
egen read_r1=rowtotal(sp1_readr1 - sp25_readr1), missing


* CHECKS
*-------
summ read_r1 sp*
alpha sp*,item


format codest %20.0f
keep codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp25_readr1
order codest codmod grado seccion orden_es  read_r1 sp1_readr1 - sp25_readr1
saveold "Intermedias/input_r1_aux5_5s.dta",replace
keep codest codmod grado seccion orden_es  read_r1
saveold "Intermedias/input_r1_aux5_5.dta",replace




********************************************************************************
*	6) RAVEN: 2ND to 6TH GRADE
********************************************************************************
use "Originales\Ronda1\matrices_g3-6_r1.dta", clear
drop g_serie__b - serieB
rename (serie_a serie__a serie__b serie__c serie__d serie__e serie__f serie__g serie__h serie__i serie__j serie__k serie_ab serie__l serie__m serie__n serie__o serie__p serie__q serie__r serie__s serie__t serie__u serie__v serie_b serie__w serie__x serie__y serie__z serie_aa serie_ac serie_ad serie_ae serie_af serie_ag serie_ah) ///
	   (p1		p2		 p3	  	  p4	   p5		p6		 p7		  p8	   p9		p10      p11      p12      p13      p14      p15      p16	   p17		p18      p19	  p20	   p21  	p22 	 p23	  p24      p25	   p26		p27 	 p28	  p29      p30      p31      p32      p33      p34      p35      p36)

	    /* NOTE: QUESTIONS P1 TO P12 ARE FROM SERIE "A", QUESTIONS 13 TO 24 ARE FROM SERIE "AB", AND QUESTION 15 TO 36 ARE FROM SERIE "B" */


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
gen todrop=1
forv x=1/36 {
replace todrop=0 if p`x'!=-9 & p`x'!=.
}
drop if todrop==1
drop todrop


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE SCORES
*----------------
gen sp1_ravenr1=(p1==4)
gen sp2_ravenr1=(p2==5)
gen sp3_ravenr1=(p3==1)
gen sp4_ravenr1=(p4==2)
gen sp5_ravenr1=(p5==6)
gen sp6_ravenr1=(p6==3)
gen sp7_ravenr1=(p7==6)
gen sp8_ravenr1=(p8==2)
gen sp9_ravenr1=(p9==1)
gen sp10_ravenr1=(p10==3)
gen sp11_ravenr1=(p11==4)
gen sp12_ravenr1=(p12==5)
gen sp13_ravenr1=(p13==4)
gen sp14_ravenr1=(p14==5)
gen sp15_ravenr1=(p15==1)
gen sp16_ravenr1=(p16==6)
gen sp17_ravenr1=(p17==2)
gen sp18_ravenr1=(p18==1)
gen sp19_ravenr1=(p19==3)
gen sp20_ravenr1=(p20==4)
gen sp21_ravenr1=(p21==6)
gen sp22_ravenr1=(p22==3)
gen sp23_ravenr1=(p23==5)
gen sp24_ravenr1=(p24==2)
gen sp25_ravenr1=(p25==2)
gen sp26_ravenr1=(p26==6)
gen sp27_ravenr1=(p27==1)
gen sp28_ravenr1=(p28==2)
gen sp29_ravenr1=(p29==1)
gen sp30_ravenr1=(p30==3)
gen sp31_ravenr1=(p31==5)
gen sp32_ravenr1=(p32==6)
gen sp33_ravenr1=(p33==4)
gen sp34_ravenr1=(p34==3)
gen sp35_ravenr1=(p35==4)
gen sp36_ravenr1=(p36==5)
egen raven_r1=rowtotal (sp1_ravenr1 - sp36_ravenr1), missing


* CHECKS
*-------
sum raven_r1 sp*
alpha sp*,item


format codest %20.0f
keep codest codmod grado seccion orden_es  raven_r1 sp1_ravenr1 - sp36_ravenr1
order codest codmod grado seccion orden_es  raven_r1 sp1_ravenr1 - sp36_ravenr1
saveold "Intermedias/input_r1_aux6s.dta",replace
keep codest codmod grado seccion orden_es  raven_r1
saveold "Intermedias/input_r1_aux6.dta",replace




********************************************************************************
*	12) TEACHER ASSESSMENT: 1ST to 6TH GRADE
********************************************************************************
use "Originales\Ronda1\percepciondocente_g3-6_r1.dta", clear
rename CODMOD - CARACT_C, lower


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
drop if inlist(caract_a, -9,.) & inlist(caract_b, -9,.) & inlist(caract_c, -9,.) 


* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* SKILLS IN MAKING FRIENDS
*-------------------------
gen friendl_r1=caract_a==1 
gen friendm_r1=caract_a==2 
gen friendh_r1=caract_a==3
foreach x in friendl_r1 friendm_r1 friendh_r1 {
replace `x'=. if inlist(caract_a, -9,.)
}

* ACADEMIC EFFORT IN CLASS
*-------------------------
gen effortl_r1=caract_b==1
gen effortm_r1=caract_b==2
gen efforth_r1=caract_b==3
foreach x in effortl_r1 effortm_r1 efforth_r1 {
replace `x'=. if inlist(caract_b, -9,.)
}

* LEVEL OF EDUCATION EXPECTED TO COMPLETE
*----------------------------------------
gen eduexpe_r1=caract_c==1
gen eduexps_r1=caract_c==2
gen eduexpt_r1=caract_c==3
foreach x in eduexpe_r1 eduexps_r1 eduexpt_r1 {
replace `x'=. if inlist(caract_c, -9,.)
}

* CHECKS
*-------
summ friend* effort* eduexp*


format codest %20.0f
keep codest codmod grado seccion orden_es  friendl_r1-eduexpt_r1
order codest codmod grado seccion orden_es  friendl_r1-eduexpt_r1
saveold "Intermedias/input_r1_aux12.dta",replace




********************************************************************************
*	13) STUDENT SURVEY: 3RD to 6TH GRADE
********************************************************************************

****
*	13.1)SOCIO-DEMOGRAPHIC
****
* Information no available in Wave 1



****
*	13.2)COMPUTER ACCESS AND USE
****
use "Originales\Ronda1\cestudiante_g3-6_p2_r1.dta", clear
rename CODMOD - FICHA2, lower


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
drop if inlist(p2,-9,-8,.) & inlist(p3,-9,-8,.) & p5_a1==. & p5_b1==. & p5_a2==. & p5_b2==. & p5_a3==. & p5_b3==. & p5_a4==. & p5_b4==. & p5_a5==. & p5_b5==. ///
	  & inlist(p6_a1,-9,-8,.)  & inlist(p6_a2,-9,-8,.) & inlist(p6_a3,-9,-8,.) & inlist(p6_a4,-9,-8,.) & inlist(p6_a5,-9,-8,.) ///
	  & inlist(p7_a1,-9,-8,.)  & inlist(p7_a2,-9,-8,.) & inlist(p7_a3,-9,-8,.) & inlist(p7_a4,-9,-8,.) & inlist(p8,-9,-8,.)    ///
	  & inlist(p9_a1,-9,-8,.)  & inlist(p9_a2,-9,-8,.) & inlist(p9_a3,-9,-8,.) & inlist(p9_a4,-9,-8,.) & inlist(p9_a5,-9,-8,.) & inlist(p9_a6,-9,-8,.)
	  
	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE INDICATORS
*--------------------
gen pchome_r1=p2==1
gen pcuyest_r1=!inlist(p5_a1,0,.)| !inlist(p5_b1,0,.)| !inlist(p5_a2,0,.)| !inlist(p5_b2,0,.)| !inlist(p5_a3,0,.)| !inlist(p5_b3,0,.)| !inlist(p5_a4,0,.)| !inlist(p5_b4,0,.)| !inlist(p5_a5,0,.)| !inlist(p5_b5,0,.)

forval x=1/5 {
replace p5_a`x'=0 if p5_a`x'==. & p5_b`x'!=.
replace p5_b`x'=0 if p5_b`x'==. & p5_a`x'!=.
}

gen pcuytwsch_r1=p5_a1*60+ p5_b1
gen pcuytwhome_r1=p5_a2*60+ p5_b2 
gen pcuytwcafe_r1=p5_a3*60+ p5_b3   
gen pcuytwfri_r1=p5_a4*60+ p5_b4  
gen pcuytwothr_r1=p5_a5*60+ p5_b5
gen pcuweek_r1=p6_a1==1 | p6_a2==1 | p6_a3==1 | p6_a4==1 | p6_a5==1
gen pcuwsch_r1=p6_a1==1 
gen pcuwhome_r1=p6_a2==1  
gen pcuwcafe_r1=p6_a3==1   
gen pcuwfri_r1=p6_a4==1  
gen pcuwothr_r1=p6_a5==1 
gen pcthwork_r1=p7_a1==1  
gen pctgame_r1=p7_a2==1  
gen pctmusic_r1=p7_a3==1 
gen pctvideo_r1=p7_a4==1 
gen inthome_r1=p3==1
gen intuweek_r1=p8==1
gen inttmail_r1=p9_a1==1  
gen inttchat_r1=p9_a2==1  
gen inttgame_r1=p9_a3==1  
gen inttinfo_r1=p9_a4==1  
gen inttvide_r1=p9_a5==1  
gen inttbook_r1=p9_a6==1 


replace pchome_r1=. 	if inlist(p2, -9,-8,.)
replace inthome_r1=. 	if inlist(p3, -9,-8,.)
replace pcuyest_r1=.    if p5_a1==. & p5_b1==.&p5_a2==. & p5_b2==.&p5_a3==. & p5_b3==.&p5_a4==. & p5_b4==.&p5_a5==. & p5_b5==.
replace pcuweek_r1=. 	if inlist(p6_a1, -9,-8,.) & inlist(p6_a2, -9,-8,.) & inlist(p6_a3, -9,-8,.) & inlist(p6_a4, -9,-8,.) & inlist(p6_a5, -9,-8,.)
replace pcuwsch_r1=. 	if inlist(p6_a1, -9,-8,.) 
replace pcuwhome_r1=. 	if inlist(p6_a2, -9,-8,.)  
replace pcuwcafe_r1=. 	if inlist(p6_a3, -9,-8,.)    
replace pcuwfri_r1=. 	if inlist(p6_a4, -9,-8,.)  
replace pcuwothr_r1=. 	if inlist(p6_a5, -9,-8,.)
replace pcthwork_r1=. 	if inlist(p7_a1, -9,-8,.) 
replace pctgame_r1=. 	if inlist(p7_a2, -9,-8,.) 
replace pctmusic_r1=. 	if inlist(p7_a3, -9,-8,.) 
replace pctvideo_r1=. 	if inlist(p7_a4, -9,-8,.) 
replace intuweek_r1=. 	if inlist(p8, -9,-8,.)
replace inttmail_r1=. 	if inlist(p9_a1, -9,-8,.)
replace inttchat_r1=. 	if inlist(p9_a2, -9,-8,.)  
replace inttgame_r1=. 	if inlist(p9_a3, -9,-8,.)  
replace inttinfo_r1=. 	if inlist(p9_a4, -9,-8,.)  
replace inttvide_r1=. 	if inlist(p9_a5, -9,-8,.)  
replace inttbook_r1=. 	if inlist(p9_a6, -9,-8,.)

foreach x in pcuyest pcuytwsch pcuytwhome pcuytwcafe pcuytwfri pcuytwothr pcuweek pcuwsch pcuwhome pcuwcafe pcuwfri pcuwothr pcthwork pctgame pctmusic pctvideo intuweek inttmail inttchat inttgame inttinfo inttvide inttbook{
	replace `x'_r1=0 if p4==2 
	}
foreach x in inttmail inttchat inttgame inttinfo inttvide inttbook{
	replace `x'_r1=0 if p8==2 
	}

* CHECKS
*-------
sum pchome_r1 - inttbook_r1


format codest %20.0f
keep codest codmod grado seccion orden_es  pchome_r1-inttbook_r1
order codest codmod grado seccion orden_es  pchome_r1-inttbook_r1
saveold "Intermedias/input_r1_aux13_2.dta",replace



****
*	13.3)TIME USE 
****
use "Originales\Ronda1\cestudiante_g3-6_p1_r1.dta", clear
rename CODMOD - DIGITADOR, lower
rename orden_est  orden_es 


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
drop if inlist(p4_a1,-9,-8,.) & inlist(p4_a2,-9,-8,.) & inlist(p4_a3,-9,-8,.) & inlist(p4_a4,-9,-8,.) & inlist(p4_a5,-9,-8,.) & inlist(p4_a6,-9,-8,.) ///
	  & inlist(p4_a7,-9,-8,.) & inlist(p4_a8,-9,-8,.) & inlist(p4_a9,-9,-8,.) & inlist(p4_a10,-9,-8,.) & inlist(p4_a11,-9,-8,.) ///
	  & p6_1_c==. & p6_2_c==. & p6_3_c==. &  p6_4_c==. &  p7_1_c==. &  p7_2_c==. &  p7_3_c==. &  p7_4_c==. &  p8_1_c==. & p8_2_c==. & p8_3_c==. & p8_4_c==.
	  
	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE INDICATORS FOR TIME USE
*---------------------------------
gen uthelpho_r1=p4_a1==1  
gen utcaring_r1=p4_a2==1  
gen utshopp_r1=p4_a3==1  
gen utwstree_r1=p4_a4==1  
gen utwstore_r1=p4_a5==1  
gen uthwork_r1=p4_a6==1  
gen utplay_r1=p4_a7==1  
gen utwattv_r1=p4_a8==1  
gen utpc_r1=p4_a9==1  
gen utread_r1=p4_a10==1  
gen utintcaf_r1=p4_a11==1 

replace uthelpho_r1=. 	if inlist(p4_a1, -9,-8,.)  
replace utcaring_r1=. 	if inlist(p4_a2, -9,-8,.)   
replace utshopp_r1=. 	if inlist(p4_a3, -9,-8,.)   
replace utwstree_r1=. 	if inlist(p4_a4, -9,-8,.)   
replace utwstore_r1=. 	if inlist(p4_a5, -9,-8,.)    
replace uthwork_r1=. 	if inlist(p4_a6, -9,-8,.)   
replace utplay_r1=. 	if inlist(p4_a7, -9,-8,.)   
replace utwattv_r1=. 	if inlist(p4_a8, -9,-8,.)    
replace utpc_r1=. 		if inlist(p4_a9, -9,-8,.)   
replace utread_r1=. 	if inlist(p4_a10, -9,-8,.)    
replace utintcaf_r1=. 	if inlist(p4_a11, -9,-8,.)  


* CHECKS
*-------
sum uthelpho_r1 - utintcaf_r1

format codest %20.0f
keep codest codmod grado seccion orden_es  uthelpho_r1 - utintcaf_r1
order codest codmod grado seccion orden_es  uthelpho_r1 - utintcaf_r1
saveold "Intermedias/input_r1_aux13_3.dta",replace


****
*	13.4)SOCIAL NETWORKS: WEAK FRIENDS
****

use "Intermedias/input_r1_aux4_1.dta",clear
merge 1:1 codest using  "Intermedias/input_r1_aux4_2.dta",nogen update
// no genera la variable _merge y reemplaza los missing del master con valores del using (ocurre con variables del mismo nombre)
merge 1:1 codest using  "Intermedias/input_r1_aux4_3.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux4_4.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux4_5.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_1.dta",nogen
merge 1:1 codest using  "Intermedias/input_r1_aux5_2.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_3.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_4.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_5.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux6.dta",nogen
merge 1:1 codest using  "Intermedias/input_r1_aux12.dta",nogen
merge 1:1 codest using "Intermedias/input_r1_aux13_2.dta",nogen
merge 1:1 codest using "Intermedias/input_r1_aux13_3.dta",nogen
keep if grado>=3 & grado<=6
saveold "Intermedias/input_r1_aux13_4a.dta",replace

use "Originales\Ronda1\cestudiante_g3-6_p1_r1.dta", clear
rename CODMOD - DIGITADOR, lower
rename orden_est  orden_es 


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
drop if inlist(p4_a1,-9,-8,.) & inlist(p4_a2,-9,-8,.) & inlist(p4_a3,-9,-8,.) & inlist(p4_a4,-9,-8,.) & inlist(p4_a5,-9,-8,.) & inlist(p4_a6,-9,-8,.) ///
	  & inlist(p4_a7,-9,-8,.) & inlist(p4_a8,-9,-8,.) & inlist(p4_a9,-9,-8,.) & inlist(p4_a10,-9,-8,.) & inlist(p4_a11,-9,-8,.) ///
	  & p6_1_c==. & p6_2_c==. & p6_3_c==. &  p6_4_c==. &  p7_1_c==. &  p7_2_c==. &  p7_3_c==. &  p7_4_c==. &  p8_1_c==. & p8_2_c==. & p8_3_c==. & p8_4_c==.
	  
	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


*-----------------------------------------------------------------------------------------------------------------------
* GENERATE NUMBER OF ONE-WAY/WEAK FRIENDS (BEST, HOMEWORK, VISIT HOME)= NUMBER OF KIDS WHO REPORT AN STUDENT AS A FRIEND
*----------------------------------------------------------------------------------------------------------------------- 
merge 1:1 codest using "Intermedias/input_r1_aux13_4a.dta", nogenerate
merge 1:1 codest using "Auxiliares\listas_final.dta", keep(match) nogenerate
sort codest orden_es
gen temp=1
rename (p6_1_c 	  p6_2_c 	p6_3_c 	  p6_4_c 	p7_1_c    p7_2_c 	p7_3_c    p7_4_c 	p8_1_c    p8_2_c 	p8_3_c    p8_4_c) ///
	   (p6_fcode1 p6_fcode2 p6_fcode3 p6_fcode4 p7_fcode1 p7_fcode2 p7_fcode3 p7_fcode4 p8_fcode1 p8_fcode2 p8_fcode3 p8_fcode4) 
qui summ orden_es
qui local j=r(max)

 quietly forv k=6/8 {																	/*P6 TO P8 ARE THE QUESTION FOR BEST/HOMEWORK/VISIT FRIENDS*/

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



egen wfrndbest_r1=rowtotal(p6_fcode13* p6_fcode23* p6_fcode33* p6_fcode43*), missing
egen wfrndwork_r1=rowtotal(p7_fcode13* p7_fcode23* p7_fcode33* p7_fcode43*), missing
egen wfrndvist_r1=rowtotal(p8_fcode13* p8_fcode23* p8_fcode33* p8_fcode43*), missing

egen wfrndbestplott_r1=rowtotal(plottp6_fcode13* plottp6_fcode23* plottp6_fcode33* plottp6_fcode43*), missing
egen wfrndworkplott_r1=rowtotal(plottp7_fcode13* plottp7_fcode23* plottp7_fcode33* plottp7_fcode43*), missing
egen wfrndvistplott_r1=rowtotal(plottp8_fcode13* plottp8_fcode23* plottp8_fcode33* plottp8_fcode43*), missing

egen wfrndbestwlott_r1=rowtotal(wlottp6_fcode13* wlottp6_fcode23* wlottp6_fcode33* wlottp6_fcode43*), missing
egen wfrndworkwlott_r1=rowtotal(wlottp7_fcode13* wlottp7_fcode23* wlottp7_fcode33* wlottp7_fcode43*), missing
egen wfrndvistwlott_r1=rowtotal(wlottp8_fcode13* wlottp8_fcode23* wlottp8_fcode33* wlottp8_fcode43*), missing

drop  p6_fcode13* p6_fcode23* p6_fcode33* p6_fcode43* p7_fcode13* p7_fcode23* p7_fcode33* p7_fcode43* p8_fcode13* p8_fcode23* p8_fcode33* p8_fcode43* plott* wlott*


*-----------------------------------------------
* GENERATE NUMBER OF ONE-WAY/WEAK TOTAL CONTACTS
*-----------------------------------------------
forv k=7/8 {																	/* SET TO MISSING P6_FCODE IF THE SAME STUDENT WAS REPORTED AS A FRIEND IN P7_FCODE OR P8_FCODE*/
	forv j=1/4 {
		forv i=1/4 {
			replace  p6_fcode`j'=. if  p6_fcode`j'== p`k'_fcode`i'
			}
		}
	}

forv j=1/4 {																	/* SET TO MISSING P7_FCODE IF THE SAME STUDENT WAS REPORTED AS A FRIEND IN P8_FCODE*/
	forv i=1/4 {
		replace  p7_fcode`j'=. if  p7_fcode`j'== p8_fcode`i'
		}
	}



qui summ orden_es
qui local j=r(max)

qui forv k=6/8 {																	/*P6 TO P8 ARE THE QUESTION FOR BEST/HOMEWORK/VISIT FRIENDS*/

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

egen wfrndtot_r1=rowtotal(p6_fcode13* p6_fcode23* p6_fcode33* p6_fcode43* p7_fcode13* p7_fcode23* p7_fcode33* p7_fcode43* p8_fcode13* p8_fcode23* p8_fcode33* p8_fcode43*), missing
egen wfrndtotplott_r1=rowtotal(plottp6_fcode13* plottp6_fcode23* plottp6_fcode33* plottp6_fcode43* plottp7_fcode13* plottp7_fcode23* plottp7_fcode33* plottp7_fcode43* plottp8_fcode13* plottp8_fcode23* plottp8_fcode33* plottp8_fcode43*), missing
egen wfrndtotwlott_r1=rowtotal(wlottp6_fcode13* wlottp6_fcode23* wlottp6_fcode33* wlottp6_fcode43* wlottp7_fcode13* wlottp7_fcode23* wlottp7_fcode33* wlottp7_fcode43* wlottp8_fcode13* wlottp8_fcode23* wlottp8_fcode33* wlottp8_fcode43*), missing

drop temp p6_fcode13* p6_fcode23* p6_fcode33* p6_fcode43* p7_fcode13* p7_fcode23* p7_fcode33* p7_fcode43* p8_fcode13* p8_fcode23* p8_fcode33* p8_fcode43* plott* wlott*


* CHECKS
*-------
sum wfrndbest_r1 wfrndwork_r1 wfrndvist_r1 wfrndtot_r1 wfrndbestplott_r1 wfrndworkplott_r1 wfrndvistplott_r1 wfrndtotplott_r1 wfrndbestwlott_r1 wfrndworkwlott_r1 wfrndvistwlott_r1 wfrndtotwlott_r1


format codest %20.0f
keep codest codmod grado seccion orden_es  wfrndbest_r1 wfrndwork_r1 wfrndvist_r1 wfrndtot_r1 wfrndbestplott_r1 wfrndworkplott_r1 wfrndvistplott_r1 wfrndtotplott_r1 wfrndbestwlott_r1 wfrndworkwlott_r1 wfrndvistwlott_r1 wfrndtotwlott_r1
order codest codmod grado seccion orden_es  wfrndbest_r1 wfrndwork_r1 wfrndvist_r1 wfrndtot_r1 wfrndbestplott_r1 wfrndworkplott_r1 wfrndvistplott_r1 wfrndtotplott_r1 wfrndbestwlott_r1 wfrndworkwlott_r1 wfrndvistwlott_r1 wfrndtotwlott_r1
saveold "Intermedias/input_r1_aux13_4.dta",replace

 

****
*	13.5)SOCIAL NETWORKS: STRONG FRIENDS
****
use "Originales\Ronda1\cestudiante_g3-6_p1_r1.dta", clear
rename CODMOD - DIGITADOR, lower
rename orden_est  orden_es 


* DROP OBSERVATIONS WITH MISSING IN ALL THE RELEVANT QUESTIONS
*-------------------------------------------------------------
drop if inlist(p4_a1,-9,-8,.) & inlist(p4_a2,-9,-8,.) & inlist(p4_a3,-9,-8,.) & inlist(p4_a4,-9,-8,.) & inlist(p4_a5,-9,-8,.) & inlist(p4_a6,-9,-8,.) ///
	  & inlist(p4_a7,-9,-8,.) & inlist(p4_a8,-9,-8,.) & inlist(p4_a9,-9,-8,.) & inlist(p4_a10,-9,-8,.) & inlist(p4_a11,-9,-8,.) ///
	  & p6_1_c==. & p6_2_c==. & p6_3_c==. &  p6_4_c==. &  p7_1_c==. &  p7_2_c==. &  p7_3_c==. &  p7_4_c==. &  p8_1_c==. & p8_2_c==. & p8_3_c==. & p8_4_c==.
	  
	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest



*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* GENERATE NUMBER OF RECIPROCAL/STRONG FRIENDS (BEST, HOMEWORK, VISIT HOME)= NUMBER OF KIDS WHO REPORT AN STUDENT AS A FRIEND AND THAT STUDENT REPORT THEM AS A FRIEND TOO. 
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
merge 1:1 codest using "Auxiliares\listas_final.dta", keep(match) nogenerate
sort codest orden_es
qui summ orden_es
qui local j=r(max)																															/*PROVIDES THE GREATEST NUMBER FOR THE VARIABLE ORDEN_ES (THE ORDER OF THE KID IN A SECTION)*/
qui local x=`j'-1
rename (p6_1_c 	  p6_2_c 	p6_3_c 	  p6_4_c 	p7_1_c    p7_2_c 	p7_3_c    p7_4_c 	p8_1_c    p8_2_c 	p8_3_c    p8_4_c) ///
	   (p6_fcode1 p6_fcode2 p6_fcode3 p6_fcode4 p7_fcode1 p7_fcode2 p7_fcode3 p7_fcode4 p8_fcode1 p8_fcode2 p8_fcode3 p8_fcode4) 

	   
* BEST FRIENDS
*-------------
forv k=1/`j'{

	forv i=1/`j' {
	qui bysort codmod grado seccion: gen v`k'_`i'=(p6_fcode1==`k' | p6_fcode2==`k'  | p6_fcode3==`k'  | p6_fcode4==`k') if orden_es==`i'	/*GENERATE A DUMMY THAT IS EQUAL TO 1 IF STUDENT "i" REPORTS STUDENT "k" AS A FRIEND*/	
	qui egen t`k'_`i'=mean(v`k'_`i'), by ( codmod grado seccion)																			/*GENERATE A VARIABLE WITH THE SAME VALUE OF THE DUMMY CREATED IN THE PREVIOUS STEP FOR EACH SECTION*/
	qui drop v`k'_`i'
	}
	
}


forv k=1/`j'{

local z=`k'+1

	forv i=`z'/`j' {
	qui gen f`k'_`i'=(t`k'_`i'==1& t`i'_`k'==1) if orden_es==`i' | orden_es==`k'						/*GENERATE A DUMMY THAT IS EQUAL TO 1 IF STUDENT "i" REPORTS STUDENT "k" AS A FRIEND AND STUDENT "k" REPORTS STUDENT "i" AS A FRIEND*/
	qui replace f`k'_`i'=0 if f`k'_`i'==.								
	}
	
}
drop t*
egen rfrndbest_r1=rowtotal( f1_2 -f`x'_`j'), missing													/*GENERATE THE NUMBER OF RECIPROCAL BEST FRIENDS*/
drop f1_2 -f`x'_`j'



* HOMEWORK FRIENDS
*-----------------
forv k=1/`j'{

	forv i=1/`j' {
	qui bysort codmod grado seccion: gen v`k'_`i'=(p7_fcode1==`k' | p7_fcode2==`k'  | p7_fcode3==`k'  | p7_fcode4==`k') if orden_es==`i'
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
egen rfrndwork_r1=rowtotal(f1_2 -f`x'_`j'), missing
drop f1_2 -f`x'_`j'



* VISIT HOME FRIENDS
*-------------------
forv k=1/`j'{

	forv i=1/`j' {
	qui bysort codmod grado seccion: gen v`k'_`i'=(p8_fcode1==`k' | p8_fcode2==`k'  | p8_fcode3==`k'  | p8_fcode4==`k') if orden_es==`i'
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
egen rfrndvist_r1=rowtotal(f1_2 -f`x'_`j'), missing
drop f1_2 -f`x'_`j'
egen rfrndtot_r1=rowtotal(rfrndbest_r1 rfrndwork_r1 rfrndvist_r1)


* CHECKS
*-------
summ rfrndbest_r1 rfrndwork_r1 rfrndvist_r1 rfrndtot_r1


format codest %20.0f
keep codest codmod grado seccion orden_es  rfrndbest_r1 rfrndwork_r1 rfrndvist_r1 rfrndtot_r1
order codest codmod grado seccion orden_es  rfrndbest_r1 rfrndwork_r1 rfrndvist_r1 rfrndtot_r1
saveold "Intermedias/input_r1_aux13_5.dta",replace



****
*	13.6)SKILLS: OBJECTIVE PC AND INTERNET TEST, AND SELF-REPORTED PC AND INTERNET SKILLS
****
use "Originales\Ronda1\cestudiante_g3-6_p2_r1.dta", clear
rename CODMOD - FICHA2, lower


* KEEP OBSERVATIONS THAT ANSWERED WHETHER THEY HAVE PC OR LAPTOP AT HOME (P4)
*----------------------------------------------------------------------------
keep if p4==1 | p4==2

	  
* DROP DUPLICATES (IF ANY)
*-------------------------
duplicates list codest


* GENERATE SCORES: OBJECTIVE PC AND INTERNET TEST
*----------------
gen dttypew_r1=p11_a==3 
gen dtmouse_r1=p11_b==1 
gen dtshift_r1=p11_c==1 
gen dtnews_r1=p11_d==2 
gen dtemail_r1=p11_e==3
egen pcotskill_r1=rowtotal(dttypew_r1-dtemail_r1), missing


* GENERATE SCORES: SELF-REPORTED PC AND INTERNET SKILLS
*----------------
gen dttopc_r1=p12_a1==1 
gen dtcfold_r1=p12_a2==1 
gen dtdelef_r1=p12_a3==1 
gen dtcopyf_r1=p12_a4==1 
gen dtopweb_r1=p12_a5==1
gen dtyahgog_r1=p12_a6==1 
gen dtsemail_r1=p12_a7==1 
gen dtattaf_r1=p12_a8==1
egen pcsrskill_r1=rowtotal(dttopc_r1-dtattaf_r1), missing


* CHECKS
*-------
sum pcotskill pcsrskill dt*
alpha dt*,item																		/* 	ALPHAs LESS THAN 0.4*/


format codest %20.0f
keep codest codmod grado seccion orden_es  pcotskill_r1 pcsrskill_r1 dttypew_r1-dtemail_r1 dttopc_r1-dtattaf_r1
order codest codmod grado seccion orden_es  pcotskill_r1 pcsrskill_r1 dttypew_r1-dtemail_r1 dttopc_r1-dtattaf_r1
saveold "Intermedias/input_r1_aux13_6s.dta",replace
keep codest codmod grado seccion orden_es  pcotskill_r1 pcsrskill_r1 
saveold "Intermedias/input_r1_aux13_6.dta",replace



********************************************************************************
*	19) MERGING DATASETS FOR WAVE 1
********************************************************************************

use "Intermedias/input_r1_aux4_1.dta",clear
merge 1:1 codest using  "Intermedias/input_r1_aux4_2.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux4_3.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux4_4.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux4_5.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_1.dta",nogen
merge 1:1 codest using  "Intermedias/input_r1_aux5_2.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_3.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_4.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux5_5.dta",nogen update
merge 1:1 codest using  "Intermedias/input_r1_aux6.dta",nogen
merge 1:1 codest using  "Intermedias/input_r1_aux12.dta",nogen
merge 1:1 codest using "Intermedias/input_r1_aux13_2.dta",nogen
merge 1:1 codest using "Intermedias/input_r1_aux13_3.dta",nogen
merge 1:1 codest using "Intermedias/input_r1_aux13_4.dta",nogen
merge 1:1 codest using "Intermedias/input_r1_aux13_5.dta",nogen
merge 1:1 codest using "Intermedias/input_r1_aux13_6.dta",nogen
rename (grado seccion) (grado_r1 seccion_r1)
saveold "Intermedias/input_r1.dta",replace 

cd "C:\Users\Roberto Carlos\Desktop\Ciclo-2020-2\Econometria_aplicada\Control_Trails\data\Intermedias"	
!erase input_r1_*.dta
clear all
