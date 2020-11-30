clear all
cd D:\Data\us_consumption\mtbi

* The uccs in the mtbi files are basic elements composing the categories of fmli.
* When you sum up uccs which compose the categories of fmli according to the formulas described on the variables sheet in "ce_pumd_interview_diary_dictionary.xlsx".
* Theoretical the sums of uccs in mtbi should be equal to the values of fmli. However, there could be some discrepancies in the results.
* The following 3 categories may have discrepancies in their results because neither there is a ucc nor a formula: VRNTLOCQ, HLTHINCQ, RETPENCQ.
* The expenses of specific items in mtbi files will be divided into the current quarter and the previous quarter.
* The data organized from the above will be merged with fmli files.
* Calculate the weighted average by inc_quantile, age and nfamily.

* How to turn off "more" automatically.
set more off, permanently

********************************************************************************
***** Classify every ucc into the current quarter and the previous quarter *****
********************************************************************************



* Exclude the uccs which expires before 2000.
* It takes about 30 hrs to process this part.
* Exclude the overlapping uccs as well as the uccs with the same code description.
foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {

forvalues j=6/8 {

local x=`j'+1

use D:\Data\us_consumption\intrvw0`j'\mtbi0`j'1x, replace

* code description (removing the overlapping uccs)
replace ucc="210901" if ucc=="210902"
replace ucc="220121" if ucc=="220122"
replace ucc="220211" if ucc=="220212"
replace ucc="220311" if ucc=="220312"
replace ucc="220313" if ucc=="220314"
replace ucc="220901" if ucc=="220902"
replace ucc="230141" if ucc=="230142"
replace ucc="230901" if ucc=="230902"
replace ucc="240111" if ucc=="240112"
replace ucc="240121" if ucc=="240122"
replace ucc="240121" if ucc=="240123"
replace ucc="240221" if ucc=="240222"
replace ucc="240311" if ucc=="240312"
replace ucc="240311" if ucc=="240313"
replace ucc="240321" if ucc=="240322"
replace ucc="240321" if ucc=="240323"
replace ucc="320611" if ucc=="320612"
replace ucc="320611" if ucc=="320613"
replace ucc="320624" if ucc=="320625"
replace ucc="320624" if ucc=="320626"
replace ucc="340911" if ucc=="340912"
replace ucc="580431" if ucc=="580441"
replace ucc="580432" if ucc=="580442"
replace ucc="580909" if ucc=="580910"
replace ucc="880110" if ucc=="880310"
replace ucc="220111" if ucc=="220112"
replace ucc="320632" if ucc=="320633"
replace ucc="230121" if ucc=="230122"
replace ucc="230121" if ucc=="230123"

* If and else command to ignore the uccs not mentioned above
gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

* For the 2nd, the 3rd and the 4th quarter, use both current and previous values.
* For the 1st quarter, you only need previous values
gen current=1 if ref_mo=="01" | ref_mo=="02" | ref_mo=="03"
replace current=0 if current==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)

drop if newid==newid[_n-1]
keep newid var_`i'_cur

save us_`i'_200`j'q1x, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.

save us_`i'_200`j'q1x, replace

}



use D:\Data\us_consumption\intrvw0`j'\mtbi0`j'2, replace

* code description (removing the overlapping uccs)
replace ucc="210901" if ucc=="210902"
replace ucc="220121" if ucc=="220122"
replace ucc="220211" if ucc=="220212"
replace ucc="220311" if ucc=="220312"
replace ucc="220313" if ucc=="220314"
replace ucc="220901" if ucc=="220902"
replace ucc="230141" if ucc=="230142"
replace ucc="230901" if ucc=="230902"
replace ucc="240111" if ucc=="240112"
replace ucc="240121" if ucc=="240122"
replace ucc="240121" if ucc=="240123"
replace ucc="240221" if ucc=="240222"
replace ucc="240311" if ucc=="240312"
replace ucc="240311" if ucc=="240313"
replace ucc="240321" if ucc=="240322"
replace ucc="240321" if ucc=="240323"
replace ucc="320611" if ucc=="320612"
replace ucc="320611" if ucc=="320613"
replace ucc="320624" if ucc=="320625"
replace ucc="320624" if ucc=="320626"
replace ucc="340911" if ucc=="340912"
replace ucc="580431" if ucc=="580441"
replace ucc="580432" if ucc=="580442"
replace ucc="580909" if ucc=="580910"
replace ucc="880110" if ucc=="880310"
replace ucc="220111" if ucc=="220112"
replace ucc="320632" if ucc=="320633"
replace ucc="230121" if ucc=="230122"
replace ucc="230121" if ucc=="230123"

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="04" | ref_mo=="05" | ref_mo=="06"
replace current=0 if current==.

gen previous=1 if ref_mo=="01" | ref_mo=="02" | ref_mo=="03"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_200`j'q2, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_200`j'q2, replace

}



use D:\Data\us_consumption\intrvw0`j'\mtbi0`j'3, replace

* code description (removing the overlapping uccs)
replace ucc="210901" if ucc=="210902"
replace ucc="220121" if ucc=="220122"
replace ucc="220211" if ucc=="220212"
replace ucc="220311" if ucc=="220312"
replace ucc="220313" if ucc=="220314"
replace ucc="220901" if ucc=="220902"
replace ucc="230141" if ucc=="230142"
replace ucc="230901" if ucc=="230902"
replace ucc="240111" if ucc=="240112"
replace ucc="240121" if ucc=="240122"
replace ucc="240121" if ucc=="240123"
replace ucc="240221" if ucc=="240222"
replace ucc="240311" if ucc=="240312"
replace ucc="240311" if ucc=="240313"
replace ucc="240321" if ucc=="240322"
replace ucc="240321" if ucc=="240323"
replace ucc="320611" if ucc=="320612"
replace ucc="320611" if ucc=="320613"
replace ucc="320624" if ucc=="320625"
replace ucc="320624" if ucc=="320626"
replace ucc="340911" if ucc=="340912"
replace ucc="580431" if ucc=="580441"
replace ucc="580432" if ucc=="580442"
replace ucc="580909" if ucc=="580910"
replace ucc="880110" if ucc=="880310"
replace ucc="220111" if ucc=="220112"
replace ucc="320632" if ucc=="320633"
replace ucc="230121" if ucc=="230122"
replace ucc="230121" if ucc=="230123"

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="07" | ref_mo=="08" | ref_mo=="09"
replace current=0 if current==.

