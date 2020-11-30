clear all
cd D:\Data\us_consumption\major

* The period of analysis, 2006~2018, is divided into 3 groups as follows: 2006~2008, 2009, 2010~2018
* To utilize "forvalues command", the last quarter of the previous year must be combined with the 1st quarter of the following year.
* Due to the change in the after-tax income variable, 2010~2018 is divided into 2 groups: 2006~2013 Q1, 2013 Q2~2018
* If you want to see the items included in each class, refer to CEQ-inforbook.pdf found on Bureau of Labor Statistics website.

forvalues i=6/9 {

forvalues j=1/4 {

use us_mjcurclass_200`i'q`j', replace

* The categories below form a hierachy. See "ce_pumd_interview_diary_dictionary.xlsx" for further details.
* The bottom of the order consists of ucc items. You can find ucc items in mtbi data located in the intrvw folder.
* The sum of "foodcq" to "perinscq" equates the total expenses.

rename fincatax After_tax_income
rename etotalc Total_exp
rename foodcq Food
rename fdhomecq Food_home
rename fdawaycq Food_out
rename fdxmapcq Food_out_expay
rename fdmapcq Food_out_pay
rename alcbevcq Alcohol
rename ehousngc Housing
rename esheltrc Housing_shelt
rename eowndwlc Housing_shelt_own
rename owndwecq Housing_shelt_own_dwe
rename mrtintcq Housing_shelt_own_dwe_mortint
rename proptxcq Housing_shelt_own_dwe_proptax
rename mrpinscq Housing_shelt_own_dwe_maint
rename emrtpnoc Housing_shelt_own_dwe_mortprin
rename rendwecq Housing_shelt_rented
rename rntxrpcq Housing_shelt_rented_exrap
rename rntapycq Housing_shelt_rented_rap
rename eothlodc Housing_shelt_othlod
rename othlodcq Housing_shelt_othlod_exmort
rename emrtpnvc Housing_shelt_othlod_mortprin
rename utilcq Housing_util
rename ntlgascq Housing_util_natgas
rename elctrccq Housing_util_elec
rename allfulcq Housing_util_fuel
rename fuloilcq Housing_util_fuel_fueloil
rename othflscq Housing_util_fuel_others
rename telephcq Housing_util_phonesrv
rename watrpscq Housing_util_waterothpubsrv
rename housopcq Housing_op
rename domsrvcq Housing_op_domsrv
rename dmsxcccq Housing_op_domsrv_exchcare
rename bbydaycq Housing_op_domsrv_chcare
rename othhexcq Housing_op_others
rename houseqcq Housing_furn
rename textilcq Housing_furn_textiles
rename furntrcq Housing_furn_furniture
rename flrcvrcq Housing_furn_floorcov
rename majappcq Housing_furn_majapp
rename smlappcq Housing_furn_minappware
rename misceqcq Housing_furn_miscequip
rename apparcq Apparel
rename menboycq Apparel_men
rename mensixcq Apparel_men_over16
rename boyfifcq Apparel_boys
rename womgrlcq Apparel_women
rename womsixcq Apparel_women_over16
rename grlfifcq Apparel_girls
rename chldrncq Apparel_child
rename footwrcq Apparel_foot
rename othaplcq Apparel_others
rename etranptc Transp
rename evehpurc Transp_vpurc
rename ecartknc Transp_vpurc_new
rename ecartkuc Transp_vpurc_used
rename eothvehc Transp_vpurc_other
rename gasmocq Transp_gasmotoroil
rename mainrpcq Transp_maintrepairs
rename vehinscq Transp_vinsurance
rename vrntlocq Transp_rtlleaselicense
rename pubtracq Transp_puboth
rename trntrpcq Transp_puboth_trip
rename trnothcq Transp_puboth_extrip
rename healthcq Healthcare
rename hlthincq Healthcare_insurance
rename medsrvcq Healthcare_medsrv
rename predrgcq Healthcare_presdrugs
rename medsupcq Healthcare_medsupp
rename eentrmtc Enter
rename feeadmcq Enter_admissionfees
rename tvrdiocq Enter_tvradiossound
rename pettoycq Enter_petstoyspgequip
rename eothentc Enter_othsupp
rename enomotrc Enter_othsupp_nmrv
rename emotrvhc Enter_othsupp_mrv
rename eentmscc Enter_othsupp_misc
rename perscacq Personalcare
rename readcq Reading
rename educacq Education
rename tobacccq Tobacco
rename emiscelc Misc
rename misccq Misc_miscexp
rename misc1cq Misc_miscexp_1
rename misc2cq Misc_miscexp_2
rename emiscmtc Misc_othpropmortprin
rename cashcocq Contribution
rename perinscq InsurPens
rename lifinscq InsurPens_perinsur
rename retpencq InsurPens_retpenssose
rename othentcq OtherEntertainment
rename mrtprnoc Ownvachome_mortprin
rename ttotalc Trip
rename tfoodtoc Trip_food
rename tfoodawc Trip_foodontrip
rename tfoodhoc Trip_foodPrep
rename talcbevc Trip_alcohol
rename tothrloc Trip_lodging
rename ttranprc Trip_transp
rename tgasmotc Trip_transp_gas
rename tvrentlc Trip_transp_Vrtl
rename tcartrkc Trip_transp_Autortl
rename tothvhrc Trip_transp_Trrtl
rename tothtrec Trip_transp_Parktoll
rename ttrntric Trip_transp_Pub
rename tfarec Trip_transp_abts
rename tairfarc Trip_transp_air
rename tothfarc Trip_transp_bts
rename tlocaltc Trip_transp_ltransp
rename tentrmnc Trip_enter
rename tfeesadc Trip_enter_misc
rename tothentc Trip_enter_rvrtl

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen t_After_tax_income=sum(After_tax_income*weight)
by inc_quantile age nfamily: egen t_Total_exp=sum(Total_exp*weight)
by inc_quantile age nfamily: egen t_Food=sum(Food*weight)
by inc_quantile age nfamily: egen t_Food_home=sum(Food_home*weight)
by inc_quantile age nfamily: egen t_Food_out=sum(Food_out*weight)
by inc_quantile age nfamily: egen t_Food_out_expay=sum(Food_out_expay*weight)
by inc_quantile age nfamily: egen t_Food_out_pay=sum(Food_out_pay*weight)
by inc_quantile age nfamily: egen t_Alcohol=sum(Alcohol*weight)
by inc_quantile age nfamily: egen t_Housing=sum(Housing*weight)
by inc_quantile age nfamily: egen t_Housing_shelt=sum(Housing_shelt*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own=sum(Housing_shelt_own*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe=sum(Housing_shelt_own_dwe*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortint=sum(Housing_shelt_own_dwe_mortint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_proptax=sum(Housing_shelt_own_dwe_proptax*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_maint=sum(Housing_shelt_own_dwe_maint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortprin=sum(Housing_shelt_own_dwe_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented=sum(Housing_shelt_rented*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_exrap=sum(Housing_shelt_rented_exrap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_rap=sum(Housing_shelt_rented_rap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod=sum(Housing_shelt_othlod*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_exmort=sum(Housing_shelt_othlod_exmort*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_mortprin=sum(Housing_shelt_othlod_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_util=sum(Housing_util*weight)
by inc_quantile age nfamily: egen t_Housing_util_natgas=sum(Housing_util_natgas*weight)
by inc_quantile age nfamily: egen t_Housing_util_elec=sum(Housing_util_elec*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel=sum(Housing_util_fuel*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_fueloil=sum(Housing_util_fuel_fueloil*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_others=sum(Housing_util_fuel_others*weight)
by inc_quantile age nfamily: egen t_Housing_util_phonesrv=sum(Housing_util_phonesrv*weight)
by inc_quantile age nfamily: egen t_Housing_util_waterothpubsrv=sum(Housing_util_waterothpubsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op=sum(Housing_op*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv=sum(Housing_op_domsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_exchcare=sum(Housing_op_domsrv_exchcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_chcare=sum(Housing_op_domsrv_chcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_others=sum(Housing_op_others*weight)
by inc_quantile age nfamily: egen t_Housing_furn=sum(Housing_furn*weight)
by inc_quantile age nfamily: egen t_Housing_furn_textiles=sum(Housing_furn_textiles*weight)
by inc_quantile age nfamily: egen t_Housing_furn_furniture=sum(Housing_furn_furniture*weight)
by inc_quantile age nfamily: egen t_Housing_furn_floorcov=sum(Housing_furn_floorcov*weight)
by inc_quantile age nfamily: egen t_Housing_furn_majapp=sum(Housing_furn_majapp*weight)
by inc_quantile age nfamily: egen t_Housing_furn_minappware=sum(Housing_furn_minappware*weight)
by inc_quantile age nfamily: egen t_Housing_furn_miscequip=sum(Housing_furn_miscequip*weight)
by inc_quantile age nfamily: egen t_Apparel=sum(Apparel*weight)
by inc_quantile age nfamily: egen t_Apparel_men=sum(Apparel_men*weight)
by inc_quantile age nfamily: egen t_Apparel_men_over16=sum(Apparel_men_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_boys=sum(Apparel_boys*weight)
by inc_quantile age nfamily: egen t_Apparel_women=sum(Apparel_women*weight)
by inc_quantile age nfamily: egen t_Apparel_women_over16=sum(Apparel_women_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_girls=sum(Apparel_girls*weight)
by inc_quantile age nfamily: egen t_Apparel_child=sum(Apparel_child*weight)
by inc_quantile age nfamily: egen t_Apparel_foot=sum(Apparel_foot*weight)
by inc_quantile age nfamily: egen t_Apparel_others=sum(Apparel_others*weight)
by inc_quantile age nfamily: egen t_Transp=sum(Transp*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc=sum(Transp_vpurc*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_new=sum(Transp_vpurc_new*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_used=sum(Transp_vpurc_used*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_other=sum(Transp_vpurc_other*weight)
by inc_quantile age nfamily: egen t_Transp_gasmotoroil=sum(Transp_gasmotoroil*weight)
by inc_quantile age nfamily: egen t_Transp_maintrepairs=sum(Transp_maintrepairs*weight)
by inc_quantile age nfamily: egen t_Transp_vinsurance=sum(Transp_vinsurance*weight)
by inc_quantile age nfamily: egen t_Transp_rtlleaselicense=sum(Transp_rtlleaselicense*weight)
by inc_quantile age nfamily: egen t_Transp_puboth=sum(Transp_puboth*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_trip=sum(Transp_puboth_trip*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_extrip=sum(Transp_puboth_extrip*weight)
by inc_quantile age nfamily: egen t_Healthcare=sum(Healthcare*weight)
by inc_quantile age nfamily: egen t_Healthcare_insurance=sum(Healthcare_insurance*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsrv=sum(Healthcare_medsrv*weight)
by inc_quantile age nfamily: egen t_Healthcare_presdrugs=sum(Healthcare_presdrugs*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsupp=sum(Healthcare_medsupp*weight)
by inc_quantile age nfamily: egen t_Enter=sum(Enter*weight)
by inc_quantile age nfamily: egen t_Enter_admissionfees=sum(Enter_admissionfees*weight)
by inc_quantile age nfamily: egen t_Enter_tvradiossound=sum(Enter_tvradiossound*weight)
by inc_quantile age nfamily: egen t_Enter_petstoyspgequip=sum(Enter_petstoyspgequip*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp=sum(Enter_othsupp*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_nmrv=sum(Enter_othsupp_nmrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_mrv=sum(Enter_othsupp_mrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_misc=sum(Enter_othsupp_misc*weight)
by inc_quantile age nfamily: egen t_Personalcare=sum(Personalcare*weight)
by inc_quantile age nfamily: egen t_Reading=sum(Reading*weight)
by inc_quantile age nfamily: egen t_Education=sum(Education*weight)
by inc_quantile age nfamily: egen t_Tobacco=sum(Tobacco*weight)
by inc_quantile age nfamily: egen t_Misc=sum(Misc*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp=sum(Misc_miscexp*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_1=sum(Misc_miscexp_1*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_2=sum(Misc_miscexp_2*weight)
by inc_quantile age nfamily: egen t_Misc_othpropmortprin=sum(Misc_othpropmortprin*weight)
by inc_quantile age nfamily: egen t_Contribution=sum(Contribution*weight)
by inc_quantile age nfamily: egen t_InsurPens=sum(InsurPens*weight)
by inc_quantile age nfamily: egen t_InsurPens_perinsur=sum(InsurPens_perinsur*weight)
by inc_quantile age nfamily: egen t_InsurPens_retpenssose=sum(InsurPens_retpenssose*weight)
by inc_quantile age nfamily: egen t_OtherEntertainment=sum(OtherEntertainment*weight)
by inc_quantile age nfamily: egen t_Ownvachome_mortprin=sum(Ownvachome_mortprin*weight)
by inc_quantile age nfamily: egen t_Trip=sum(Trip*weight)
by inc_quantile age nfamily: egen t_Trip_food=sum(Trip_food*weight)
by inc_quantile age nfamily: egen t_Trip_foodontrip=sum(Trip_foodontrip*weight)
by inc_quantile age nfamily: egen t_Trip_foodPrep=sum(Trip_foodPrep*weight)
by inc_quantile age nfamily: egen t_Trip_alcohol=sum(Trip_alcohol*weight)
by inc_quantile age nfamily: egen t_Trip_lodging=sum(Trip_lodging*weight)
by inc_quantile age nfamily: egen t_Trip_transp=sum(Trip_transp*weight)
by inc_quantile age nfamily: egen t_Trip_transp_gas=sum(Trip_transp_gas*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Vrtl=sum(Trip_transp_Vrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Autortl=sum(Trip_transp_Autortl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Trrtl=sum(Trip_transp_Trrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Parktoll=sum(Trip_transp_Parktoll*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Pub=sum(Trip_transp_Pub*weight)
by inc_quantile age nfamily: egen t_Trip_transp_abts=sum(Trip_transp_abts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_air=sum(Trip_transp_air*weight)
by inc_quantile age nfamily: egen t_Trip_transp_bts=sum(Trip_transp_bts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_ltransp=sum(Trip_transp_ltransp*weight)
by inc_quantile age nfamily: egen t_Trip_enter=sum(Trip_enter*weight)
by inc_quantile age nfamily: egen t_Trip_enter_misc=sum(Trip_enter_misc*weight)
by inc_quantile age nfamily: egen t_Trip_enter_rvrtl=sum(Trip_enter_rvrtl*weight)

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_After_tax_income t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl

save us_consumption_mjcurclass_200`i'q`j', replace

}



forvalues j=1/4 {

use us_mjpreclass_200`i'q`j', replace

rename fincatax After_tax_income
rename etotalp Total_exp
rename foodpq Food
rename fdhomepq Food_home
rename fdawaypq Food_out
rename fdxmappq Food_out_expay
rename fdmappq Food_out_pay
rename alcbevpq Alcohol
rename ehousngp Housing
rename esheltrp Housing_shelt
rename eowndwlp Housing_shelt_own
rename owndwepq Housing_shelt_own_dwe
rename mrtintpq Housing_shelt_own_dwe_mortint
rename proptxpq Housing_shelt_own_dwe_proptax
rename mrpinspq Housing_shelt_own_dwe_maint
rename emrtpnop Housing_shelt_own_dwe_mortprin
rename rendwepq Housing_shelt_rented
rename rntxrppq Housing_shelt_rented_exrap
rename rntapypq Housing_shelt_rented_rap
rename eothlodp Housing_shelt_othlod
rename othlodpq Housing_shelt_othlod_exmort
rename emrtpnvp Housing_shelt_othlod_mortprin
rename utilpq Housing_util
rename ntlgaspq Housing_util_natgas
rename elctrcpq Housing_util_elec
rename allfulpq Housing_util_fuel
rename fuloilpq Housing_util_fuel_fueloil
rename othflspq Housing_util_fuel_others
rename telephpq Housing_util_phonesrv
rename watrpspq Housing_util_waterothpubsrv
rename housoppq Housing_op
rename domsrvpq Housing_op_domsrv
rename dmsxccpq Housing_op_domsrv_exchcare
rename bbydaypq Housing_op_domsrv_chcare
rename othhexpq Housing_op_others
rename houseqpq Housing_furn
rename textilpq Housing_furn_textiles
rename furntrpq Housing_furn_furniture
rename flrcvrpq Housing_furn_floorcov
rename majapppq Housing_furn_majapp
rename smlapppq Housing_furn_minappware
rename misceqpq Housing_furn_miscequip
rename apparpq Apparel
rename menboypq Apparel_men
rename mensixpq Apparel_men_over16
rename boyfifpq Apparel_boys
rename womgrlpq Apparel_women
rename womsixpq Apparel_women_over16
rename grlfifpq Apparel_girls
rename chldrnpq Apparel_child
rename footwrpq Apparel_foot
rename othaplpq Apparel_others
rename etranptp Transp
rename evehpurp Transp_vpurc
rename ecartknp Transp_vpurc_new
rename ecartkup Transp_vpurc_used
rename eothvehp Transp_vpurc_other
rename gasmopq Transp_gasmotoroil
rename mainrppq Transp_maintrepairs
rename vehinspq Transp_vinsurance
rename vrntlopq Transp_rtlleaselicense
rename pubtrapq Transp_puboth
rename trntrppq Transp_puboth_trip
rename trnothpq Transp_puboth_extrip
rename healthpq Healthcare
rename hlthinpq Healthcare_insurance
rename medsrvpq Healthcare_medsrv
rename predrgpq Healthcare_presdrugs
rename medsuppq Healthcare_medsupp
rename eentrmtp Enter
rename feeadmpq Enter_admissionfees
rename tvrdiopq Enter_tvradiossound
rename pettoypq Enter_petstoyspgequip
rename eothentp Enter_othsupp
rename enomotrp Enter_othsupp_nmrv
rename emotrvhp Enter_othsupp_mrv
rename eentmscp Enter_othsupp_misc
rename perscapq Personalcare
rename readpq Reading
rename educapq Education
rename tobaccpq Tobacco
rename emiscelp Misc
rename miscpq Misc_miscexp
rename misc1pq Misc_miscexp_1
rename misc2pq Misc_miscexp_2
rename emiscmtp Misc_othpropmortprin
rename cashcopq Contribution
rename perinspq InsurPens
rename lifinspq InsurPens_perinsur
rename retpenpq InsurPens_retpenssose
rename othentpq OtherEntertainment
rename mrtprnop Ownvachome_mortprin
rename ttotalp Trip
rename tfoodtop Trip_food
rename tfoodawp Trip_foodontrip
rename tfoodhop Trip_foodPrep
rename talcbevp Trip_alcohol
rename tothrlop Trip_lodging
rename ttranprp Trip_transp
rename tgasmotp Trip_transp_gas
rename tvrentlp Trip_transp_Vrtl
rename tcartrkp Trip_transp_Autortl
rename tothvhrp Trip_transp_Trrtl
rename tothtrep Trip_transp_Parktoll
rename ttrntrip Trip_transp_Pub
rename tfarep Trip_transp_abts
rename tairfarp Trip_transp_air
rename tothfarp Trip_transp_bts
rename tlocaltp Trip_transp_ltransp
rename tentrmnp Trip_enter
rename tfeesadp Trip_enter_misc
rename tothentp Trip_enter_rvrtl

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen t_After_tax_income=sum(After_tax_income*weight)
by inc_quantile age nfamily: egen t_Total_exp=sum(Total_exp*weight)
by inc_quantile age nfamily: egen t_Food=sum(Food*weight)
by inc_quantile age nfamily: egen t_Food_home=sum(Food_home*weight)
by inc_quantile age nfamily: egen t_Food_out=sum(Food_out*weight)
by inc_quantile age nfamily: egen t_Food_out_expay=sum(Food_out_expay*weight)
by inc_quantile age nfamily: egen t_Food_out_pay=sum(Food_out_pay*weight)
by inc_quantile age nfamily: egen t_Alcohol=sum(Alcohol*weight)
by inc_quantile age nfamily: egen t_Housing=sum(Housing*weight)
by inc_quantile age nfamily: egen t_Housing_shelt=sum(Housing_shelt*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own=sum(Housing_shelt_own*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe=sum(Housing_shelt_own_dwe*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortint=sum(Housing_shelt_own_dwe_mortint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_proptax=sum(Housing_shelt_own_dwe_proptax*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_maint=sum(Housing_shelt_own_dwe_maint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortprin=sum(Housing_shelt_own_dwe_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented=sum(Housing_shelt_rented*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_exrap=sum(Housing_shelt_rented_exrap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_rap=sum(Housing_shelt_rented_rap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod=sum(Housing_shelt_othlod*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_exmort=sum(Housing_shelt_othlod_exmort*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_mortprin=sum(Housing_shelt_othlod_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_util=sum(Housing_util*weight)
by inc_quantile age nfamily: egen t_Housing_util_natgas=sum(Housing_util_natgas*weight)
by inc_quantile age nfamily: egen t_Housing_util_elec=sum(Housing_util_elec*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel=sum(Housing_util_fuel*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_fueloil=sum(Housing_util_fuel_fueloil*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_others=sum(Housing_util_fuel_others*weight)
by inc_quantile age nfamily: egen t_Housing_util_phonesrv=sum(Housing_util_phonesrv*weight)
by inc_quantile age nfamily: egen t_Housing_util_waterothpubsrv=sum(Housing_util_waterothpubsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op=sum(Housing_op*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv=sum(Housing_op_domsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_exchcare=sum(Housing_op_domsrv_exchcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_chcare=sum(Housing_op_domsrv_chcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_others=sum(Housing_op_others*weight)
by inc_quantile age nfamily: egen t_Housing_furn=sum(Housing_furn*weight)
by inc_quantile age nfamily: egen t_Housing_furn_textiles=sum(Housing_furn_textiles*weight)
by inc_quantile age nfamily: egen t_Housing_furn_furniture=sum(Housing_furn_furniture*weight)
by inc_quantile age nfamily: egen t_Housing_furn_floorcov=sum(Housing_furn_floorcov*weight)
by inc_quantile age nfamily: egen t_Housing_furn_majapp=sum(Housing_furn_majapp*weight)
by inc_quantile age nfamily: egen t_Housing_furn_minappware=sum(Housing_furn_minappware*weight)
by inc_quantile age nfamily: egen t_Housing_furn_miscequip=sum(Housing_furn_miscequip*weight)
by inc_quantile age nfamily: egen t_Apparel=sum(Apparel*weight)
by inc_quantile age nfamily: egen t_Apparel_men=sum(Apparel_men*weight)
by inc_quantile age nfamily: egen t_Apparel_men_over16=sum(Apparel_men_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_boys=sum(Apparel_boys*weight)
by inc_quantile age nfamily: egen t_Apparel_women=sum(Apparel_women*weight)
by inc_quantile age nfamily: egen t_Apparel_women_over16=sum(Apparel_women_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_girls=sum(Apparel_girls*weight)
by inc_quantile age nfamily: egen t_Apparel_child=sum(Apparel_child*weight)
by inc_quantile age nfamily: egen t_Apparel_foot=sum(Apparel_foot*weight)
by inc_quantile age nfamily: egen t_Apparel_others=sum(Apparel_others*weight)
by inc_quantile age nfamily: egen t_Transp=sum(Transp*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc=sum(Transp_vpurc*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_new=sum(Transp_vpurc_new*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_used=sum(Transp_vpurc_used*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_other=sum(Transp_vpurc_other*weight)
by inc_quantile age nfamily: egen t_Transp_gasmotoroil=sum(Transp_gasmotoroil*weight)
by inc_quantile age nfamily: egen t_Transp_maintrepairs=sum(Transp_maintrepairs*weight)
by inc_quantile age nfamily: egen t_Transp_vinsurance=sum(Transp_vinsurance*weight)
by inc_quantile age nfamily: egen t_Transp_rtlleaselicense=sum(Transp_rtlleaselicense*weight)
by inc_quantile age nfamily: egen t_Transp_puboth=sum(Transp_puboth*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_trip=sum(Transp_puboth_trip*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_extrip=sum(Transp_puboth_extrip*weight)
by inc_quantile age nfamily: egen t_Healthcare=sum(Healthcare*weight)
by inc_quantile age nfamily: egen t_Healthcare_insurance=sum(Healthcare_insurance*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsrv=sum(Healthcare_medsrv*weight)
by inc_quantile age nfamily: egen t_Healthcare_presdrugs=sum(Healthcare_presdrugs*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsupp=sum(Healthcare_medsupp*weight)
by inc_quantile age nfamily: egen t_Enter=sum(Enter*weight)
by inc_quantile age nfamily: egen t_Enter_admissionfees=sum(Enter_admissionfees*weight)
by inc_quantile age nfamily: egen t_Enter_tvradiossound=sum(Enter_tvradiossound*weight)
by inc_quantile age nfamily: egen t_Enter_petstoyspgequip=sum(Enter_petstoyspgequip*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp=sum(Enter_othsupp*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_nmrv=sum(Enter_othsupp_nmrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_mrv=sum(Enter_othsupp_mrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_misc=sum(Enter_othsupp_misc*weight)
by inc_quantile age nfamily: egen t_Personalcare=sum(Personalcare*weight)
by inc_quantile age nfamily: egen t_Reading=sum(Reading*weight)
by inc_quantile age nfamily: egen t_Education=sum(Education*weight)
by inc_quantile age nfamily: egen t_Tobacco=sum(Tobacco*weight)
by inc_quantile age nfamily: egen t_Misc=sum(Misc*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp=sum(Misc_miscexp*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_1=sum(Misc_miscexp_1*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_2=sum(Misc_miscexp_2*weight)
by inc_quantile age nfamily: egen t_Misc_othpropmortprin=sum(Misc_othpropmortprin*weight)
by inc_quantile age nfamily: egen t_Contribution=sum(Contribution*weight)
by inc_quantile age nfamily: egen t_InsurPens=sum(InsurPens*weight)
by inc_quantile age nfamily: egen t_InsurPens_perinsur=sum(InsurPens_perinsur*weight)
by inc_quantile age nfamily: egen t_InsurPens_retpenssose=sum(InsurPens_retpenssose*weight)
by inc_quantile age nfamily: egen t_OtherEntertainment=sum(OtherEntertainment*weight)
by inc_quantile age nfamily: egen t_Ownvachome_mortprin=sum(Ownvachome_mortprin*weight)
by inc_quantile age nfamily: egen t_Trip=sum(Trip*weight)
by inc_quantile age nfamily: egen t_Trip_food=sum(Trip_food*weight)
by inc_quantile age nfamily: egen t_Trip_foodontrip=sum(Trip_foodontrip*weight)
by inc_quantile age nfamily: egen t_Trip_foodPrep=sum(Trip_foodPrep*weight)
by inc_quantile age nfamily: egen t_Trip_alcohol=sum(Trip_alcohol*weight)
by inc_quantile age nfamily: egen t_Trip_lodging=sum(Trip_lodging*weight)
by inc_quantile age nfamily: egen t_Trip_transp=sum(Trip_transp*weight)
by inc_quantile age nfamily: egen t_Trip_transp_gas=sum(Trip_transp_gas*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Vrtl=sum(Trip_transp_Vrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Autortl=sum(Trip_transp_Autortl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Trrtl=sum(Trip_transp_Trrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Parktoll=sum(Trip_transp_Parktoll*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Pub=sum(Trip_transp_Pub*weight)
by inc_quantile age nfamily: egen t_Trip_transp_abts=sum(Trip_transp_abts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_air=sum(Trip_transp_air*weight)
by inc_quantile age nfamily: egen t_Trip_transp_bts=sum(Trip_transp_bts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_ltransp=sum(Trip_transp_ltransp*weight)
by inc_quantile age nfamily: egen t_Trip_enter=sum(Trip_enter*weight)
by inc_quantile age nfamily: egen t_Trip_enter_misc=sum(Trip_enter_misc*weight)
by inc_quantile age nfamily: egen t_Trip_enter_rvrtl=sum(Trip_enter_rvrtl*weight)

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_After_tax_income t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl

save us_consumption_mjpreclass_200`i'q`j', replace

use us_consumption_mjcurclass_200`i'q`j', replace

append using us_consumption_mjpreclass_200`i'q`j'

collapse (mean) t_After_tax_income (sum) t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl, by(inc_quantile age nfamily)

gen qyear="200`i'q`j'"
move qyear inc_quantile

save us_consumption_mjclass_200`i'q`j', replace

}

}



********************************************************************************



forvalues i=10/18 {


forvalues j=1/4 {

use us_mjcurclass_20`i'q`j', replace

* Due to the change in after-tax income variable, I utilized if command to distinguish the period ended in 2013 Q1 from the post 2013 Q1.

if `j'==1 {

   if `i'<14 {

   rename fincatax After_tax_income

   
   }
   
   else {
   
   rename finatxem After_tax_income
   
   }

}

else {

   if `i'<13 {
   
   rename fincatax After_tax_income
   
   }
      
   else {
   
   rename finatxem After_tax_income
   
   }
   
}

rename etotalc Total_exp
rename foodcq Food
rename fdhomecq Food_home
rename fdawaycq Food_out
rename fdxmapcq Food_out_expay
rename fdmapcq Food_out_pay
rename alcbevcq Alcohol
rename ehousngc Housing
rename esheltrc Housing_shelt
rename eowndwlc Housing_shelt_own
rename owndwecq Housing_shelt_own_dwe
rename mrtintcq Housing_shelt_own_dwe_mortint
rename proptxcq Housing_shelt_own_dwe_proptax
rename mrpinscq Housing_shelt_own_dwe_maint
rename emrtpnoc Housing_shelt_own_dwe_mortprin
rename rendwecq Housing_shelt_rented
rename rntxrpcq Housing_shelt_rented_exrap
rename rntapycq Housing_shelt_rented_rap
rename eothlodc Housing_shelt_othlod
rename othlodcq Housing_shelt_othlod_exmort
rename emrtpnvc Housing_shelt_othlod_mortprin
rename utilcq Housing_util
rename ntlgascq Housing_util_natgas
rename elctrccq Housing_util_elec
rename allfulcq Housing_util_fuel
rename fuloilcq Housing_util_fuel_fueloil
rename othflscq Housing_util_fuel_others
rename telephcq Housing_util_phonesrv
rename watrpscq Housing_util_waterothpubsrv
rename housopcq Housing_op
rename domsrvcq Housing_op_domsrv
rename dmsxcccq Housing_op_domsrv_exchcare
rename bbydaycq Housing_op_domsrv_chcare
rename othhexcq Housing_op_others
rename houseqcq Housing_furn
rename textilcq Housing_furn_textiles
rename furntrcq Housing_furn_furniture
rename flrcvrcq Housing_furn_floorcov
rename majappcq Housing_furn_majapp
rename smlappcq Housing_furn_minappware
rename misceqcq Housing_furn_miscequip
rename apparcq Apparel
rename menboycq Apparel_men
rename mensixcq Apparel_men_over16
rename boyfifcq Apparel_boys
rename womgrlcq Apparel_women
rename womsixcq Apparel_women_over16
rename grlfifcq Apparel_girls
rename chldrncq Apparel_child
rename footwrcq Apparel_foot
rename othaplcq Apparel_others
rename etranptc Transp
rename evehpurc Transp_vpurc
rename ecartknc Transp_vpurc_new
rename ecartkuc Transp_vpurc_used
rename eothvehc Transp_vpurc_other
rename gasmocq Transp_gasmotoroil
rename mainrpcq Transp_maintrepairs
rename vehinscq Transp_vinsurance
rename vrntlocq Transp_rtlleaselicense
rename pubtracq Transp_puboth
rename trntrpcq Transp_puboth_trip
rename trnothcq Transp_puboth_extrip
rename healthcq Healthcare
rename hlthincq Healthcare_insurance
rename medsrvcq Healthcare_medsrv
rename predrgcq Healthcare_presdrugs
rename medsupcq Healthcare_medsupp
rename eentrmtc Enter
rename feeadmcq Enter_admissionfees
rename tvrdiocq Enter_tvradiossound
rename pettoycq Enter_petstoyspgequip
rename eothentc Enter_othsupp
rename enomotrc Enter_othsupp_nmrv
rename emotrvhc Enter_othsupp_mrv
rename eentmscc Enter_othsupp_misc
rename perscacq Personalcare
rename readcq Reading
rename educacq Education
rename tobacccq Tobacco
rename emiscelc Misc
rename misccq Misc_miscexp
rename misc1cq Misc_miscexp_1
rename misc2cq Misc_miscexp_2
rename emiscmtc Misc_othpropmortprin
rename cashcocq Contribution
rename perinscq InsurPens
rename lifinscq InsurPens_perinsur
rename retpencq InsurPens_retpenssose
rename othentcq OtherEntertainment
rename mrtprnoc Ownvachome_mortprin
rename ttotalc Trip
rename tfoodtoc Trip_food
rename tfoodawc Trip_foodontrip
rename tfoodhoc Trip_foodPrep
rename talcbevc Trip_alcohol
rename tothrloc Trip_lodging
rename ttranprc Trip_transp
rename tgasmotc Trip_transp_gas
rename tvrentlc Trip_transp_Vrtl
rename tcartrkc Trip_transp_Autortl
rename tothvhrc Trip_transp_Trrtl
rename tothtrec Trip_transp_Parktoll
rename ttrntric Trip_transp_Pub
rename tfarec Trip_transp_abts
rename tairfarc Trip_transp_air
rename tothfarc Trip_transp_bts
rename tlocaltc Trip_transp_ltransp
rename tentrmnc Trip_enter
rename tfeesadc Trip_enter_misc
rename tothentc Trip_enter_rvrtl

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen t_After_tax_income=sum(After_tax_income*weight)
by inc_quantile age nfamily: egen t_Total_exp=sum(Total_exp*weight)
by inc_quantile age nfamily: egen t_Food=sum(Food*weight)
by inc_quantile age nfamily: egen t_Food_home=sum(Food_home*weight)
by inc_quantile age nfamily: egen t_Food_out=sum(Food_out*weight)
by inc_quantile age nfamily: egen t_Food_out_expay=sum(Food_out_expay*weight)
by inc_quantile age nfamily: egen t_Food_out_pay=sum(Food_out_pay*weight)
by inc_quantile age nfamily: egen t_Alcohol=sum(Alcohol*weight)
by inc_quantile age nfamily: egen t_Housing=sum(Housing*weight)
by inc_quantile age nfamily: egen t_Housing_shelt=sum(Housing_shelt*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own=sum(Housing_shelt_own*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe=sum(Housing_shelt_own_dwe*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortint=sum(Housing_shelt_own_dwe_mortint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_proptax=sum(Housing_shelt_own_dwe_proptax*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_maint=sum(Housing_shelt_own_dwe_maint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortprin=sum(Housing_shelt_own_dwe_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented=sum(Housing_shelt_rented*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_exrap=sum(Housing_shelt_rented_exrap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_rap=sum(Housing_shelt_rented_rap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod=sum(Housing_shelt_othlod*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_exmort=sum(Housing_shelt_othlod_exmort*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_mortprin=sum(Housing_shelt_othlod_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_util=sum(Housing_util*weight)
by inc_quantile age nfamily: egen t_Housing_util_natgas=sum(Housing_util_natgas*weight)
by inc_quantile age nfamily: egen t_Housing_util_elec=sum(Housing_util_elec*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel=sum(Housing_util_fuel*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_fueloil=sum(Housing_util_fuel_fueloil*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_others=sum(Housing_util_fuel_others*weight)
by inc_quantile age nfamily: egen t_Housing_util_phonesrv=sum(Housing_util_phonesrv*weight)
by inc_quantile age nfamily: egen t_Housing_util_waterothpubsrv=sum(Housing_util_waterothpubsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op=sum(Housing_op*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv=sum(Housing_op_domsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_exchcare=sum(Housing_op_domsrv_exchcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_chcare=sum(Housing_op_domsrv_chcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_others=sum(Housing_op_others*weight)
by inc_quantile age nfamily: egen t_Housing_furn=sum(Housing_furn*weight)
by inc_quantile age nfamily: egen t_Housing_furn_textiles=sum(Housing_furn_textiles*weight)
by inc_quantile age nfamily: egen t_Housing_furn_furniture=sum(Housing_furn_furniture*weight)
by inc_quantile age nfamily: egen t_Housing_furn_floorcov=sum(Housing_furn_floorcov*weight)
by inc_quantile age nfamily: egen t_Housing_furn_majapp=sum(Housing_furn_majapp*weight)
by inc_quantile age nfamily: egen t_Housing_furn_minappware=sum(Housing_furn_minappware*weight)
by inc_quantile age nfamily: egen t_Housing_furn_miscequip=sum(Housing_furn_miscequip*weight)
by inc_quantile age nfamily: egen t_Apparel=sum(Apparel*weight)
by inc_quantile age nfamily: egen t_Apparel_men=sum(Apparel_men*weight)
by inc_quantile age nfamily: egen t_Apparel_men_over16=sum(Apparel_men_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_boys=sum(Apparel_boys*weight)
by inc_quantile age nfamily: egen t_Apparel_women=sum(Apparel_women*weight)
by inc_quantile age nfamily: egen t_Apparel_women_over16=sum(Apparel_women_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_girls=sum(Apparel_girls*weight)
by inc_quantile age nfamily: egen t_Apparel_child=sum(Apparel_child*weight)
by inc_quantile age nfamily: egen t_Apparel_foot=sum(Apparel_foot*weight)
by inc_quantile age nfamily: egen t_Apparel_others=sum(Apparel_others*weight)
by inc_quantile age nfamily: egen t_Transp=sum(Transp*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc=sum(Transp_vpurc*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_new=sum(Transp_vpurc_new*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_used=sum(Transp_vpurc_used*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_other=sum(Transp_vpurc_other*weight)
by inc_quantile age nfamily: egen t_Transp_gasmotoroil=sum(Transp_gasmotoroil*weight)
by inc_quantile age nfamily: egen t_Transp_maintrepairs=sum(Transp_maintrepairs*weight)
by inc_quantile age nfamily: egen t_Transp_vinsurance=sum(Transp_vinsurance*weight)
by inc_quantile age nfamily: egen t_Transp_rtlleaselicense=sum(Transp_rtlleaselicense*weight)
by inc_quantile age nfamily: egen t_Transp_puboth=sum(Transp_puboth*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_trip=sum(Transp_puboth_trip*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_extrip=sum(Transp_puboth_extrip*weight)
by inc_quantile age nfamily: egen t_Healthcare=sum(Healthcare*weight)
by inc_quantile age nfamily: egen t_Healthcare_insurance=sum(Healthcare_insurance*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsrv=sum(Healthcare_medsrv*weight)
by inc_quantile age nfamily: egen t_Healthcare_presdrugs=sum(Healthcare_presdrugs*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsupp=sum(Healthcare_medsupp*weight)
by inc_quantile age nfamily: egen t_Enter=sum(Enter*weight)
by inc_quantile age nfamily: egen t_Enter_admissionfees=sum(Enter_admissionfees*weight)
by inc_quantile age nfamily: egen t_Enter_tvradiossound=sum(Enter_tvradiossound*weight)
by inc_quantile age nfamily: egen t_Enter_petstoyspgequip=sum(Enter_petstoyspgequip*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp=sum(Enter_othsupp*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_nmrv=sum(Enter_othsupp_nmrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_mrv=sum(Enter_othsupp_mrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_misc=sum(Enter_othsupp_misc*weight)
by inc_quantile age nfamily: egen t_Personalcare=sum(Personalcare*weight)
by inc_quantile age nfamily: egen t_Reading=sum(Reading*weight)
by inc_quantile age nfamily: egen t_Education=sum(Education*weight)
by inc_quantile age nfamily: egen t_Tobacco=sum(Tobacco*weight)
by inc_quantile age nfamily: egen t_Misc=sum(Misc*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp=sum(Misc_miscexp*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_1=sum(Misc_miscexp_1*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_2=sum(Misc_miscexp_2*weight)
by inc_quantile age nfamily: egen t_Misc_othpropmortprin=sum(Misc_othpropmortprin*weight)
by inc_quantile age nfamily: egen t_Contribution=sum(Contribution*weight)
by inc_quantile age nfamily: egen t_InsurPens=sum(InsurPens*weight)
by inc_quantile age nfamily: egen t_InsurPens_perinsur=sum(InsurPens_perinsur*weight)
by inc_quantile age nfamily: egen t_InsurPens_retpenssose=sum(InsurPens_retpenssose*weight)
by inc_quantile age nfamily: egen t_OtherEntertainment=sum(OtherEntertainment*weight)
by inc_quantile age nfamily: egen t_Ownvachome_mortprin=sum(Ownvachome_mortprin*weight)
by inc_quantile age nfamily: egen t_Trip=sum(Trip*weight)
by inc_quantile age nfamily: egen t_Trip_food=sum(Trip_food*weight)
by inc_quantile age nfamily: egen t_Trip_foodontrip=sum(Trip_foodontrip*weight)
by inc_quantile age nfamily: egen t_Trip_foodPrep=sum(Trip_foodPrep*weight)
by inc_quantile age nfamily: egen t_Trip_alcohol=sum(Trip_alcohol*weight)
by inc_quantile age nfamily: egen t_Trip_lodging=sum(Trip_lodging*weight)
by inc_quantile age nfamily: egen t_Trip_transp=sum(Trip_transp*weight)
by inc_quantile age nfamily: egen t_Trip_transp_gas=sum(Trip_transp_gas*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Vrtl=sum(Trip_transp_Vrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Autortl=sum(Trip_transp_Autortl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Trrtl=sum(Trip_transp_Trrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Parktoll=sum(Trip_transp_Parktoll*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Pub=sum(Trip_transp_Pub*weight)
by inc_quantile age nfamily: egen t_Trip_transp_abts=sum(Trip_transp_abts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_air=sum(Trip_transp_air*weight)
by inc_quantile age nfamily: egen t_Trip_transp_bts=sum(Trip_transp_bts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_ltransp=sum(Trip_transp_ltransp*weight)
by inc_quantile age nfamily: egen t_Trip_enter=sum(Trip_enter*weight)
by inc_quantile age nfamily: egen t_Trip_enter_misc=sum(Trip_enter_misc*weight)
by inc_quantile age nfamily: egen t_Trip_enter_rvrtl=sum(Trip_enter_rvrtl*weight)

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_After_tax_income t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl

save us_consumption_mjcurclass_20`i'q`j', replace

}



forvalues j=1/4 {

use us_mjpreclass_20`i'q`j', replace

* Due to the change in after-tax income variable, I utilized if command to distinguish the period ended in 2013 Q1 from the post 2013 Q1.

if `i'<13 {

   rename fincatax After_tax_income
}

else {

   rename finatxem After_tax_income

}

rename etotalp Total_exp
rename foodpq Food
rename fdhomepq Food_home
rename fdawaypq Food_out
rename fdxmappq Food_out_expay
rename fdmappq Food_out_pay
rename alcbevpq Alcohol
rename ehousngp Housing
rename esheltrp Housing_shelt
rename eowndwlp Housing_shelt_own
rename owndwepq Housing_shelt_own_dwe
rename mrtintpq Housing_shelt_own_dwe_mortint
rename proptxpq Housing_shelt_own_dwe_proptax
rename mrpinspq Housing_shelt_own_dwe_maint
rename emrtpnop Housing_shelt_own_dwe_mortprin
rename rendwepq Housing_shelt_rented
rename rntxrppq Housing_shelt_rented_exrap
rename rntapypq Housing_shelt_rented_rap
rename eothlodp Housing_shelt_othlod
rename othlodpq Housing_shelt_othlod_exmort
rename emrtpnvp Housing_shelt_othlod_mortprin
rename utilpq Housing_util
rename ntlgaspq Housing_util_natgas
rename elctrcpq Housing_util_elec
rename allfulpq Housing_util_fuel
rename fuloilpq Housing_util_fuel_fueloil
rename othflspq Housing_util_fuel_others
rename telephpq Housing_util_phonesrv
rename watrpspq Housing_util_waterothpubsrv
rename housoppq Housing_op
rename domsrvpq Housing_op_domsrv
rename dmsxccpq Housing_op_domsrv_exchcare
rename bbydaypq Housing_op_domsrv_chcare
rename othhexpq Housing_op_others
rename houseqpq Housing_furn
rename textilpq Housing_furn_textiles
rename furntrpq Housing_furn_furniture
rename flrcvrpq Housing_furn_floorcov
rename majapppq Housing_furn_majapp
rename smlapppq Housing_furn_minappware
rename misceqpq Housing_furn_miscequip
rename apparpq Apparel
rename menboypq Apparel_men
rename mensixpq Apparel_men_over16
rename boyfifpq Apparel_boys
rename womgrlpq Apparel_women
rename womsixpq Apparel_women_over16
rename grlfifpq Apparel_girls
rename chldrnpq Apparel_child
rename footwrpq Apparel_foot
rename othaplpq Apparel_others
rename etranptp Transp
rename evehpurp Transp_vpurc
rename ecartknp Transp_vpurc_new
rename ecartkup Transp_vpurc_used
rename eothvehp Transp_vpurc_other
rename gasmopq Transp_gasmotoroil
rename mainrppq Transp_maintrepairs
rename vehinspq Transp_vinsurance
rename vrntlopq Transp_rtlleaselicense
rename pubtrapq Transp_puboth
rename trntrppq Transp_puboth_trip
rename trnothpq Transp_puboth_extrip
rename healthpq Healthcare
rename hlthinpq Healthcare_insurance
rename medsrvpq Healthcare_medsrv
rename predrgpq Healthcare_presdrugs
rename medsuppq Healthcare_medsupp
rename eentrmtp Enter
rename feeadmpq Enter_admissionfees
rename tvrdiopq Enter_tvradiossound
rename pettoypq Enter_petstoyspgequip
rename eothentp Enter_othsupp
rename enomotrp Enter_othsupp_nmrv
rename emotrvhp Enter_othsupp_mrv
rename eentmscp Enter_othsupp_misc
rename perscapq Personalcare
rename readpq Reading
rename educapq Education
rename tobaccpq Tobacco
rename emiscelp Misc
rename miscpq Misc_miscexp
rename misc1pq Misc_miscexp_1
rename misc2pq Misc_miscexp_2
rename emiscmtp Misc_othpropmortprin
rename cashcopq Contribution
rename perinspq InsurPens
rename lifinspq InsurPens_perinsur
rename retpenpq InsurPens_retpenssose
rename othentpq OtherEntertainment
rename mrtprnop Ownvachome_mortprin
rename ttotalp Trip
rename tfoodtop Trip_food
rename tfoodawp Trip_foodontrip
rename tfoodhop Trip_foodPrep
rename talcbevp Trip_alcohol
rename tothrlop Trip_lodging
rename ttranprp Trip_transp
rename tgasmotp Trip_transp_gas
rename tvrentlp Trip_transp_Vrtl
rename tcartrkp Trip_transp_Autortl
rename tothvhrp Trip_transp_Trrtl
rename tothtrep Trip_transp_Parktoll
rename ttrntrip Trip_transp_Pub
rename tfarep Trip_transp_abts
rename tairfarp Trip_transp_air
rename tothfarp Trip_transp_bts
rename tlocaltp Trip_transp_ltransp
rename tentrmnp Trip_enter
rename tfeesadp Trip_enter_misc
rename tothentp Trip_enter_rvrtl

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen sumweight=sum(finlwt21)
gen weight=finlwt21/sumweight

sort inc_quantile age nfamily
by inc_quantile age nfamily: egen t_After_tax_income=sum(After_tax_income*weight)
by inc_quantile age nfamily: egen t_Total_exp=sum(Total_exp*weight)
by inc_quantile age nfamily: egen t_Food=sum(Food*weight)
by inc_quantile age nfamily: egen t_Food_home=sum(Food_home*weight)
by inc_quantile age nfamily: egen t_Food_out=sum(Food_out*weight)
by inc_quantile age nfamily: egen t_Food_out_expay=sum(Food_out_expay*weight)
by inc_quantile age nfamily: egen t_Food_out_pay=sum(Food_out_pay*weight)
by inc_quantile age nfamily: egen t_Alcohol=sum(Alcohol*weight)
by inc_quantile age nfamily: egen t_Housing=sum(Housing*weight)
by inc_quantile age nfamily: egen t_Housing_shelt=sum(Housing_shelt*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own=sum(Housing_shelt_own*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe=sum(Housing_shelt_own_dwe*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortint=sum(Housing_shelt_own_dwe_mortint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_proptax=sum(Housing_shelt_own_dwe_proptax*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_maint=sum(Housing_shelt_own_dwe_maint*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_own_dwe_mortprin=sum(Housing_shelt_own_dwe_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented=sum(Housing_shelt_rented*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_exrap=sum(Housing_shelt_rented_exrap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_rented_rap=sum(Housing_shelt_rented_rap*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod=sum(Housing_shelt_othlod*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_exmort=sum(Housing_shelt_othlod_exmort*weight)
by inc_quantile age nfamily: egen t_Housing_shelt_othlod_mortprin=sum(Housing_shelt_othlod_mortprin*weight)
by inc_quantile age nfamily: egen t_Housing_util=sum(Housing_util*weight)
by inc_quantile age nfamily: egen t_Housing_util_natgas=sum(Housing_util_natgas*weight)
by inc_quantile age nfamily: egen t_Housing_util_elec=sum(Housing_util_elec*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel=sum(Housing_util_fuel*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_fueloil=sum(Housing_util_fuel_fueloil*weight)
by inc_quantile age nfamily: egen t_Housing_util_fuel_others=sum(Housing_util_fuel_others*weight)
by inc_quantile age nfamily: egen t_Housing_util_phonesrv=sum(Housing_util_phonesrv*weight)
by inc_quantile age nfamily: egen t_Housing_util_waterothpubsrv=sum(Housing_util_waterothpubsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op=sum(Housing_op*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv=sum(Housing_op_domsrv*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_exchcare=sum(Housing_op_domsrv_exchcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_domsrv_chcare=sum(Housing_op_domsrv_chcare*weight)
by inc_quantile age nfamily: egen t_Housing_op_others=sum(Housing_op_others*weight)
by inc_quantile age nfamily: egen t_Housing_furn=sum(Housing_furn*weight)
by inc_quantile age nfamily: egen t_Housing_furn_textiles=sum(Housing_furn_textiles*weight)
by inc_quantile age nfamily: egen t_Housing_furn_furniture=sum(Housing_furn_furniture*weight)
by inc_quantile age nfamily: egen t_Housing_furn_floorcov=sum(Housing_furn_floorcov*weight)
by inc_quantile age nfamily: egen t_Housing_furn_majapp=sum(Housing_furn_majapp*weight)
by inc_quantile age nfamily: egen t_Housing_furn_minappware=sum(Housing_furn_minappware*weight)
by inc_quantile age nfamily: egen t_Housing_furn_miscequip=sum(Housing_furn_miscequip*weight)
by inc_quantile age nfamily: egen t_Apparel=sum(Apparel*weight)
by inc_quantile age nfamily: egen t_Apparel_men=sum(Apparel_men*weight)
by inc_quantile age nfamily: egen t_Apparel_men_over16=sum(Apparel_men_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_boys=sum(Apparel_boys*weight)
by inc_quantile age nfamily: egen t_Apparel_women=sum(Apparel_women*weight)
by inc_quantile age nfamily: egen t_Apparel_women_over16=sum(Apparel_women_over16*weight)
by inc_quantile age nfamily: egen t_Apparel_girls=sum(Apparel_girls*weight)
by inc_quantile age nfamily: egen t_Apparel_child=sum(Apparel_child*weight)
by inc_quantile age nfamily: egen t_Apparel_foot=sum(Apparel_foot*weight)
by inc_quantile age nfamily: egen t_Apparel_others=sum(Apparel_others*weight)
by inc_quantile age nfamily: egen t_Transp=sum(Transp*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc=sum(Transp_vpurc*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_new=sum(Transp_vpurc_new*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_used=sum(Transp_vpurc_used*weight)
by inc_quantile age nfamily: egen t_Transp_vpurc_other=sum(Transp_vpurc_other*weight)
by inc_quantile age nfamily: egen t_Transp_gasmotoroil=sum(Transp_gasmotoroil*weight)
by inc_quantile age nfamily: egen t_Transp_maintrepairs=sum(Transp_maintrepairs*weight)
by inc_quantile age nfamily: egen t_Transp_vinsurance=sum(Transp_vinsurance*weight)
by inc_quantile age nfamily: egen t_Transp_rtlleaselicense=sum(Transp_rtlleaselicense*weight)
by inc_quantile age nfamily: egen t_Transp_puboth=sum(Transp_puboth*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_trip=sum(Transp_puboth_trip*weight)
by inc_quantile age nfamily: egen t_Transp_puboth_extrip=sum(Transp_puboth_extrip*weight)
by inc_quantile age nfamily: egen t_Healthcare=sum(Healthcare*weight)
by inc_quantile age nfamily: egen t_Healthcare_insurance=sum(Healthcare_insurance*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsrv=sum(Healthcare_medsrv*weight)
by inc_quantile age nfamily: egen t_Healthcare_presdrugs=sum(Healthcare_presdrugs*weight)
by inc_quantile age nfamily: egen t_Healthcare_medsupp=sum(Healthcare_medsupp*weight)
by inc_quantile age nfamily: egen t_Enter=sum(Enter*weight)
by inc_quantile age nfamily: egen t_Enter_admissionfees=sum(Enter_admissionfees*weight)
by inc_quantile age nfamily: egen t_Enter_tvradiossound=sum(Enter_tvradiossound*weight)
by inc_quantile age nfamily: egen t_Enter_petstoyspgequip=sum(Enter_petstoyspgequip*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp=sum(Enter_othsupp*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_nmrv=sum(Enter_othsupp_nmrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_mrv=sum(Enter_othsupp_mrv*weight)
by inc_quantile age nfamily: egen t_Enter_othsupp_misc=sum(Enter_othsupp_misc*weight)
by inc_quantile age nfamily: egen t_Personalcare=sum(Personalcare*weight)
by inc_quantile age nfamily: egen t_Reading=sum(Reading*weight)
by inc_quantile age nfamily: egen t_Education=sum(Education*weight)
by inc_quantile age nfamily: egen t_Tobacco=sum(Tobacco*weight)
by inc_quantile age nfamily: egen t_Misc=sum(Misc*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp=sum(Misc_miscexp*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_1=sum(Misc_miscexp_1*weight)
by inc_quantile age nfamily: egen t_Misc_miscexp_2=sum(Misc_miscexp_2*weight)
by inc_quantile age nfamily: egen t_Misc_othpropmortprin=sum(Misc_othpropmortprin*weight)
by inc_quantile age nfamily: egen t_Contribution=sum(Contribution*weight)
by inc_quantile age nfamily: egen t_InsurPens=sum(InsurPens*weight)
by inc_quantile age nfamily: egen t_InsurPens_perinsur=sum(InsurPens_perinsur*weight)
by inc_quantile age nfamily: egen t_InsurPens_retpenssose=sum(InsurPens_retpenssose*weight)
by inc_quantile age nfamily: egen t_OtherEntertainment=sum(OtherEntertainment*weight)
by inc_quantile age nfamily: egen t_Ownvachome_mortprin=sum(Ownvachome_mortprin*weight)
by inc_quantile age nfamily: egen t_Trip=sum(Trip*weight)
by inc_quantile age nfamily: egen t_Trip_food=sum(Trip_food*weight)
by inc_quantile age nfamily: egen t_Trip_foodontrip=sum(Trip_foodontrip*weight)
by inc_quantile age nfamily: egen t_Trip_foodPrep=sum(Trip_foodPrep*weight)
by inc_quantile age nfamily: egen t_Trip_alcohol=sum(Trip_alcohol*weight)
by inc_quantile age nfamily: egen t_Trip_lodging=sum(Trip_lodging*weight)
by inc_quantile age nfamily: egen t_Trip_transp=sum(Trip_transp*weight)
by inc_quantile age nfamily: egen t_Trip_transp_gas=sum(Trip_transp_gas*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Vrtl=sum(Trip_transp_Vrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Autortl=sum(Trip_transp_Autortl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Trrtl=sum(Trip_transp_Trrtl*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Parktoll=sum(Trip_transp_Parktoll*weight)
by inc_quantile age nfamily: egen t_Trip_transp_Pub=sum(Trip_transp_Pub*weight)
by inc_quantile age nfamily: egen t_Trip_transp_abts=sum(Trip_transp_abts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_air=sum(Trip_transp_air*weight)
by inc_quantile age nfamily: egen t_Trip_transp_bts=sum(Trip_transp_bts*weight)
by inc_quantile age nfamily: egen t_Trip_transp_ltransp=sum(Trip_transp_ltransp*weight)
by inc_quantile age nfamily: egen t_Trip_enter=sum(Trip_enter*weight)
by inc_quantile age nfamily: egen t_Trip_enter_misc=sum(Trip_enter_misc*weight)
by inc_quantile age nfamily: egen t_Trip_enter_rvrtl=sum(Trip_enter_rvrtl*weight)

sort inc_quantile age nfamily
by inc_quantile age: drop if nfamily==nfamily[_n-1]

keep inc_quantile age nfamily t_After_tax_income t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl

save us_consumption_mjpreclass_20`i'q`j', replace

use us_consumption_mjcurclass_20`i'q`j', replace

append using us_consumption_mjpreclass_20`i'q`j'

collapse (mean) t_After_tax_income (sum) t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl, by(inc_quantile age nfamily)

gen qyear="20`i'q`j'"
move qyear inc_quantile

save us_consumption_mjclass_20`i'q`j', replace

}

}



********************************************************************************



forvalues i=6/9 {

use us_consumption_mjclass_200`i'q1, replace
append using us_consumption_mjclass_200`i'q2
append using us_consumption_mjclass_200`i'q3
append using us_consumption_mjclass_200`i'q4

collapse (mean) t_After_tax_income (sum) t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl, by(inc_quantile age nfamily)

gen year=200`i'
move year inc_quantile

save us_consumption_mjclass_200`i', replace

}

forvalues i=10/18 {

use us_consumption_mjclass_20`i'q1, replace
append using us_consumption_mjclass_20`i'q2
append using us_consumption_mjclass_20`i'q3
append using us_consumption_mjclass_20`i'q4

collapse (mean) t_After_tax_income (sum) t_Total_exp t_Food Food_home t_Food_out t_Food_out_expay t_Food_out_pay t_Alcohol t_Housing t_Housing_shelt t_Housing_shelt_own t_Housing_shelt_own_dwe t_Housing_shelt_own_dwe_mortint t_Housing_shelt_own_dwe_proptax t_Housing_shelt_own_dwe_maint t_Housing_shelt_own_dwe_mortprin t_Housing_shelt_rented t_Housing_shelt_rented_exrap t_Housing_shelt_rented_rap t_Housing_shelt_othlod t_Housing_shelt_othlod_exmort t_Housing_shelt_othlod_mortprin t_Housing_util t_Housing_util_natgas t_Housing_util_elec t_Housing_util_fuel t_Housing_util_fuel_fueloil t_Housing_util_fuel_others t_Housing_util_phonesrv t_Housing_util_waterothpubsrv t_Housing_op Housing_op_domsrv t_Housing_op_domsrv_exchcare t_Housing_op_domsrv_chcare t_Housing_op_others t_Housing_furn Housing_furn_textiles t_Housing_furn_furniture t_Housing_furn_floorcov t_Housing_furn_majapp t_Housing_furn_minappware t_Housing_furn_miscequip t_Apparel t_Apparel_men t_Apparel_men_over16 t_Apparel_boys t_Apparel_women t_Apparel_women_over16 t_Apparel_girls t_Apparel_child t_Apparel_foot t_Apparel_others t_Transp t_Transp_vpurc t_Transp_vpurc_new t_Transp_vpurc_used t_Transp_vpurc_other t_Transp_gasmotoroil t_Transp_maintrepairs t_Transp_vinsurance t_Transp_rtlleaselicense t_Transp_puboth t_Transp_puboth_trip t_Transp_puboth_extrip t_Healthcare t_Healthcare_insurance t_Healthcare_medsrv t_Healthcare_presdrugs t_Healthcare_medsupp t_Enter t_Enter_admissionfees t_Enter_tvradiossound t_Enter_petstoyspgequip t_Enter_othsupp t_Enter_othsupp_nmrv t_Enter_othsupp_mrv t_Enter_othsupp_misc t_Personalcare Reading t_Education t_Tobacco t_Misc t_Misc_miscexp t_Misc_miscexp_1 t_Misc_miscexp_2 t_Misc_othpropmortprin t_Contribution t_InsurPens t_InsurPens_perinsur t_InsurPens_retpenssose t_OtherEntertainment t_Ownvachome_mortprin t_Trip t_Trip_food t_Trip_foodontrip t_Trip_foodPrep t_Trip_alcohol t_Trip_lodging t_Trip_transp t_Trip_transp_gas t_Trip_transp_Vrtl t_Trip_transp_Autortl t_Trip_transp_Trrtl t_Trip_transp_Parktoll t_Trip_transp_Pub t_Trip_transp_abts t_Trip_transp_air t_Trip_transp_bts t_Trip_transp_ltransp t_Trip_enter t_Trip_enter_misc t_Trip_enter_rvrtl, by(inc_quantile age nfamily)

gen year=20`i'
move year inc_quantile

save us_consumption_mjclass_20`i', replace

}
