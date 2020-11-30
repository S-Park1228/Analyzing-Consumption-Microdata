# Preprocessing-the-BLS-Consumer-Expenditure-Surveys-PUMD
STATA do files for preprocessing the BLS Consumer Expenditure Surveys Public-Use Microdata

# Data
- Source: https://www.bls.gov/cex/pumd_data.htm#stata
- Instructions: https://www.bls.gov/cex/pumd-getting-started-guide.htm

# Do files for FMLI data
- us_income: labelling households with income quintile(total, the 1st quintile, the 2nd quintile, the 3rd quintile, the 4th quintile, the 5th quintile)
- us_age: labelling households with the age of the reference person(7 kinds of labels), automatically executed when you run the "us_income.do"
- us_nfamily: labelling households with household type(total, 20s, 30s, 40s, 50s, 60s, over 70), automaticcaly excecuted when you run the "us_age.do"
- us_consumption_mjclass: organizing the FMLI expenditures for households by income quintile, the age of the reference person and household type
- The maximum number of labels for each year is 294, derived from 6 * 7 * 7. 

# Do files for MTBI data
- us_mtbi: organizing expenditures for individual item(so called "ucc") by household income quintile, the age of the reference person and household type
- us_age_detailed: labelling households with the age of the reference person(7 kinds of labels), automatically executed when you run the "us_mtbi.do"
- us_nfamily_detailed: labelling households with household type(total, 20s, 30s, 40s, 50s, 60s, over 70), automaticcaly excecuted when you run the "us_age_detailed.do"

# Do files for organizing the average purchase prices for individual item(ucc) and household market shares for each item
- us_price: calculate the quarterly average purchase prices for individual item and household m/s for each item
- us_age_price: labelling households with the age of the reference person(7 kinds of labels), automatically executed when you run the "us_price.do"
- us_nfamily_price: labelling households with household type(total, 20s, 30s, 40s, 50s, 60s, over 70), automaticcaly excecuted when you run the "us_age_price.do"