gen previous=1 if ref_mo=="04" | ref_mo=="05" | ref_mo=="06"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_200`j'q3, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_200`j'q3, replace

}



use D:\Data\us_consumption\intrvw0`j'\mtbi0`j'4, replace

* code description (removing the overlapping uccs)
replace ucc="210901" if ucc=="210902"
replace ucc="220121" if ucc=="220122"
replace ucc="220211" if ucc=="220212"
replace ucc="220311" if ucc=="220312"
replace ucc="220313" if ucc=="220314"
replace ucc="220901" if ucc=="220902"
replace ucc="230141" if ucc=="230142"
replace ucc="230901" if ucc=="230902"
replace ucc="240111" if ucc=="240112"
replace ucc="240121" if ucc=="240122"
replace ucc="240121" if ucc=="240123"
replace ucc="240221" if ucc=="240222"
replace ucc="240311" if ucc=="240312"
replace ucc="240311" if ucc=="240313"
replace ucc="240321" if ucc=="240322"
replace ucc="240321" if ucc=="240323"
replace ucc="320611" if ucc=="320612"
replace ucc="320611" if ucc=="320613"
replace ucc="320624" if ucc=="320625"
replace ucc="320624" if ucc=="320626"
replace ucc="340911" if ucc=="340912"
replace ucc="580431" if ucc=="580441"
replace ucc="580432" if ucc=="580442"
replace ucc="580909" if ucc=="580910"
replace ucc="880110" if ucc=="880310"
replace ucc="220111" if ucc=="220112"
replace ucc="320632" if ucc=="320633"
replace ucc="230121" if ucc=="230122"
replace ucc="230121" if ucc=="230123"

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="10" | ref_mo=="11" | ref_mo=="12"
replace current=0 if current==.

gen previous=1 if ref_mo=="07" | ref_mo=="08" | ref_mo=="09"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_200`j'q4, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_200`j'q4, replace

}



use D:\Data\us_consumption\intrvw0`j'\mtbi0`x'1, replace

* code description (removing the overlapping uccs)
replace ucc="210901" if ucc=="210902"
replace ucc="220121" if ucc=="220122"
replace ucc="220211" if ucc=="220212"
replace ucc="220311" if ucc=="220312"
replace ucc="220313" if ucc=="220314"
replace ucc="220901" if ucc=="220902"
replace ucc="230141" if ucc=="230142"
replace ucc="230901" if ucc=="230902"
replace ucc="240111" if ucc=="240112"
replace ucc="240121" if ucc=="240122"
replace ucc="240121" if ucc=="240123"
replace ucc="240221" if ucc=="240222"
replace ucc="240311" if ucc=="240312"
replace ucc="240311" if ucc=="240313"
replace ucc="240321" if ucc=="240322"
replace ucc="240321" if ucc=="240323"
replace ucc="320611" if ucc=="320612"
replace ucc="320611" if ucc=="320613"
replace ucc="320624" if ucc=="320625"
replace ucc="320624" if ucc=="320626"
replace ucc="340911" if ucc=="340912"
replace ucc="580431" if ucc=="580441"
replace ucc="580432" if ucc=="580442"
replace ucc="580909" if ucc=="580910"
replace ucc="880110" if ucc=="880310"
replace ucc="220111" if ucc=="220112"
replace ucc="320632" if ucc=="320633"
replace ucc="230121" if ucc=="230122"
replace ucc="230121" if ucc=="230123"

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen previous=1 if ref_mo=="10" | ref_mo=="11" | ref_mo=="12"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_pre

save us_`i'_200`x'q1, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_pre=.

save us_`i'_200`x'q1, replace

}



}



********************************************************************************



use D:\Data\us_consumption\intrvw09\mtbi091x, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="01" | ref_mo=="02" | ref_mo=="03"
replace current=0 if current==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_2009q1x, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.

save us_`i'_2009q1x, replace

}



use D:\Data\us_consumption\intrvw09\mtbi092, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="04" | ref_mo=="05" | ref_mo=="06"
replace current=0 if current==.

gen previous=1 if ref_mo=="01" | ref_mo=="02" | ref_mo=="03"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_2009q2, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_2009q2, replace

}



use D:\Data\us_consumption\intrvw09\mtbi093, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="07" | ref_mo=="08" | ref_mo=="09"
replace current=0 if current==.

gen previous=1 if ref_mo=="04" | ref_mo=="05" | ref_mo=="06"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_2009q3, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_2009q3, replace

}



use D:\Data\us_consumption\intrvw09\mtbi094, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="10" | ref_mo=="11" | ref_mo=="12"
replace current=0 if current==.

gen previous=1 if ref_mo=="07" | ref_mo=="08" | ref_mo=="09"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_2009q4, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_2009q4, replace

}



use D:\Data\us_consumption\intrvw09\mtbi101, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen previous=1 if ref_mo=="10" | ref_mo=="11" | ref_mo=="12"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_pre

save us_`i'_2010q1, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_pre=.

save us_`i'_2010q1, replace

}



********************************************************************************



forvalues j=10/18 {

local x=`j'+1

use D:\Data\us_consumption\intrvw`j'\mtbi`j'1x, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="01" | ref_mo=="02" | ref_mo=="03"
replace current=0 if current==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)

