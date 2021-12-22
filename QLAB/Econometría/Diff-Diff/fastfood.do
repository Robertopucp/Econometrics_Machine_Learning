
clear all


 use "C:\Users\Roberto Carlos\Desktop\Ciclo-2020-2\Econometria_aplicada\Diff-Diff\fastfood.dta", clear
 
 rename empft fte
 rename empft2 fte2
 rename sheet store_id 
 
  label var fte "Full-time-equivalent pre"
  label var fte2 "Full-time-equivalent post"
  label var wage_st "Starting Wage pre"
  label var wage_st2 "Starting Wage post" 
  
  gen wage_st_Pa=wage_st if state==0 
  label var wage_st_Pa "Starting wage pre" 
  gen wage_st_Nj=wage_st if state==1 
  label var wage_st_Nj "Starting wage pre" 
  gen wage_st2_Pa=wage_st2 if state==0 
  label var wage_st2_Pa "Starting wage post" 
  gen wage_st2_Nj=wage_st2 if state==1 
  label var wage_st2_Nj "Starting wage post" 
  label var state " 1 if NJ; 0 if PA"
  label var co_owned "1 if company owned"
  label define chain_label 1 "Burger King"  2 "KFC"  3 "Roy Rogers" 4 "Wendys"
  label values chain chain_label
  tab chain 
  order store_id chain co_owned fte fte2 wage_st wage_st2
 

 // Histograms
 
  histogram wage_st_Pa, bin(40) percent fcolor(yellow) legend(label (1 "Pennsylvania")) addplot(histogram wage_st_Nj, bin(40) percent fcolor(green) ///
  legend(label (2 "New Jersey"))) saving(hist1, replace)
  
 histogram wage_st2_Pa, bin(40) percent fcolor(yellow) legend(label (1 "Pennsylvania")) addplot(histogram wage_st2_Nj, bin(40) percent fcolor(green) ///
 legend(label (2 "New Jersey"))) saving(hist2, replace)

graph combine hist1.gph hist2.gph, xcommon
  
 
 
 // Average Employment NJ pre 
 egen fteNJ=mean(fte) if state==1 & fte!=. & fte2!=.
 // Average Employment NJ post
 egen fteNJ2=mean(fte2) if state==1  & fte!=. & fte2!=.
 // Average Employment PA pre 
 egen ftePA=mean(fte) if state==0  & fte!=. & fte2!=.
 // Average Employment PA post 
 egen ftePA2=mean(fte2) if state==0  & fte!=. & fte2!=.
 // NJ post - NJ pre 
 gen dfteNJ=fteNJ2-fteNJ
 // PA post - PA pre 
 gen dftePA=ftePA2-ftePA
 
  br store state dfteNJ dftePA
 // replicating the value in all the observations
 egen dfte_NJ=max(dfteNJ)
 egen dfte_PA=max(dftePA)
 
 // (NJ post - NJ pre)  - (PA post - PA pre) 
 gen DID=dfte_NJ- dfte_PA
 sum dfte_NJ dfte_PA DID
 

 // Regression Estimation
 
 gen cfte=fte2-fte
 reg cfte state 
 est store reg1
 // Controlling for chain and onwership  
  reg cfte state co_owned i.chain 
  est store reg2
  
  esttab reg1 reg2, se title("Replication of Card-Krueger Paper") 

  // Intensity of treatment 
   gen gap=0
   replace gap=(5.05-wage_st_Nj)/wage_st_Nj 
   sum gap if state==1
   
    reg cfte gap  
	est store reg3

	reg cfte gap co_owned i.chain 
    est store reg4
    
	esttab reg3 reg4, se

	
	