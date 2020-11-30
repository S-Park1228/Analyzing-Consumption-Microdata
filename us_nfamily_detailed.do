********************************************************************************
********************  Sorting households by household types  ********************
********************************************************************************

if part == "current" {

* Total household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "single parent w/ over 3 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size >= 4
save household15, replace

* Parent(s) with a child
use household10, replace
append using household13
replace nfamily = "3. parent(s) w/ a child"
save household3, replace

* Parent(s) with 2 children
use household11, replace
append using household14
replace nfamily = "4. parent(s) w/ 2 children"
save household4, replace

* Parent(s) with over 3 children
use household12, replace
append using household15
replace nfamily = "5. parent(s) w/ over 3 children"
save household5, replace

* Other
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur
gen nfamily = "6. other"
drop if fam_type == "1" | fam_type == "2" | fam_type == "3" | fam_type == "4" | fam_type == "6" | fam_type == "7"
drop if fam_size == 1
save household6, replace

}




else if part == "previous" {

* Total household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "single parent w/ over 3 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size >= 4
save household15, replace

* Parent(s) with a child
use household10, replace
append using household13
replace nfamily = "3. parent(s) w/ a child"
save household3, replace

* Parent(s) with 2 children
use household11, replace
append using household14
replace nfamily = "4. parent(s) w/ 2 children"
save household4, replace

* Parent(s) with over 3 childrenó
use household12, replace
append using household15
replace nfamily = "5. parent(s) w/ over 3 children"
save household5, replace

* Other
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre
gen nfamily = "6. other"
drop if fam_type == "1" | fam_type == "2" | fam_type == "3" | fam_type == "4" | fam_type == "6" | fam_type == "7"
drop if fam_size == 1
save household6, replace

}



use household0, replace
append using household1
append using household2
append using household3
append using household4
append using household5
append using household6