drop if newid==newid[_n-1]
keep newid var_`i'_cur

save us_`i'_20`j'q1x, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.

save us_`i'_20`j'q1x, replace

}



use D:\Data\us_consumption\intrvw`j'\mtbi`j'2, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="04" | ref_mo=="05" | ref_mo=="06"
replace current=0 if current==.

gen previous=1 if ref_mo=="01" | ref_mo=="02" | ref_mo=="03"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_20`j'q2, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_20`j'q2, replace

}



use D:\Data\us_consumption\intrvw`j'\mtbi`j'3, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="07" | ref_mo=="08" | ref_mo=="09"
replace current=0 if current==.

gen previous=1 if ref_mo=="04" | ref_mo=="05" | ref_mo=="06"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_20`j'q3, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_20`j'q3, replace

}



use D:\Data\us_consumption\intrvw`j'\mtbi`j'4, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen current=1 if ref_mo=="10" | ref_mo=="11" | ref_mo=="12"
replace current=0 if current==.

gen previous=1 if ref_mo=="07" | ref_mo=="08" | ref_mo=="09"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_cur=sum(cost*current)
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_cur var_`i'_pre

save us_`i'_20`j'q4, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_cur=.
gen var_`i'_pre=.

save us_`i'_20`j'q4, replace

}



use D:\Data\us_consumption\intrvw`j'\mtbi`x'1, replace

gen tem=1 if ucc=="`i'"
replace tem=0 if tem==.
egen tem_max=max(tem)
if tem_max>0 {

keep if ucc=="`i'"

gen previous=1 if ref_mo=="10" | ref_mo=="11" | ref_mo=="12"
replace previous=0 if previous==.

sort newid
bysort newid: egen var_`i'_pre=sum(cost*previous)

drop if newid==newid[_n-1]
keep newid var_`i'_pre

save us_`i'_20`x'q1, replace

}

else {

keep newid
sort newid
drop if newid==newid[_n-1]
gen var_`i'_pre=.

save us_`i'_20`x'q1, replace

}



}



}



********************************************************************************
********************** fmli file°ú itemº° mtbi fileÀ» merge **********************
********************************************************************************



* Merge the organized mtbi raw data with fmli data using households' id
* It takes about 9 hrs to complete the 2006~2018 data.

