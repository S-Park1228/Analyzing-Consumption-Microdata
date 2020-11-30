********************************************************************************
*************  Sorting households by the age of household's headù  *************
********************************************************************************

cd D:\Data\us_consumption\major

* Total households
use tem_income, replace
gen age = "all"
save tem_age, replace
do "D:\Data\us_consumption\us_nfamily.do"
save age0, replace

* the head of a household in 20s
use tem_income, replace
keep if age_ref >= 20 & age_ref < 30
gen age = "20s"
save tem_age, replace
do "D:\Data\us_consumption\us_nfamily.do"
save age1, replace

* the head of a household in 30s
use tem_income, replace
keep if age_ref >= 30 & age_ref < 40
gen age = "30s"
save tem_age, replace
do "D:\Data\us_consumption\us_nfamily.do"
save age2, replace

* the head of a household in 40s
use tem_income, replace
keep if age_ref >= 40 & age_ref < 50
gen age = "40s"
save tem_age, replace
do "D:\Data\us_consumption\us_nfamily.do"
save age3, replace

* the head of a household in 50s
use tem_income, replace
keep if age_ref >= 50 & age_ref < 60
gen age = "50s"
save tem_age, replace
do "D:\Data\us_consumption\us_nfamily.do"
save age4, replace

* the head of a household in 60s
use tem_income, replace
keep if age_ref >= 60 & age_ref < 70
gen age = "60s"
save tem_age, replace
do "D:\Data\us_consumption\us_nfamily.do"
save age5, replace

* the head of a household over 70
use tem_income, replace
keep if age_ref >= 70
gen age = "70s"
save tem_age, replace
do "D:\Data\us_consumption\us_nfamily.do"
save age6, replace

use age0, replace
append using age1
append using age2
append using age3
append using age4
append using age5
append using age6
