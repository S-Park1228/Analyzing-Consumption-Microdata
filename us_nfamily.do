********************************************************************************
********************  Sorting households by household types  ********************
********************************************************************************

cd D:\Data\us_consumption\major

if part == "current" & year < 2013 {

* Total household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
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
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "6. other"
drop if fam_type == "1" | fam_type == "2" | fam_type == "3" | fam_type == "4" | fam_type == "6" | fam_type == "7"
drop if fam_size == 1
save household6, replace

}



else if part == "current" & year == 2013 {

* Total household
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "single parent w/ over 3 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size >= 4
save household15, replace

* Parent(s) with a child
use household10, replace
append using household13
replace nfamily="3. parent(s) w/ a child"
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
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc

}

gen nfamily = "6. other"
drop if fam_type == "1" | fam_type == "2" | fam_type == "3" | fam_type == "4" | fam_type == "6" | fam_type == "7"
drop if fam_size == 1
save household6, replace

}



else if part == "current" & year > 2013 {

* Total household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "single parent w/ over 3 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size >= 4
save household15, replace

* Parent(s) with a child
use household10, replace
append using household13
replace nfamily="3. parent(s) w/ a child"
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
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalc foodcq fdhomecq fdawaycq fdxmapcq fdmapcq alcbevcq ehousngc esheltrc eowndwlc owndwecq mrtintcq proptxcq mrpinscq emrtpnoc rendwecq rntxrpcq rntapycq eothlodc othlodcq emrtpnvc utilcq ntlgascq elctrccq allfulcq fuloilcq othflscq telephcq watrpscq housopcq domsrvcq dmsxcccq bbydaycq othhexcq houseqcq textilcq furntrcq flrcvrcq majappcq smlappcq misceqcq apparcq menboycq mensixcq boyfifcq womgrlcq womsixcq grlfifcq chldrncq footwrcq othaplcq etranptc evehpurc ecartknc ecartkuc eothvehc gasmocq mainrpcq vehinscq vrntlocq pubtracq trntrpcq trnothcq healthcq hlthincq medsrvcq predrgcq medsupcq eentrmtc feeadmcq tvrdiocq pettoycq eothentc enomotrc emotrvhc eentmscc perscacq readcq educacq tobacccq emiscelc misccq misc1cq misc2cq emiscmtc cashcocq perinscq lifinscq retpencq othentcq mrtprnoc ttotalc tfoodtoc tfoodawc tfoodhoc talcbevc tothrloc ttranprc tgasmotc tvrentlc tcartrkc tothvhrc tothtrec ttrntric tfarec tairfarc tothfarc tlocaltc tentrmnc tfeesadc tothentc
gen nfamily = "6. other"
drop if fam_type == "1" | fam_type == "2" | fam_type == "3" | fam_type == "4" | fam_type == "6" | fam_type == "7"
drop if fam_size == 1
save household6, replace

}

else if part == "previous" & year < 2013 {

* Total household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "single parent w/ over 3 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size >= 4
save household15, replace

* Parent(s) with a child
use household10, replace
append using household13
replace nfamily="3. parent(s) w/ a child"
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
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "6. other"
drop if fam_type == "1" | fam_type == "2" | fam_type == "3" | fam_type == "4" | fam_type == "6" | fam_type == "7"
drop if fam_size == 1
save household6, replace

}



else if part == "previous" & year == 2013 {

* Total household
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}
 
gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "single parent w/ over 3 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size >= 4
save household15, replace

* Parent(s) with a child
use household10, replace
append using household13
replace nfamily="3. parent(s) w/ a child"
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
if quarter == "q1x" {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 fincatax etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

else {

   keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp

}

gen nfamily = "6. other"
drop if fam_type == "1" | fam_type == "2" | fam_type == "3" | fam_type == "4" | fam_type == "6" | fam_type == "7"
drop if fam_size == 1
save household6, replace

}



else {

* Total household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "0. Total household"
save household0, replace

* Single household
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "1. single household"
keep if fam_size == 1
save household1, replace

* Married couple without children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "2. married couple w/o children"
keep if fam_type == "1"
save household2, replace

* Married couple with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "married couple w/ a child"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 3
save household10, replace

* Married couple with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "married couple w/ 2 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size == 4
save household11, replace

* Married couple with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "married couple w/ over 3 children"
keep if fam_type == "2" | fam_type == "3" | fam_type == "4"
keep if fam_size >= 5
save household12, replace

* Single parent with a child
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "single parent w/ a child"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 2
save household13, replace

* Single parent with 2 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "single parent w/ 2 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size == 3
save household14, replace

* Single parent with over 3 children
use tem_age, replace
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
gen nfamily = "single parent w/ over 3 children"
keep if fam_type == "6" | fam_type == "7"
keep if fam_size >= 4
save household15, replace

* Parent(s) with a child
use household10, replace
append using household13
replace nfamily="3. parent(s) w/ a child"
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
keep part year newid inc_quantile age perslt18 no_earnr fam_type fam_size age_ref inc_rank finlwt21 finatxem etotalp foodpq fdhomepq fdawaypq fdxmappq fdmappq alcbevpq ehousngp esheltrp eowndwlp owndwepq mrtintpq proptxpq mrpinspq emrtpnop rendwepq rntxrppq rntapypq eothlodp othlodpq emrtpnvp utilpq ntlgaspq elctrcpq allfulpq fuloilpq othflspq telephpq watrpspq housoppq domsrvpq dmsxccpq bbydaypq othhexpq houseqpq textilpq furntrpq flrcvrpq majapppq smlapppq misceqpq apparpq menboypq mensixpq boyfifpq womgrlpq womsixpq grlfifpq chldrnpq footwrpq othaplpq etranptp evehpurp ecartknp ecartkup eothvehp gasmopq mainrppq vehinspq vrntlopq pubtrapq trntrppq trnothpq healthpq hlthinpq medsrvpq predrgpq medsuppq eentrmtp feeadmpq tvrdiopq pettoypq eothentp enomotrp emotrvhp eentmscp perscapq readpq educapq tobaccpq emiscelp miscpq misc1pq misc2pq emiscmtp cashcopq perinspq lifinspq retpenpq othentpq mrtprnop ttotalp tfoodtop tfoodawp tfoodhop talcbevp tothrlop ttranprp tgasmotp tvrentlp tcartrkp tothvhrp tothtrep ttrntrip tfarep tairfarp tothfarp tlocaltp tentrmnp tfeesadp tothentp
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
