clear all
set more off

gl data="$C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Final Project\data"

*WORLD MAP
import delimited "C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Class 9\data\qog_bas_cs_jan17.csv"
keep  ccode cname ccodealp ccodecow ccodewb
rename cname country
sort country
save "C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Final Project\data\world_map.dta", replace

use "C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Final Project\data\2015_General_Info_IYCF.dta", clear

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
merge country using "C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Final Project\data\world_map.dta"
tab _merge
drop if _merge==2
drop _merge
order country ccode ccodealp ccodecow ccodewb

replace ccode=140 if country=="Central African Republic (CAR)"
replace ccode=180 if country=="Democratic Republic of Congo"
replace ccode=231 if country=="Ethiopia"
replace ccode=583 if country=="Federated States of Micronesia"
replace ccode=624 if country=="Guinea Bissau"
replace ccode=364 if country=="Iran (Islamic Republic of)"
replace ccode=408 if country=="Korea, Democratic People's Republic of"
replace ccode=418 if country=="Lao People's Democratic Republic"
replace ccode=807 if country=="Macedonia (The former Yugoslav Republic of)"
replace ccode=458 if country=="Malaysia"
replace ccode=586 if country=="Pakistan"
replace ccode=584 if country=="Republic of the Marshall islands"
replace ccode=643 if country=="Russian Federation"
replace ccode=90 if country=="Solomon islands"
replace ccode=728 if country=="South Sudan, Republic of"
replace ccode=659 if country=="St. Kitts and Nevis"
replace ccode=662 if country=="St. Lucia"
replace ccode=670 if country=="St. Vincent and the Grenadines"
replace ccode=729 if country=="Sudan"
replace ccode=760 if country=="Syrian Arab Republic"
replace ccode=834 if country=="Tanzania, United Republic"
replace ccode=862 if country=="Venezuela (Bolivarian Republic of)"

replace ccodealp="CAF" if country=="Central African Republic (CAR)"
replace ccodealp="COD" if country=="Democratic Republic of Congo"
replace ccodealp="ETH" if country=="Ethiopia"
replace ccodealp="FSM" if country=="Federated States of Micronesia"
replace ccodealp="GNB" if country=="Guinea Bissau"
replace ccodealp="IRN" if country=="Iran (Islamic Republic of)"
replace ccodealp="PRK" if country=="Korea, Democratic People's Republic of"
replace ccodealp="LAO" if country=="Lao People's Democratic Republic"
replace ccodealp="MKD" if country=="Macedonia (The former Yugoslav Republic of)"
replace ccodealp="MYS" if country=="Malaysia"
replace ccodealp="PAK" if country=="Pakistan"
replace ccodealp="MHL" if country=="Republic of the Marshall islands"
replace ccodealp="RUS" if country=="Russian Federation"
replace ccodealp="SLB" if country=="Solomon islands"
replace ccodealp="SSD" if country=="South Sudan, Republic of"
replace ccodealp="KNA" if country=="St. Kitts and Nevis"
replace ccodealp="LCA" if country=="St. Lucia"
replace ccodealp="VCT" if country=="St. Vincent and the Grenadines"
replace ccodealp="SDN" if country=="Sudan"
replace ccodealp="SYR" if country=="Syrian Arab Republic"
replace ccodealp="TZA" if country=="Tanzania, United Republic"
replace ccodealp="VEN" if country=="Venezuela (Bolivarian Republic of)"

replace ccodecow=482 if country=="Central African Republic (CAR)"
replace ccodecow=490 if country=="Democratic Republic of Congo"
replace ccodecow=530 if country=="Ethiopia"
replace ccodecow=987 if country=="Federated States of Micronesia"
replace ccodecow=404 if country=="Guinea Bissau"
replace ccodecow=630 if country=="Iran (Islamic Republic of)"
replace ccodecow=731 if country=="Korea, Democratic People's Republic of"
replace ccodecow=812 if country=="Lao People's Democratic Republic"
replace ccodecow=343 if country=="Macedonia (The former Yugoslav Republic of)"
replace ccodecow=820 if country=="Malaysia"
replace ccodecow=770 if country=="Pakistan"
replace ccodecow=983 if country=="Republic of the Marshall islands"
replace ccodecow=365 if country=="Russian Federation"
replace ccodecow=940 if country=="Solomon islands"
replace ccodecow=626 if country=="South Sudan, Republic of"
replace ccodecow=60 if country=="St. Kitts and Nevis"
replace ccodecow=56 if country=="St. Lucia"
replace ccodecow=57 if country=="St. Vincent and the Grenadines"
replace ccodecow=652 if country=="Syrian Arab Republic"
replace ccodecow=510 if country=="Tanzania, United Republic"
replace ccodecow=101 if country=="Venezuela (Bolivarian Republic of)"

replace ccodewb=140 if country=="Central African Republic (CAR)"
replace ccodewb=180 if country=="Democratic Republic of Congo"
replace ccodewb=231 if country=="Ethiopia"
replace ccodewb=583 if country=="Federated States of Micronesia"
replace ccodewb=624 if country=="Guinea Bissau"
replace ccodewb=364 if country=="Iran (Islamic Republic of)"
replace ccodewb=408 if country=="Korea, Democratic People's Republic of"
replace ccodewb=418 if country=="Lao People's Democratic Republic"
replace ccodewb=807 if country=="Macedonia (The former Yugoslav Republic of)"
replace ccodewb=458 if country=="Malaysia"
replace ccodewb=586 if country=="Pakistan"
replace ccodewb=584 if country=="Republic of the Marshall islands"
replace ccodewb=643 if country=="Russian Federation"
replace ccodewb=90 if country=="Solomon islands"
replace ccodewb=659 if country=="St. Kitts and Nevis"
replace ccodewb=662 if country=="St. Lucia"
replace ccodewb=670 if country=="St. Vincent and the Grenadines"
replace ccodewb=760 if country=="Syrian Arab Republic"
replace ccodewb=834 if country=="Tanzania, United Republic"
replace ccodewb=862 if country=="Venezuela (Bolivarian Republic of)"

gen policy="standalone" if Policy_standalone=="Yes"
replace policy="integrated" if Policy_integrated=="IYCF elements are integrated within the health policy or strategy"
replace policy="integrated" if Policy_integrated=="IYCF elements are integrated within the nutrition policy or strategy"
replace policy="integrated" if Policy_integrated=="IYCF elements are integrated within health & nutrition policy or strategy"
replace policy="No policy" if Policy_integrated=="No policy/strategy at all"
replace policy="" if Policy_integrated=="Other"
tab policy, m

drop Policy_standalone Policy_integrated
order country ccode ccodealp ccodecow ccodewb Region Population Pop_05m Pop_623m Pop_2459m Districts Health_facilities Primary_care_fac Health_workers Community_health_workers policy

*Variables for Nutridash
*Maps
tab policy
tab Counselling_community_UNICEF

* IYCF: Percentage of Health Facilities with trained Health workers

save "C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Final Project\data\world_map_final.dta", replace