* 2006~2008
forvalues j=6/8 {

use D:\Data\us_consumption\intrvw0`j'\fmli0`j'1x, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {

* When you merge fmli and mtbi of the same quarter, you can see how contents of fmli and mtbi are 100% equilvalent to each other.
* Thus when you make use of all the ucc in mtbi files for every quarter, you may be able to construct the categories of fmli. 
* Since this do-file takes into account uccs in dictionary, not in mtbi files, if there are errors in dictionary, this codes may not be accurate.   

merge m:m newid using us_`i'_200`j'q1x
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Expenditure occurred in the current quarter
* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {

by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_200`j'q1, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'2, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {

merge m:m newid using us_`i'_200`j'q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Expenditure occurred in the previous quarter
* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {

by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_200`j'q1, replace

append using us_tem_cur_200`j'q1

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="200`j'q1"
move qyear inc_quantile

save us_consumption_mtbi_200`j'q1, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'2, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_200`j'q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_200`j'q2, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'3, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_200`j'q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_200`j'q2, replace

append using us_tem_cur_200`j'q2

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="200`j'q2"
move qyear inc_quantile

save us_consumption_mtbi_200`j'q2, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'3, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_200`j'q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_200`j'q3, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'4, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_200`j'q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_200`j'q3, replace

append using us_tem_cur_200`j'q3

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="200`j'q3"
move qyear inc_quantile

save us_consumption_mtbi_200`j'q3, replace



use D:\Data\us_consumption\intrvw0`j'\fmli0`j'4, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_200`j'q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_200`j'q4, replace


local x=`j'+1
use D:\Data\us_consumption\intrvw0`j'\fmli0`x'1, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_200`x'q1
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 200`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_200`j'q4, replace

append using us_tem_cur_200`j'q4

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="200`j'q4"
move qyear inc_quantile

save us_consumption_mtbi_200`j'q4, replace



}



********************************************************************************



use D:\Data\us_consumption\intrvw09\fmli091x, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2009q1x
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_2009q1, replace



use D:\Data\us_consumption\intrvw09\fmli092, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2009q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_2009q1, replace

append using us_tem_cur_2009q1

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="2009q1"
move qyear inc_quantile

save us_consumption_mtbi_2009q1, replace



use D:\Data\us_consumption\intrvw09\fmli092, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2009q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_2009q2, replace



use D:\Data\us_consumption\intrvw09\fmli093, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2009q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_2009q2, replace

append using us_tem_cur_2009q2

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="2009q2"
move qyear inc_quantile

save us_consumption_mtbi_2009q2, replace



use D:\Data\us_consumption\intrvw09\fmli093, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2009q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_2009q3, replace



use D:\Data\us_consumption\intrvw09\fmli094, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2009q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_2009q3, replace

append using us_tem_cur_2009q3

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="2009q3"
move qyear inc_quantile

save us_consumption_mtbi_2009q3, replace



use D:\Data\us_consumption\intrvw09\fmli094, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2009q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_2009q4, replace



use D:\Data\us_consumption\intrvw09\fmli101, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_2010q1
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank <= 0.2
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 2009
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_2009q4, replace

append using us_tem_cur_2009q4

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="2009q4"
move qyear inc_quantile

save us_consumption_mtbi_2009q4, replace



********************************************************************************



forvalues j=10/18 {

use D:\Data\us_consumption\intrvw`j'\fmli`j'1x, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`j'q1x
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_20`j'q1, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'2, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`j'q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_20`j'q1, replace

append using us_tem_cur_20`j'q1

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="20`j'q1"
move qyear inc_quantile

save us_consumption_mtbi_20`j'q1, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'2, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`j'q2
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_20`j'q2, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'3, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`j'q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_20`j'q2, replace

append using us_tem_cur_20`j'q2

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="20`j'q2"
move qyear inc_quantile

save us_consumption_mtbi_20`j'q2, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'3, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`j'q3
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_20`j'q3, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'4, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`j'q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_20`j'q3, replace

append using us_tem_cur_20`j'q3

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="20`j'q3"
move qyear inc_quantile

save us_consumption_mtbi_20`j'q3, replace



use D:\Data\us_consumption\intrvw`j'\fmli`j'4, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`j'q4
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_cur

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "current"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_cur*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_cur_20`j'q4, replace



local x=`j'+1
use D:\Data\us_consumption\intrvw`j'\fmli`x'1, replace

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
merge m:m newid using us_`i'_20`x'q1
drop _merge

}

keep newid perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 *_pre

save us_mtbi_tem, replace

* Total households
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
gen inc_quantile = "all"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income0, replace

* the 1st quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank <= 0.1
gen inc_quantile = "the 1st quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
save income1, replace

* the 2nd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.2 & inc_rank <= 0.4
gen inc_quantile = "the 2nd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income2, replace

* the 3rd quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.4 & inc_rank <= 0.6
gen inc_quantile = "the 3rd quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income3, replace

* the 4th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.6 & inc_rank <= 0.8
gen inc_quantile = "the 4th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income4, replace

* the 5th quintile
use us_mtbi_tem, replace
gen year = 20`j'
gen part = "previous"
keep if inc_rank > 0.8 & inc_rank <= 1
gen inc_quantile = "the 5th quintile"
save tem_income, replace
do "D:\Data\us_consumption\us_age_detailed.do"
drop perslt18 no_earnr fam_type age_ref inc_rank
save income5, replace

use income0, replace
append using income1
append using income2
append using income3
append using income4
append using income5

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily

foreach i in 002120 190901 190902 190903 190904 200900 210110 210210 210310 210901 220121 220211 220311 220313 220512 220513 ///
 220611 220612 220615 220901 230112 230113 230114 230115 230117 230118 230141 230150 230151 230152 230901 240111 240113 240121 ///
 240123 240211 240212 240213 240214 240221 240311 240321 250111 250112 250113 250114 250211 250212 250213 250214 250223 250911 ///
 250912 250914 260111 260112 260113 260114 260211 260212 260213 260214 270102 270104 270106 270211 270212 270213 270214 270310 ///
 270311 270411 270412 270413 270414 270901 270902 270903 280110 280120 280140 280210 280220 290110 290120 290210 290310 290320 ///
 290410 290420 290430 290440 300111 300112 300216 300217 300311 300312 300321 300322 300331 300332 300411 300412 310140 310210 ///
 310220 310231 310232 310240 310243 310314 310316 310333 310334 310340 310350 310400 320111 320120 320130 320150 320221 320232 /// 
 320233 320330 320345 320370 320410 320420 320511 320512 320521 320522 320611 320624 320631 320901 320902 320903 320904 330511 /// 
 340210 340310 340410 340420 340510 340520 340530 340610 340620 340630 340901 340902 340903 340904 340905 340906 340907 340908 /// 
 340910 340911 340914 340915 350110 360110 360120 360210 360311 360312 360320 360330 360350 360420 360513 360901 360902 370110 /// 
 370125 370211 370212 370213 370220 370311 370314 370902 370903 370904 380110 380210 380311 380315 380320 380333 380340 380410 /// 
 380420 380430 380510 380901 380902 380903 390110 390120 390210 390223 390230 390310 390321 390322 390901 390902 400110 400210 /// 
 400220 400310 410110 410120 410130 410140 410901 420115 430110 430120 430130 440110 440120 440130 440140 440150 440210 440900 /// 
 450110 450116 450210 450216 450220 450226 450350 450351 450352 450353 450354 460110 460116 460901 460902 460907 460908 470111 /// 
 470112 470113 470211 470212 470220 470311 480110 480213 480216 490110 490300 490311 490312 490313 490314 490318 490501 490900 /// 
 500110 510110 510901 510902 520110 520310 520410 520516 520517 520531 520532 520541 520542 520550 520901 520902 520904 520905 /// 
 520907 530110 530210 530311 530312 530411 530412 530510 530901 530902 540000 550110 550320 550330 550340 560110 560210 560310 /// 
 560330 560400 560410 560420 570111 570220 570230 570240 570901 570903 580115 580116 580311 580312 580400 580401 580402 580411 /// 
 580412 580421 580422 580431 580432 580901 580903 580904 580905 580906 580907 580908 580909 590220 590230 590310 590410 600110 /// 
 600121 600122 600127 600128 600132 600138 600141 600142 600143 600144 600210 600310 600410 600420 600430 600901 600902 610110 /// 
 610120 610130 610140 610210 610230 610320 610900 620111 620112 620114 620115 620121 620122 620212 620213 620214 620215 620216 /// 
 620221 620222 620310 620320 620330 620410 620420 620903 620904 620905 620906 620908 620909 620912 620917 620918 620919 620921 /// 
 620922 620926 620930 630110 630210 640130 640420 640430 650310 660110 660210 660410 660901 660902 670110 670210 670310 670410 /// 
 670901 670902 670903 680110 680140 680210 680220 680310 680320 680901 680902 680904 680905 690111 690113 690114 690116 690117 /// 
 690118 690119 690120 690230 690244 690245 690310 690320 690330 690340 690350 700110 790210 790240 790330 790410 790420 790430 /// 
 790600 790610 790611 790620 790630 790640 790690 790710 790730 790810 790830 790910 790920 790930 790940 800111 800121 800700 /// 
 800710 800721 800804 800811 800821 800831 800841 800851 800861 810101 810102 810301 810302 810400 820101 820102 820202 820301 /// 
 820302 830101 830102 830201 830202 830203 830204 830301 830302 830303 830304 840101 840102 850100 850200 850300 860100 860200 /// 
 860301 860302 860400 860500 860600 860700 870101 870102 870103 870104 870201 870202 870203 870204 870301 870302 870303 870304 /// 
 870401 870403 870404 870501 870502 870503 870504 870605 870606 870607 870701 870702 870703 870704 870801 870802 870803 880110 /// 
 880120 880210 880220 880320 900002 910042 910050 910101 910102 910103 910104 910105 910107 950024 990900 990920 990930 990950 /// 
 320632 990940 800803 250221 250904 820201 220321 490502 250222 250901 250902 310110 310120 310130 310341 310342 570110 570210 /// 
 590111 590112 590211 590212 690220 250903 660900 270103 790220 790230 790310 790320 270904 320210 320231 360511 360512 370312 /// 
 370313 380331 380332 390221 390222 910100 790820 790950 950030 310230 690112 320623 450414 220616 230133 230134 320163 620916 /// 
 250913 006001 006002 450311 450312 450411 450412 870608 230121 270101 280130 280230 280900 300211 300212 300221 300222 310311 /// 
 310313 310320 320220 320310 320320 320340 320350 320360 320621 320622 340211 340212 360340 360410 370120 370130 380312 380313 /// 
 420110 420120 450310 450313 450314 450410 450413 480214 490211 490212 490221 490231 490232 490319 490411 490412 490413 520511 /// 
 520512 520521 520522 580111 580112 580113 580114 620113 620211 690210 690241 690242 710110 870804 860800 480212 480215 520560 /// 
 690115 270105 006009 006010 870402 660310 240223 910106 {
 
by inc_quantile age nfamily: egen t_var_`i'=sum(var_`i'_pre*weight)

}

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_var_*

