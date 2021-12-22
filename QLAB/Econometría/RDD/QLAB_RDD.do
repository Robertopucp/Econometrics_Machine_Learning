***** QLAB -RDD Class***
clear 
set more off
set linesize 80
mata: mata mlib index
chdir "/Users/pavelcoronadocastellanos/Desktop/maryland/spring2021/Econometriaplicadaavanzada/RDD/"
* chdir "/Folder/"
use rdrobust_senate.dta

********************************************************************************
** Summary Statistics
********************************************************************************
use rdrobust_senate.dta, clear
sum vote margin class termshouse termssenate population, sep(2)
sum vote margin class termshouse termssenate population, sep(2)

**************************************************************************
** rdplot with MSE-optimal choice
**************************************************************************
set more off
rdplot vote margin
set more off
rdplot vote margin, binselect(es) ///
       graph_options(title(RD Plot - Senate Elections Data) ///
                           ytitle(Vote Share in Election at time t+1) ///
                           xtitle(Vote Share in Election at time t))

**************************************************************************
** rdrobust
**************************************************************************
rdrobust vote margin

**************************************************************************
** rdrobust with all estimates
**************************************************************************
rdrobust vote margin, all

**************************************************************************
** rdbwselect with all estimates
**************************************************************************
rdbwselect vote margin, all
					 
********************************************************************************
** rdrobust backward compatibility
********************************************************************************
rdrobust vote margin, h(16.79369) b(27.43745)


********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************

clear
chdir "/Users/pavelcoronadocastellanos/Desktop/maryland/spring2021/Econometriaplicadaavanzada/RDD/"
use wisc74.dta
*Cutoff on Log Scale
di log(5000)

* RDD Plot
set more off
rdplot turnout lpop, c(8.52)

* Global Test
gen T=1 if lpop<=8.52
replace T=0 if lpop>8.52
ttest turnout, by(T)

*Global Linear Fit
reg turnout treat score c.score#treat

* Local Quadratic
gen score_sqd = score^2
reg turnout treat score score_sqd c.score#treat c.score_sqd#treat
	   
* Local RDD Estimate with Robust CIs
set more off

rdrobust turnout lpop, c(8.52)

rdbwselect  turnout lpop, c(8.52)
rdrobust turnout lpop, c(8.52) h(1.088)


********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************




