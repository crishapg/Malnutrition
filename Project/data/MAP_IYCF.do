clear all
set more off

gl data="C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Final Project\data"

use "$data/world_latlong2.dta"
sort country
save, replace

use "$data/2015_General_Info_IYCF.dta"

keep Country Region Population Pop_05m Pop_623m Pop_2459m Districts Health_facilities Primary_care_fac Health_workers Community_health_workers Policy_standalone Policy_integrated Policy_complementary Policy_complementary_MNP Policy_complementary_LNS Policy_complementary_mediumLNS Policy_complementary_largeLNS Policy_complementary_plumpysup Policy_complementary_fortified Policy_complementary_unfortified Policy_complementary_other Code Code_monitoring Policy_humanitarian WHO_guidelines Counselling_doctors Counselling_nurses Counselling_PHC Counselling_PHC_individual Counselling_PHC_group HW_training Counselling_community Counselling_community_districts Counselling_community_training Counselling_community_CHW Counselling_community_UNICEF Counselling_community_package Counselling_community_supervis Counselling_community_frequency Counselling_community_ Counselling_community_Agricult Counselling_community_Wash Counselling_community_Education Counselling_community_Welfare Counselling_community_SP Counselling_community_other Counselling_mothers Communication_strategy

rename Country country
replace country="British Virgin Islands" if country=="British Virgin islands"
replace country="Republic of the Marshall Islands" if country=="Republic of the Marshall islands"
replace country="Solomon Islands" if country=="Solomon islands"
replace Population="90086000" if Population=="90086million"
replace Population="1210000000" if Population=="1210million"
replace Pop_05m="10500000" if Pop_05m=="10.5million"
replace Pop_623m = 30910000 if Pop_623m==30.91
replace Pop_2459m = "70730000" if Pop_2459m=="70.73million"
replace Districts="21" if Districts=="20AtollsandCapital(21"
replace Districts="25" if Districts=="26HealthDistricts(administerativedistricts25)"
replace Districts="878" if Districts=="878districtsin77provinces"
replace Health_facilities="622" if Health_facilities=="5760(622hospitalsand487Primarycareunitsand4751fieldcliniccentres)"
replace Health_workers="172369" if country=="Thailand"
replace Community_health_workers="1000000" if country=="Thailand"


destring Population Pop_05m Pop_623m Pop_2459m Districts Health_facilities Health_workers Community_health_workers, replace

sort country
merge country using "$data/world_latlong2.dta"
tab _merge
drop if _merge==2
drop _merge

rename lat latitude
rename lon longitude

replace latitude=6.611111 if country=="Central African Republic (CAR)"
replace longitude=20.939444 if country=="Central African Republic (CAR)"
replace latitude=-4.038333 if country=="Congo"
replace longitude=21.758664 if country=="Congo"
replace latitude=7.539989 if country=="Cote d'Ivoire"
replace longitude=-5.54708 if country=="Cote d'Ivoire"
replace latitude=-0.228021 if country=="Democratic Republic of Congo"
replace longitude=15.827659 if country=="Democratic Republic of Congo"
replace latitude=7.425554 if country=="Federated States of Micronesia"
replace longitude=150.550812 if country=="Federated States of Micronesia"
replace latitude=11.803749 if country=="Guinea Bissau"
replace longitude=-15.180413 if country=="Guinea Bissau"
replace latitude=32.427908 if country=="Iran (Islamic Republic of)"
replace longitude=53.688046 if country=="Iran (Islamic Republic of)"
replace latitude=40.339852 if country=="Korea, Democratic People's Republic of"
replace longitude=127.510093 if country=="Korea, Democratic People's Republic of"
replace latitude=19.85627 if country=="Lao People's Democratic Republic"
replace longitude=102.495496 if country=="Lao People's Democratic Republic"
replace latitude=41.608635 if country=="Macedonia (The former Yugoslav Republic of)"
replace longitude=21.745275 if country=="Macedonia (The former Yugoslav Republic of)"
replace latitude=21.913965 if country=="Myanmar"
replace longitude=95.956223 if country=="Myanmar"
replace latitude=31.952162 if country=="Occupied Palestinian Territory"
replace longitude=35.233154 if country=="Occupied Palestinian Territory"
replace latitude=7.131474 if country=="Republic of the Marshall Islands"
replace longitude=171.184478 if country=="Republic of the Marshall Islands"
replace latitude=61.52401 if country=="Russian Federation"
replace longitude=105.318756 if country=="Russian Federation"
replace latitude=0.18636 if country=="Sao Tome and Principe"
replace longitude=6.613081 if country=="Sao Tome and Principe"
replace latitude=12.862807 if country=="South Sudan, Republic of"
replace longitude=30.217636 if country=="South Sudan, Republic of"
replace latitude=17.357822 if country=="St. Kitts and Nevis"
replace longitude=-62.782998 if country=="St. Kitts and Nevis"
replace latitude=13.909444 if country=="St. Lucia"
replace longitude=-60.978893 if country=="St. Lucia"
replace latitude=12.984305 if country=="St. Vincent and the Grenadines"
replace longitude=-61.287228 if country=="St. Vincent and the Grenadines"
replace latitude=34.802075 if country=="Syrian Arab Republic"
replace longitude=38.996815 if country=="Syrian Arab Republic"
replace latitude=-6.369028 if country=="Tanzania, United Republic"
replace longitude=34.888822 if country=="Tanzania, United Republic"
replace latitude=21.694025 if country=="The Turks and Caicos Islands"
replace longitude=-71.797928 if country=="The Turks and Caicos Islands"
replace latitude=6.42375 if country=="Venezuela (Bolivarian Republic of)"
replace longitude=-66.58973 if country=="Venezuela (Bolivarian Republic of)"

save "$data/MAP_2015_General_Info_IYCF.dta", replace