save us_tem_pre_20`j'q4, replace

append using us_tem_cur_20`j'q4

collapse (sum) t_var_*, by(inc_quantile age nfamily)

gen qyear="20`j'q4"
move qyear inc_quantile

save us_consumption_mtbi_20`j'q4, replace



}



********************************************************************************
******************* Summation of quarterly data for each year ******************
********************************************************************************



forvalues j=6/9 {

use us_consumption_mtbi_200`j'q1, replace
append using us_consumption_mtbi_200`j'q2
append using us_consumption_mtbi_200`j'q3
append using us_consumption_mtbi_200`j'q4

* Remove following uccs due to overlapping problems: 210902 220122 220212 220312 220314 220902 230142 230902 240112 240122 240123 240222 240312 240313 240322 240323 320612 320613 320625 320626 340912 580441 580442 580910 880310 220112 320633 230122 230123

collapse (sum) t_var_190904 t_var_790220 t_var_790230 t_var_790240 t_var_190901 t_var_190902 t_var_190903 t_var_790410 t_var_790430 /// 
t_var_800700 t_var_200900 t_var_790310 t_var_790320 t_var_790330 t_var_790420 /// 
t_var_220311 t_var_220313 t_var_220321 t_var_880110 t_var_210901 t_var_220121 t_var_220901 t_var_230112 t_var_230113 t_var_230114 /// 
t_var_230115 t_var_230151 t_var_230901 t_var_240212 t_var_240213 t_var_320622 t_var_320632 t_var_340911 t_var_990930 t_var_830201 /// 
t_var_830203 t_var_880120 t_var_210110 t_var_230121 t_var_230141 t_var_230150 t_var_240111 t_var_240121 t_var_240211 t_var_240221 /// 
t_var_240311 t_var_240321 t_var_320611 t_var_320621 t_var_320631 t_var_350110 t_var_790690 t_var_990920 t_var_210210 t_var_210310 /// 
t_var_230152 t_var_240113 t_var_240214 t_var_240223 t_var_320623 t_var_990940 t_var_680905 t_var_830202 t_var_830204 t_var_880320 /// 
t_var_260211 t_var_260212 t_var_260213 t_var_260214 t_var_260111 t_var_260112 t_var_260113 t_var_260114 t_var_250111 t_var_250112 /// 
t_var_250113 t_var_250114 t_var_250211 t_var_250212 t_var_250213 t_var_250214 t_var_250221 t_var_250222 t_var_250223 t_var_250901 /// 
t_var_250902 t_var_250903 t_var_250904 t_var_250911 t_var_250912 t_var_250913 t_var_250914 t_var_270101 t_var_270102 t_var_270103 /// 
t_var_270104 t_var_270105 t_var_270106 t_var_270211 t_var_270212 t_var_270213 t_var_270214 t_var_270411 t_var_270412 t_var_270413 /// 
t_var_270414 t_var_270901 t_var_270902 t_var_270903 t_var_270904 t_var_340310 t_var_340410 t_var_340420 t_var_340520 t_var_340530 /// 
t_var_340903 t_var_340906 t_var_340910 t_var_340914 t_var_340210 t_var_340211 t_var_340212 t_var_670310 t_var_330511 t_var_340510 /// 
t_var_340620 t_var_340630 t_var_340901 t_var_340907 t_var_340908 t_var_340915 t_var_690113 t_var_690114 t_var_690116 t_var_690310 /// 
t_var_990900 t_var_280110 t_var_280120 t_var_280130 t_var_280210 t_var_280220 t_var_280230 t_var_280900 t_var_290110 t_var_290120 /// 
t_var_290210 t_var_290310 t_var_290320 t_var_290410 t_var_290420 t_var_290430 t_var_290440 t_var_230133 t_var_230134 t_var_320111 /// 
t_var_320163 t_var_320624 t_var_230117 t_var_230118 t_var_300111 t_var_300112 t_var_300211 t_var_300212 t_var_300216 t_var_300217 /// 
t_var_300221 t_var_300222 t_var_300311 t_var_300312 t_var_300321 t_var_300322 t_var_300331 t_var_300332 t_var_300411 t_var_300412 /// 
t_var_320511 t_var_320512 t_var_320310 t_var_320320 t_var_320330 t_var_320340 t_var_320350 t_var_320360 t_var_320370 t_var_320521 /// 
t_var_320522 t_var_320120 t_var_320130 t_var_320150 t_var_320210 t_var_320220 t_var_320221 t_var_320231 t_var_320232 t_var_320233 /// 
t_var_320410 t_var_320420 t_var_320901 t_var_320902 t_var_320903 t_var_320904 t_var_340904 t_var_430130 t_var_690111 t_var_690112 /// 
t_var_690115 t_var_690117 t_var_690119 t_var_690120 t_var_690210 t_var_690220 t_var_690230 t_var_690241 t_var_690242 t_var_690244 /// 
t_var_690245 ///
t_var_360110 t_var_360120 t_var_360210 t_var_360311 t_var_360312 t_var_360320 t_var_360330 t_var_360340 t_var_360350 t_var_360410 ///
t_var_360511 t_var_360512 t_var_360513 t_var_360901 t_var_360902 t_var_370110 t_var_370120 t_var_370130 t_var_370211 t_var_370212 /// 
t_var_370213 t_var_370220 t_var_370311 t_var_370312 t_var_370313 t_var_370314 t_var_370902 t_var_370903 t_var_370904 t_var_380110 /// 
t_var_380210 t_var_380311 t_var_380312 t_var_380313 t_var_380320 t_var_380331 t_var_380332 t_var_380333 t_var_380340 t_var_380410 /// 
t_var_380420 t_var_380430 t_var_380510 t_var_380901 t_var_380902 t_var_380903 t_var_390110 t_var_390120 t_var_390210 t_var_390221 /// 
t_var_390222 t_var_390230 t_var_390310 t_var_390321 t_var_390322 t_var_390901 t_var_390902 t_var_410110 t_var_410120 t_var_410130 /// 
t_var_410140 t_var_410901 t_var_400110 t_var_400210 t_var_400220 t_var_400310 t_var_420110 t_var_420115 t_var_420120 t_var_430110 /// 
t_var_430120 t_var_440110 t_var_440120 t_var_440130 t_var_440140 t_var_440150 t_var_440210 t_var_440900 /// 
t_var_870101 t_var_870102 t_var_870103 t_var_870104 t_var_870201 t_var_870202 t_var_870203 t_var_870204 t_var_870301 t_var_870302 ///
t_var_870303 t_var_870304 t_var_470111 t_var_470112 t_var_470113 t_var_470211 t_var_470212 t_var_470220 t_var_480110 t_var_480212 /// 
t_var_480213 t_var_480214 t_var_480215 t_var_480216 t_var_490110 t_var_490211 t_var_490212 t_var_490221 t_var_490231 t_var_490232 /// 
t_var_490300 t_var_490311 t_var_490312 t_var_490313 t_var_490314 t_var_490318 t_var_490319 t_var_490411 t_var_490412 t_var_490413 /// 
t_var_490501 t_var_490502 t_var_490900 t_var_530110 t_var_530210 t_var_530312 t_var_530411 t_var_530510 t_var_530901 t_var_530311 /// 
t_var_530412 t_var_530902 /// 
t_var_560110 t_var_560210 t_var_560310 t_var_560330 t_var_560400 t_var_560410 t_var_560420 t_var_570110 t_var_570111 t_var_570210 /// 
t_var_570220 t_var_570230 t_var_570240 t_var_540000 t_var_550110 t_var_550320 t_var_550330 t_var_550340 t_var_570901 t_var_570903 /// 
t_var_640430 ///
t_var_610900 t_var_620111 t_var_620121 t_var_620122 t_var_620211 t_var_620212 t_var_620213 t_var_620214 t_var_620215 t_var_620216 /// 
t_var_620221 t_var_620222 t_var_620310 t_var_620903 t_var_270310 t_var_270311 t_var_310110 t_var_310120 t_var_310130 t_var_310140 /// 
t_var_310210 t_var_310220 t_var_310230 t_var_310231 t_var_310232 t_var_310240 t_var_310311 t_var_310313 t_var_310314 t_var_310316 /// 
t_var_310320 t_var_310333 t_var_310334 t_var_310340 t_var_310341 t_var_310342 t_var_310350 t_var_310400 t_var_340610 t_var_340902 /// 
t_var_340905 t_var_610130 t_var_620904 t_var_620912 t_var_620917 t_var_620918 t_var_690320 t_var_690330 t_var_690340 t_var_690350 /// 
t_var_620916 t_var_610110 t_var_610120 t_var_610140 t_var_610320 t_var_620410 t_var_620420 t_var_870401 t_var_870402 t_var_870403 /// 
t_var_870404 t_var_870501 t_var_870502 t_var_870503 t_var_870504 t_var_870605 t_var_870606 t_var_870607 t_var_870608 t_var_870701 /// 
t_var_870702 t_var_870703 t_var_870704 t_var_870801 t_var_870802 t_var_870803 t_var_870804 t_var_520901 t_var_520904 t_var_520907 /// 
t_var_600110 t_var_600210 t_var_600310 t_var_600410 t_var_600420 t_var_600430 t_var_600901 t_var_600902 t_var_610210 t_var_610230 /// 
t_var_620320 t_var_620330 t_var_620905 t_var_620906 t_var_620908 t_var_620909 t_var_620919 t_var_620921 t_var_620922 ///
t_var_640130 t_var_640420 t_var_650310 /// 
t_var_590111 t_var_590112 t_var_590211 t_var_590212 t_var_590220 t_var_590230 t_var_590310 t_var_590410 /// 
t_var_660310 t_var_690118 /// 
t_var_660110 t_var_660210 t_var_660410 t_var_660900 t_var_660901 t_var_660902 t_var_670110 t_var_670210 t_var_670410 t_var_670901 /// 
t_var_670902 t_var_670903 /// 
t_var_630110 t_var_630210 /// 
t_var_620112 t_var_620115 t_var_620926 t_var_680110 t_var_680140 t_var_680210 t_var_680220 t_var_680901 t_var_680902 t_var_680904 /// 
t_var_790600 t_var_880210 t_var_900002 t_var_710110 t_var_790920 t_var_790940 t_var_880220 /// 
t_var_800111 t_var_800121 t_var_800804 t_var_800811 t_var_800821 t_var_800831 t_var_800841 t_var_800851 t_var_800861 /// 
t_var_002120 t_var_700110 /// 
t_var_600121 t_var_600122 t_var_600132 t_var_600141 t_var_600142 t_var_620930 t_var_680310 t_var_680320 ///
t_var_830102 /// 
t_var_520512 t_var_520522 t_var_520905 t_var_520532 t_var_520542, by(inc_quantile age nfamily)

save us_consumption_mtbi_200`j', replace

}



