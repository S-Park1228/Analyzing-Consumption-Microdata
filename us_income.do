clear all
cd D:\Data\us_consumption\major

********************************************************************************
*****************  Sorting households by their income quintile  *****************
********************************************************************************



* Expenditure occurred in the current quarter

* 2006~2008
forvalues i=6/8 {

* Total households
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'1x, replace
gen year = 200`i'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'1x, replace
gen year = 200`i'
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'1x, replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'1x, replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'1x, replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'1x, replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_200`i'q1, replace

forvalues j=2/4 {

* Total households
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_200`i'q`j', replace

}

}



********************************************************************************



* I wrote the separate codes for 2010 apart from 2006~2009.
* Total households
use D:\Data\us_consumption\intrvw09\fmli091x, replace
gen year = 2009
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw09\fmli091x, replace
gen year = 2009
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw09\fmli091x, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw09\fmli091x, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw09\fmli091x, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw09\fmli091x, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_2009q1, replace

forvalues j=2/4 {

* Total households
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_2009q`j', replace

}



********************************************************************************



* I wrote the separate codes for 2013 due to the change in after-tax income in 2013 Q1.
* Total households
use D:\Data\us_consumption\intrvw13\fmli131x, replace
gen year = 2013
gen quarter = "q1x"
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw13\fmli131x, replace
gen year = 2013
gen quarter = "q1x"
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw13\fmli131x, replace
gen year = 2013
gen quarter = "q1x"
gen part = "current"
keep if inc_rank > 0.1 & inc_rank <= 0.2
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw13\fmli131x, replace
gen year = 2013
gen quarter = "q1x"
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.3
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw13\fmli131x, replace
gen year = 2013
gen quarter = "q1x"
gen part = "current"
keep if inc_rank > 0.3 & inc_rank <= 0.4
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw13\fmli131x, replace
gen year = 2013
gen quarter = "q1x"
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.5
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_2013q1, replace

forvalues j=2/4 {

* Total households
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "current"
keep if inc_rank > 0.1 & inc_rank <= 0.2
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.3
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "current"
keep if inc_rank > 0.3 & inc_rank <= 0.4
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.5
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_2013q`j', replace

}



********************************************************************************



* 2010~2012, 2014~2018
foreach i in 10 11 12 14 15 16 17 18 {

* Total households
use D:\Data\us_consumption\intrvw`i'\fmli`i'1x, replace
gen year = 20`i'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'1x, replace
gen year = 20`i'
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'1x, replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.1 & inc_rank <= 0.2
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'1x, replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.3
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'1x, replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.3 & inc_rank <= 0.4
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'1x, replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.5
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_20`i'q1, replace

forvalues j=2/4 {

* Total households
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.1 & inc_rank <= 0.2
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.3
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.3 & inc_rank <= 0.4
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.5
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjcurclass_20`i'q`j', replace

}

}



********************************************************************************
********************************************************************************
********************************************************************************



* Expenditure occurred in the previous quarter

* 2006~2008
forvalues i=6/8 {

forvalues j=2/4 {

local k=`j'-1
* Total households
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`i'`j', replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_200`i'q`k', replace

}

local x=`i'+1
* Total households
use D:\Data\us_consumption\intrvw0`i'\fmli0`x'1, replace
gen year = 200`i'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`x'1, replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`x'1, replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`x'1, replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`x'1, replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw0`i'\fmli0`x'1, replace
gen year = 200`i'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_200`i'q4, replace

}



********************************************************************************



* I wrote the separate codes for 2010 apart from 2006~2009.
forvalues j=2/4 {

local k=`j'-1
* Total households
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw09\fmli09`j', replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_2009q`k', replace

}

* Total households
use D:\Data\us_consumption\intrvw09\fmli101, replace
gen year = 2009
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw09\fmli101, replace
gen year = 2009
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw09\fmli101, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw09\fmli101, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw09\fmli101, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw09\fmli101, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_2009q4, replace



********************************************************************************



* I wrote the separate codes for 2013 due to the change in after-tax income in 2013 Q1.

forvalues j=2/4 {

local k=`j'-1
* Total households
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "previous"
keep if inc_rank > 0.1 & inc_rank <= 0.2
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.3
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "previous"
keep if inc_rank > 0.3 & inc_rank <= 0.4
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw13\fmli13`j', replace
gen year = 2013
gen quarter = "q`j'"
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.5
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_2013q`k', replace

}

* Total households
use D:\Data\us_consumption\intrvw13\fmli141, replace
gen year = 2013
gen quarter = "q1"
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw13\fmli141, replace
gen year = 2013
gen quarter = "q1"
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw13\fmli141, replace
gen year = 2013
gen quarter = "q1"
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw13\fmli141, replace
gen year = 2013
gen quarter = "q1"
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw13\fmli141, replace
gen year = 2013
gen quarter = "q1"
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw13\fmli141, replace
gen year = 2013
gen quarter = "q1"
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_2013q4, replace



********************************************************************************



* 2010~2012, 2014~2018
foreach i in 10 11 12 14 15 16 17 18 {

forvalues j=2/4 {

local k=`j'-1
* Total households
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.1 & inc_rank <= 0.2
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.3
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.3 & inc_rank <= 0.4
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`i'`j', replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.5
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_20`i'q`k', replace

}

local x=`i'+1
* Total households
use D:\Data\us_consumption\intrvw`i'\fmli`x'1, replace
gen year = 20`i'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use D:\Data\us_consumption\intrvw`i'\fmli`x'1, replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`x'1, replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use D:\Data\us_consumption\intrvw`i'\fmli`x'1, replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`x'1, replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use D:\Data\us_consumption\intrvw`i'\fmli`x'1, replace
gen year = 20`i'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

save us_mjpreclass_20`i'q4, replace

}
