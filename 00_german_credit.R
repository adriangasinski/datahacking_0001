# prepare german credit data 

# 0.0 preparing data
df <- read.table('https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data', sep=' ', header = 0)

german_credit <- data.frame(default = df$V21)
german_credit$default <- 0 
german_credit$default[df$V21 == 2] <- 1


# Attribute 1: (qualitative) 
# Status of existing checking account 
# A11 : ... < 0 DM 
# A12 : 0 <= ... < 200 DM 
# A13 : ... >= 200 DM / salary assignments for at least 1 year 
# A14 : no checking account 

german_credit$account_check_status <- df$V1
levels(german_credit$account_check_status) <- c('< 0 DM'
                                         ,'0 <= ... < 200 DM'
                                         ,'>= 200 DM / salary assignments for at least 1 year'
                                         ,'no checking account'
                                         )

# Attribute 2: (numerical) 
# Duration in month 

german_credit$duration_in_month <- df$V2

# Attribute 3: (qualitative) 
# Credit history 
# A30 : no credits taken/ all credits paid back duly 
# A31 : all credits at this bank paid back duly 
# A32 : existing credits paid back duly till now 
# A33 : delay in paying off in the past 
# A34 : critical account/ other credits existing (not at this bank) 

german_credit$credit_history <- df$V3
levels(german_credit$credit_history) <- c(
  'no credits taken/ all credits paid back duly'
  ,'all credits at this bank paid back duly'
  ,'existing credits paid back duly till now'
  ,'delay in paying off in the past'
  ,'critical account/ other credits existing (not at this bank)'
)

# Attribute 4: (qualitative) 
# # Purpose 
# A40 : car (new) 
# A41 : car (used) 
# A42 : furniture/equipment 
# A43 : radio/television 
# A44 : domestic appliances 
# A45 : repairs 
# A46 : education 
# A47 : (vacation - does not exist?) 
# A48 : retraining 
# A49 : business 
# A410 : others 

german_credit$purpose <- df$V4

levels(german_credit$purpose) <- c(
  'car (new)'
  ,'car (used)'
  ,'furniture/equipment'
  ,'radio/television' 
  ,'domestic appliances'
  ,'repairs' 
  ,'education'
  ,'(vacation - does not exist?)'
  ,'retraining' 
  ,'business'
  ,'others'
  
)


# Attribute 5: (numerical) 
# Credit amount 
german_credit$credit_amount <- df$V5


# Attibute 6: (qualitative) 
# Savings account/bonds 
# A61 : ... < 100 DM 
# A62 : 100 <= ... < 500 DM 
# A63 : 500 <= ... < 1000 DM 
# A64 : .. >= 1000 DM 
# A65 : unknown/ no savings account 

german_credit$savings <- df$V6
levels(german_credit$savings) <- c(
  '... < 100 DM'
  ,'100 <= ... < 500 DM'
  ,'500 <= ... < 1000 DM '
  ,'.. >= 1000 DM '
  ,'unknown/ no savings account'
)


# Attribute 7: (qualitative) 
# Present employment since 
# A71 : unemployed 
# A72 : ... < 1 year 
# A73 : 1 <= ... < 4 years 
# A74 : 4 <= ... < 7 years 
# A75 : .. >= 7 years 

german_credit$present_emp_since <- df$V7
levels(german_credit$present_emp_since) <- c(
  'unemployed'
  ,'... < 1 year '
  ,'1 <= ... < 4 years'
  ,'4 <= ... < 7 years'
  ,'.. >= 7 years'
)



# Attribute 8: (numerical) 
# Installment rate in percentage of disposable income 


german_credit$installment_as_income_perc <- df$V8

# Attribute 9: (qualitative) 
# Personal status and sex 
# A91 : male : divorced/separated 
# A92 : female : divorced/separated/married 
# A93 : male : single 
# A94 : male : married/widowed 
# A95 : female : single 

german_credit$personal_status_sex <- df$V9
levels(german_credit$personal_status_sex) <- c(
  'male : divorced/separated'
  ,'female : divorced/separated/married'
  ,'male : single'
  ,'male : married/widowed'
  ,'female : single'
)


# Attribute 10: (qualitative) 
# Other debtors / guarantors 
# A101 : none 
# A102 : co-applicant 
# A103 : guarantor 

german_credit$other_debtors <- df$V10
levels(german_credit$other_debtors) <- c(
  'none'
  ,'co-applicant'
  ,'guarantor'
)

# Attribute 11: (numerical) 
# Present residence since 
german_credit$present_res_since <- df$V11


# Attribute 12: (qualitative) 
# Property 
# A121 : real estate 
# A122 : if not A121 : building society savings agreement/ life insurance 
# A123 : if not A121/A122 : car or other, not in attribute 6 
# A124 : unknown / no property 

german_credit$property <- df$V12
levels(german_credit$property) <- c(
  'real estate'
  ,'if not A121 : building society savings agreement/ life insurance'
  ,'if not A121/A122 : car or other, not in attribute 6'
  ,'unknown / no property'
)

# Attribute 13: (numerical) 
# Age in years 

german_credit$age <- df$V13

# Attribute 14: (qualitative) 
# Other installment plans 
# A141 : bank 
# A142 : stores 
# A143 : none 

german_credit$other_installment_plans <- df$V14
levels(german_credit$other_installment_plans) <- c(
  'bank'
  ,'stores'
  ,'none'
)



# Attribute 15: (qualitative) 
# Housing 
# A151 : rent 
# A152 : own 
# A153 : for free 

german_credit$housing <- df$V15
levels(german_credit$housing) <- c('rent', 'own', 'for free')


# Attribute 16: (numerical) 
# Number of existing credits at this bank 
german_credit$credits_this_bank <- df$V16


# Attribute 17: (qualitative) 
# Job 
# A171 : unemployed/ unskilled - non-resident 
# A172 : unskilled - resident 
# A173 : skilled employee / official 
# A174 : management/ self-employed/ 
#   highly qualified employee/ officer 
german_credit$job <- df$V17
levels(german_credit$job) <- c(
  'unemployed/ unskilled - non-resident'
  ,'unskilled - resident'
  ,'skilled employee / official'
  ,'management/ self-employed/ highly qualified employee/ officer'
)


# Attribute 18: (numerical) 
# Number of people being liable to provide maintenance for 

german_credit$people_under_maintenance <- df$V18


# Attribute 19: (qualitative) 
# Telephone 
# A191 : none 
# A192 : yes, registered under the customers name 

german_credit$telephone <- df$V19
levels(german_credit$telephone) <- c(
  'none'
  ,'yes, registered under the customers name '
)

# Attribute 20: (qualitative) 
# foreign worker 
# A201 : yes 
# A202 : no 
german_credit$foreign_worker <- df$V20
levels(german_credit$foreign_worker) <- c('yes', 'no')


save(german_credit, file = 'D:/AG_wspolny/20160407_automat/german_credit')
write.csv(german_credit, 'D:/AG_wspolny/20160407_automat/german_credit.csv',
          row.names = FALSE)
