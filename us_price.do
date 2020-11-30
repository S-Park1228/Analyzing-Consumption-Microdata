clear all
cd D:\Data\us_consumption\price

* This do-file is to calculate the average purchase price for each item.
* You can modify uccs of items included in "foreach command" to the desired number.
* You can customize the name, wd, to what you want.
* In cases of durable goods, the prices may not be the purchase prices. Because there is a chance of installment purchases. If that is the case, the values are not the average purchase prices but the average expenses.
* The raw data are categorized into 5 (quarter 1x, quarter 2, quarter 3, quarter 4, quarter 5).
* To calculate the expenses of the 1st quarter household groups, the households' current weights in quarter 1x and the households' prveious weights in quarter 1 are used.
* When it comes to the 2nd, the 3rd and the 4th quarter, the households' current wieghts and previous weights are the same.
* The process takes 2.5 hrs in case of washing machine and dryer.

********************************************************************************
** Organizing the quarterly average purchase prices and # of households with purchases for the item of choice
********************************************************************************

forvalues j=6/8 {

use D:\Data\us_consumption\intrvw0`j'\fmli0`j'1x, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_200`j'q1x
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter = "1x"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter = "1x"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter = "1x"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter = "1x"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter = "1x"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter = "1x"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

gen dum_2=0
replace etotalc=0 if etotalc==.
replace dum_2=1 if etotalc>0

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
by inc_quantile age nfamily: egen sumweight_cur=sum(finlwt21*dum_2)
gen portion_current=sumweight_cur/sumweight

drop dum_2 sumweight sumweight_cur

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'_cur>0
replace dum_`i'=0 if var_`i'_cur==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'_cur*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur dum_* weight*

gen qyear="200`j'q1x"

save us_wd_tem_200`j'q1x, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'2, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_200`j'q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="2"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="2"
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="200`j'q2"

save us_wd_tem_200`j'q2, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'3, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_200`j'q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="3"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="200`j'q3"

save us_wd_tem_200`j'q3, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'4, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_200`j'q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="4"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="200`j'q4"

save us_wd_tem_200`j'q4, replace



local k=`j'+1
use D:\Data\us_consumption\intrvw0`j'\fmli0`k'1, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_200`k'q1
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="1"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

gen dum_2=0
replace etotalp=0 if etotalp==.
replace dum_2=1 if etotalp>0

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
by inc_quantile age nfamily: egen sumweight_pre=sum(finlwt21*dum_2)
gen portion_previous=sumweight_pre/sumweight

drop dum_2 sumweight sumweight_pre

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'_pre>0
replace dum_`i'=0 if var_`i'_pre==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'_pre*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_pre dum_* weight*

gen qyear="200`k'q1"

save us_wd_tem_200`k'q1, replace

}



********************************************************************************



use D:\Data\us_consumption\intrvw09\fmli091x, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_2009q1x
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="1x"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

gen dum_2=0
replace etotalc=0 if etotalc==.
replace dum_2=1 if etotalc>0

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
by inc_quantile age nfamily: egen sumweight_cur=sum(finlwt21*dum_2)
gen portion_current=sumweight_cur/sumweight

drop dum_2 sumweight sumweight_cur

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'_cur>0
replace dum_`i'=0 if var_`i'_cur==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'_cur*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur dum_* weight*

gen qyear="200`j'q1x"

save us_wd_tem_2009q1x, replace



use D:\Data\us_consumption\intrvw09\fmli092, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_2009q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="2"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="2009q2"

save us_wd_tem_2009q2, replace



use D:\Data\us_consumption\intrvw09\fmli093, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_2009q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="3"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="2009q3"

save us_wd_tem_2009q3, replace



use D:\Data\us_consumption\intrvw09\fmli094, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_2009q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="4"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="2009q4"

save us_wd_tem_2009q4, replace



use D:\Data\us_consumption\intrvw09\fmli101, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_2010q1
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="1"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

gen dum_2=0
replace etotalp=0 if etotalp==.
replace dum_2=1 if etotalp>0

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
by inc_quantile age nfamily: egen sumweight_pre=sum(finlwt21*dum_2)
gen portion_previous=sumweight_pre/sumweight

drop dum_2 sumweight sumweight_pre

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'_pre>0
replace dum_`i'=0 if var_`i'_pre==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'_pre*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_pre dum_* weight*

gen qyear="2010q1"

save us_wd_tem_2010q1, replace



********************************************************************************



forvalues j=10/18 {

use D:\Data\us_consumption\intrvw`j'\fmli`j'1x, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_20`j'q1x
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="1x"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="1x"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

gen dum_2=0
replace etotalc=0 if etotalc==.
replace dum_2=1 if etotalc>0

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
by inc_quantile age nfamily: egen sumweight_cur=sum(finlwt21*dum_2)
gen portion_current=sumweight_cur/sumweight

drop dum_2 sumweight sumweight_cur

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'_cur>0
replace dum_`i'=0 if var_`i'_cur==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'_cur*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur dum_* weight*

gen qyear="20`j'q1x"

save us_wd_tem_20`j'q1x, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'2, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_20`j'q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="2"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="2"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="20`j'q2"

save us_wd_tem_20`j'q2, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'3, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_20`j'q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="3"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="3"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="20`j'q3"

save us_wd_tem_20`j'q3, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'4, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_20`j'q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="4"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="4"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen var_`i'=var_`i'_cur+var_`i'_pre
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'>0
replace dum_`i'=0 if var_`i'==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_cur *_pre dum_* weight*

gen qyear="20`j'q4"

save us_wd_tem_20`j'q4, replace



local k=`j'+1
use D:\Data\us_consumption\intrvw`j'\fmli`k'1, replace

* Example: washing machine and dryer
foreach i in 300211 300212 300221 300222 300216 300217 {
 
 merge m:m newid using D:\Data\us_consumption\mtbi\us_`i'_20`k'q1
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre etotalc etotalp

save us_wd_tem, replace

* Total household
use us_wd_tem, replace
gen quarter="1"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_wd_tem, replace
gen quarter="1"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_price.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

gen dum_2=0
replace etotalp=0 if etotalp==.
replace dum_2=1 if etotalp>0

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
by inc_quantile age nfamily: egen sumweight_pre=sum(finlwt21*dum_2)
gen portion_previous=sumweight_pre/sumweight

drop dum_2 sumweight sumweight_pre

foreach i in 300211 300212 300221 300222 300216 300217 {
 
gen dum_`i'=0
replace dum_`i'=1 if var_`i'_pre>0
replace dum_`i'=0 if var_`i'_pre==.

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen numhousehold_`i'=sum(finlwt21*dum_`i')
gen weight_`i'=finlwt21/numhousehold_`i'

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen avg_var_`i'=sum(var_`i'_pre*dum_`i'*weight_`i')

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

drop newid fam_size finlwt21 etotal* quarter *_pre dum_* weight*

gen qyear="20`k'q1"

save us_wd_tem_20`k'q1, replace

}



********************************************************************************
** Organizing the quarterly average purchase prices and # of households with purchases for the item of choice
********************************************************************************

* Sum up quarterly values for each year
forvalues j=6/8 {

local k=`j'+1
use us_wd_tem_200`j'q1x, replace
append using us_wd_tem_200`j'q2
append using us_wd_tem_200`j'q3
append using us_wd_tem_200`j'q4
append using us_wd_tem_200`k'q1

gen portion=1
replace portion=portion_current if qyear=="200`j'q1x"
replace portion=portion_previous if qyear=="200`k'q1"

collapse (mean) numhousehold_* avg_var_* [weight=portion], by(inc_quantile age nfamily)

* Calculate market share
foreach i in 300211 300212 300221 300222 300216 300217 {

gen marketsize_`i'=numhousehold_`i'*avg_var_`i'
replace marketsize=0 if marketsize==.
sort marketsize_`i'
gen ms_`i'=marketsize_`i'/marketsize_`i'[_N]*100

drop marketsize_`i'

}

gen year=200`j'
move year inc_quantile

sort inc_quantile age nfamily

save us_wd_200`j', replace

}



use us_wd_tem_2009q1x, replace
append using us_wd_tem_2009q2
append using us_wd_tem_2009q3
append using us_wd_tem_2009q4
append using us_wd_tem_2010q1

gen portion=1
replace portion=portion_current if qyear=="2009q1x"
replace portion=portion_previous if qyear=="2010q1"

collapse (mean) numhousehold_* avg_var_* [weight=portion], by(inc_quantile age nfamily)

foreach i in 300211 300212 300221 300222 300216 300217 {

gen marketsize_`i'=numhousehold_`i'*avg_var_`i'
replace marketsize=0 if marketsize==.
sort marketsize_`i'
gen ms_`i'=marketsize_`i'/marketsize_`i'[_N]*100

drop marketsize_`i'

}

gen year=2009
move year inc_quantile

sort inc_quantile age nfamily

save us_wd_2009, replace



forvalues j=10/18 {

local k=`j'+1
use us_wd_tem_20`j'q1x, replace
append using us_wd_tem_20`j'q2
append using us_wd_tem_20`j'q3
append using us_wd_tem_20`j'q4
append using us_wd_tem_20`k'q1

gen portion=1
replace portion=portion_current if qyear=="20`j'q1x"
replace portion=portion_previous if qyear=="20`k'q1"

collapse (mean) numhousehold_* avg_var_* [weight=portion], by(inc_quantile age nfamily)

foreach i in 300211 300212 300221 300222 300216 300217 {

gen marketsize_`i'=numhousehold_`i'*avg_var_`i'
replace marketsize=0 if marketsize==.
sort marketsize_`i'
gen ms_`i'=marketsize_`i'/marketsize_`i'[_N]*100

drop marketsize_`i'

}

gen year=20`j'
move year inc_quantile

sort inc_quantile age nfamily

save us_wd_20`j', replace

}
