set more off

use "C:\Users\crish\OneDrive\Documents\Columbia SIPA\2017 Spring\Data Visualization\Final Project\data\MAP_2015_General_Info_IYCF.dta", clear

*Note: all variables starting with FP mean "Final Project"
*Infant and Young Child Feeding

*Map 1. Legal measures

tab Code
gen FP_code="No legal measures" if Code=="No-but law/agreement is drafted/in progress" | Code=="No-no laws or actions"
replace FP_code="Some legal measures" if Code=="Yes-partially – not all provisions of Code and Resolutions included" | Code=="Yes-voluntary agreement between Government and manufacturers"
replace FP_code="Full legal measures" if Code=="Yes-all provisions of Code and Resolutions included"
replace FP_code="No Data" if FP_code==""
tab Code FP_code

gen FP_policy="Standalone" if Policy_standalone=="Yes"
replace FP_policy="Integrated" if Policy_integrated=="IYCF elements are integrated within the health policy or strategy"
replace FP_policy="Integrated" if Policy_integrated=="IYCF elements are integrated within the nutrition policy or strategy"
replace FP_policy="Integrated" if Policy_integrated=="IYCF elements are integrated within health & nutrition policy or strategy"
replace FP_policy="No policy" if Policy_integrated=="No policy/strategy at all"
replace FP_policy="No policy" if Policy_integrated=="Other"
tab FP_policy, m

gen FP_counselldoc="Yes" if Counselling_doctors=="Yes, comprehensively"
replace FP_counselldoc="Minimally" if Counselling_doctors=="Minimally"
replace FP_counselldoc="No" if Counselling_doctors=="No"
tab FP_counselldoc,m 

gen FP_counsellnurs="Yes" if Counselling_nurses=="Yes, comprehensively"
replace FP_counsellnurs="Minimally" if Counselling_nurses=="Minimally"
replace FP_counsellnurs="No" if Counselling_nurses=="No"
tab FP_counsellnurs,m 

gen FP_counsellmothers=Counselling_mothers