forvalues j=10/18 {

use us_consumption_mtbi_20`j'q1, replace
append using us_consumption_mtbi_20`j'q2
append using us_consumption_mtbi_20`j'q3
append using us_consumption_mtbi_20`j'q4

collapse (sum) t_var_190904 t_var_790220 t_var_790230 t_var_790240 t_var_190901 t_var_190902 t_var_190903 t_var_790410 t_var_790430 /// 
t_var_800700 t_var_200900 t_var_790310 t_var_790320 t_var_790330 t_var_790420 /// 
t_var_220311 t_var_220313 t_var_220321 t_var_880110 t_var_210901 t_var_220121 t_var_220901 t_var_230112 t_var_230113 t_var_230114 /// 
t_var_230115 t_var_230151 t_var_230901 t_var_240212 t_var_240213 t_var_320622 t_var_320632 t_var_340911 t_var_990930 t_var_830201 /// 
t_var_830203 t_var_880120 t_var_210110 t_var_230121 t_var_230141 t_var_230150 t_var_240111 t_var_240121 t_var_240211 t_var_240221 /// 
t_var_240311 t_var_240321 t_var_320611 t_var_320621 t_var_320631 t_var_350110 t_var_790690 t_var_990920 t_var_210210 t_var_210310 /// 
t_var_230152 t_var_240113 t_var_240214 t_var_240223 t_var_320623 t_var_990940 t_var_680905 t_var_830202 t_var_830204 t_var_880320 /// 
t_var_260211 t_var_260212 t_var_260213 t_var_260214 t_var_260111 t_var_260112 t_var_260113 t_var_260114 t_var_250111 t_var_250112 /// 
t_var_250113 t_var_250114 t_var_250211 t_var_250212 t_var_250213 t_var_250214 t_var_250221 t_var_250222 t_var_250223 t_var_250901 /// 
t_var_250902 t_var_250903 t_var_250904 t_var_250911 t_var_250912 t_var_250913 t_var_250914 t_var_270101 t_var_270102 t_var_270103 /// 
t_var_270104 t_var_270105 t_var_270106 t_var_270211 t_var_270212 t_var_270213 t_var_270214 t_var_270411 t_var_270412 t_var_270413 /// 
t_var_270414 t_var_270901 t_var_270902 t_var_270903 t_var_270904 t_var_340310 t_var_340410 t_var_340420 t_var_340520 t_var_340530 /// 
t_var_340903 t_var_340906 t_var_340910 t_var_340914 t_var_340210 t_var_340211 t_var_340212 t_var_670310 t_var_330511 t_var_340510 /// 
t_var_340620 t_var_340630 t_var_340901 t_var_340907 t_var_340908 t_var_340915 t_var_690113 t_var_690114 t_var_690116 t_var_690310 /// 
t_var_990900 t_var_280110 t_var_280120 t_var_280130 t_var_280210 t_var_280220 t_var_280230 t_var_280900 t_var_290110 t_var_290120 /// 
t_var_290210 t_var_290310 t_var_290320 t_var_290410 t_var_290420 t_var_290430 t_var_290440 t_var_230133 t_var_230134 t_var_320111 /// 
t_var_320163 t_var_320624 t_var_230117 t_var_230118 t_var_300111 t_var_300112 t_var_300211 t_var_300212 t_var_300216 t_var_300217 /// 
t_var_300221 t_var_300222 t_var_300311 t_var_300312 t_var_300321 t_var_300322 t_var_300331 t_var_300332 t_var_300411 t_var_300412 /// 
t_var_320511 t_var_320512 t_var_320310 t_var_320320 t_var_320330 t_var_320340 t_var_320350 t_var_320360 t_var_320370 t_var_320521 /// 
t_var_320522 t_var_320120 t_var_320130 t_var_320150 t_var_320210 t_var_320220 t_var_320221 t_var_320231 t_var_320232 t_var_320233 /// 
t_var_320410 t_var_320420 t_var_320901 t_var_320902 t_var_320903 t_var_320904 t_var_340904 t_var_430130 t_var_690111 t_var_690112 /// 
t_var_690115 t_var_690117 t_var_690119 t_var_690120 t_var_690210 t_var_690220 t_var_690230 t_var_690241 t_var_690242 t_var_690244 /// 
t_var_690245 ///
t_var_360110 t_var_360120 t_var_360210 t_var_360311 t_var_360312 t_var_360320 t_var_360330 t_var_360340 t_var_360350 t_var_360410 ///
t_var_360511 t_var_360512 t_var_360513 t_var_360901 t_var_360902 t_var_370110 t_var_370120 t_var_370130 t_var_370211 t_var_370212 /// 
t_var_370213 t_var_370220 t_var_370311 t_var_370312 t_var_370313 t_var_370314 t_var_370902 t_var_370903 t_var_370904 t_var_380110 /// 
t_var_380210 t_var_380311 t_var_380312 t_var_380313 t_var_380320 t_var_380331 t_var_380332 t_var_380333 t_var_380340 t_var_380410 /// 
t_var_380420 t_var_380430 t_var_380510 t_var_380901 t_var_380902 t_var_380903 t_var_390110 t_var_390120 t_var_390210 t_var_390221 /// 
t_var_390222 t_var_390230 t_var_390310 t_var_390321 t_var_390322 t_var_390901 t_var_390902 t_var_410110 t_var_410120 t_var_410130 /// 
t_var_410140 t_var_410901 t_var_400110 t_var_400210 t_var_400220 t_var_400310 t_var_420110 t_var_420115 t_var_420120 t_var_430110 /// 
t_var_430120 t_var_440110 t_var_440120 t_var_440130 t_var_440140 t_var_440150 t_var_440210 t_var_440900 /// 
t_var_870101 t_var_870102 t_var_870103 t_var_870104 t_var_870201 t_var_870202 t_var_870203 t_var_870204 t_var_870301 t_var_870302 ///
t_var_870303 t_var_870304 t_var_470111 t_var_470112 t_var_470113 t_var_470211 t_var_470212 t_var_470220 t_var_480110 t_var_480212 /// 
t_var_480213 t_var_480214 t_var_480215 t_var_480216 t_var_490110 t_var_490211 t_var_490212 t_var_490221 t_var_490231 t_var_490232 /// 
t_var_490300 t_var_490311 t_var_490312 t_var_490313 t_var_490314 t_var_490318 t_var_490319 t_var_490411 t_var_490412 t_var_490413 /// 
t_var_490501 t_var_490502 t_var_490900 t_var_530110 t_var_530210 t_var_530312 t_var_530411 t_var_530510 t_var_530901 t_var_530311 /// 
t_var_530412 t_var_530902 /// 
t_var_560110 t_var_560210 t_var_560310 t_var_560330 t_var_560400 t_var_560410 t_var_560420 t_var_570110 t_var_570111 t_var_570210 /// 
t_var_570220 t_var_570230 t_var_570240 t_var_540000 t_var_550110 t_var_550320 t_var_550330 t_var_550340 t_var_570901 t_var_570903 /// 
t_var_640430 ///
t_var_610900 t_var_620111 t_var_620121 t_var_620122 t_var_620211 t_var_620212 t_var_620213 t_var_620214 t_var_620215 t_var_620216 /// 
t_var_620221 t_var_620222 t_var_620310 t_var_620903 t_var_270310 t_var_270311 t_var_310110 t_var_310120 t_var_310130 t_var_310140 /// 
t_var_310210 t_var_310220 t_var_310230 t_var_310231 t_var_310232 t_var_310240 t_var_310311 t_var_310313 t_var_310314 t_var_310316 /// 
t_var_310320 t_var_310333 t_var_310334 t_var_310340 t_var_310341 t_var_310342 t_var_310350 t_var_310400 t_var_340610 t_var_340902 /// 
t_var_340905 t_var_610130 t_var_620904 t_var_620912 t_var_620917 t_var_620918 t_var_690320 t_var_690330 t_var_690340 t_var_690350 /// 
t_var_620916 t_var_610110 t_var_610120 t_var_610140 t_var_610320 t_var_620410 t_var_620420 t_var_870401 t_var_870402 t_var_870403 /// 
t_var_870404 t_var_870501 t_var_870502 t_var_870503 t_var_870504 t_var_870605 t_var_870606 t_var_870607 t_var_870608 t_var_870701 /// 
t_var_870702 t_var_870703 t_var_870704 t_var_870801 t_var_870802 t_var_870803 t_var_870804 t_var_520901 t_var_520904 t_var_520907 /// 
t_var_600110 t_var_600210 t_var_600310 t_var_600410 t_var_600420 t_var_600430 t_var_600901 t_var_600902 t_var_610210 t_var_610230 /// 
t_var_620320 t_var_620330 t_var_620905 t_var_620906 t_var_620908 t_var_620909 t_var_620919 t_var_620921 t_var_620922 ///
t_var_640130 t_var_640420 t_var_650310 /// 
t_var_590111 t_var_590112 t_var_590211 t_var_590212 t_var_590220 t_var_590230 t_var_590310 t_var_590410 /// 
t_var_660310 t_var_690118 /// 
t_var_660110 t_var_660210 t_var_660410 t_var_660900 t_var_660901 t_var_660902 t_var_670110 t_var_670210 t_var_670410 t_var_670901 /// 
t_var_670902 t_var_670903 /// 
t_var_630110 t_var_630210 /// 
t_var_620112 t_var_620115 t_var_620926 t_var_680110 t_var_680140 t_var_680210 t_var_680220 t_var_680901 t_var_680902 t_var_680904 /// 
t_var_790600 t_var_880210 t_var_900002 t_var_710110 t_var_790920 t_var_790940 t_var_880220 /// 
t_var_800111 t_var_800121 t_var_800804 t_var_800811 t_var_800821 t_var_800831 t_var_800841 t_var_800851 t_var_800861 /// 
t_var_002120 t_var_700110 /// 
t_var_600121 t_var_600122 t_var_600132 t_var_600141 t_var_600142 t_var_620930 t_var_680310 t_var_680320 ///
t_var_830102 /// 
t_var_520512 t_var_520522 t_var_520905 t_var_520532 t_var_520542, by(inc_quantile age nfamily)

save us_consumption_mtbi_20`j', replace

}
