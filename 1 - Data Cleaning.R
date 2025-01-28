
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                  ART of R - Organizational Headings Tool                 ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# install.packages("ARTofR") # Install only once
library(ARTofR)
ARTofR::xxx_title1('Sexual Orientation - Dummy coding')
ARTofR::xxx_title3('Gender - Dummy coding')

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                      Install Packages - Only done once                   ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# install.packages("haven") # Integrates SPSS and R
# install.packages("dplyr") # Great for data manipulation
# install.packages("psych") # Psych data package
# install.packages("car") # Companion to Applied Regression
# install.packages("caTools") # sample splits and other great data munging functions
# install.packages("finalfit") # for missing data
# install.packages("rempsyc) # generates APA 7 tables very quickly in docx format
# install.packages("lubridate") # for handling dates

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                               Load Libraries                             ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(haven)
library(dplyr)
library(psych)
library(lubridate)
library(car)
library(caTools)
library(finalfit)
library(rempsyc)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                  Load Data                               ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

df<-read_sav("data/Fall24-Baseline_R.sav")

# remove additional meta data from SPSS .sav file
df<-as.data.frame(as.matrix(df))



##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                           Inspect Data Structure                         ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Print Column Names
colnames(df)

# Remove Header columns
df<-df[,-c(1:4, 6:7, 9:18, 400:404)]
colnames(df)

# Examine data-type for all variables
str(df)


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                             Data-type cleaning                           ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# All variables are 'character' type,
# Therefore, we need to change all non-char variables to numeric (by column number)
colnames(df)
numeric_cols<-c(1, 3:5, 7:14, 16:31, 33:34, 36:44, 46:79, 81:372)

# Our first 'for-loop'

for(col in numeric_cols){
  df[,col]<-as.numeric(df[,col])
}

# cleanup environment
rm(numeric_cols, col)


str(df)

# Change RecordedDate to Date format (Column 2)
df$RecordedDate<-as.Date(df$RecordedDate)
df[,2]<-as.Date(df[,2])


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                           Variable Name cleaning                         ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Write column names to csv & manually clean in Excel

# write.csv(colnames(df), "col_names2.csv", row.names = F)


clean_columns<-read.csv("col_names.csv")

colnames(df)<-clean_columns$clean

colnames(df)

# cleanup environment
rm(clean_columns)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                        Cleaning Individual Variables                     ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


##~~~~~~~~~~~~~
##  ~ Age  ----
##~~~~~~~~~~~~~


# Objectives: Accurately calcualte participants age using BirthMonth, BirthYear, and RecordedDate
#             Account for NA's in BirthMonth
#             Account for the lack of any Day of the Month for participant's Birthday

# Accomplishing this ends up being pretty complex


# Steps: 1.) Impute random months for missing BirthMonths (as opposed to only using BirthYear [no NA's])
#        2.) Use dplyr & lubridate to calculate participants age (accounting for no birth days)
#        3.) Create computed Age variable
#        4.) Examine computed Age variable - checking for obvious errors
#        5.) Remove now, unneeded variables from the data frame


### Step 1: Impute random months for missing BirthMonths ###

# Step by step code explanation #

# Sample generates random numbers in a range, in this case 1 through 12 (birth months), with replacement 
sample(1:12, 100, replace=T) # Here we're generating 100 random numbers

# sum adds up the number of rows & is.na(df$BirthMonth) is a test of if BirthMonth is NA
sum(is.na(df$BirthMonth)==T)
135/nrow(df)

# So, 135 rows of birth month are NA - 10.61% of the sample

# Generate 135 random values between 1 and 12
sample(1:12, sum(is.na(df$BirthMonth)), replace = TRUE) # OR alternatively: sample(1:12, 135, replace = TRUE)


# Putting it all together using an ifelse() statement #

# IF BirthMonth is NA, replace BirthMonth with the list of 135 randomly generated values
# ELSE keep BirthMonth the same

df$BirthMonth <- ifelse(is.na(df$BirthMonth), sample(1:12, sum(is.na(df$BirthMonth)), replace = TRUE), df$BirthMonth)

describe(df$BirthMonth)
hist(df$BirthMonth)



### Step 2: Use dplyr & lubridate (make_date) to calculate participants age ###

df <- df %>%
  mutate(
    DayOfBirthIMPUTED = sample(1:28, nrow(df), replace = TRUE),  # Safe range for all months
    DOB = make_date(BirthYear, BirthMonth, DayOfBirthIMPUTED)
  )


### Step 3: Compute Age Variable ###

# Step by Step Breakdown: #

# df <- df %>%
# This uses the pipe operator (%>%) from the dplyr package to pass the df data frame to the next function (mutate()).
# 
# mutate()
# This function creates or modifies columns in a data frame. In this case, it is creating a new column called age.
# 
# age = year(RecordedDate) - year(DOB)
# This part calculates the initial age by subtracting the birth year (DOB) from the year of RecordedDate.
# 
# ifelse(condition, true_value, false_value)
# A conditional function:
#   
#   If the condition is true, it returns true_value, otherwise false_value.
#
# In this case:
# month(RecordedDate) < month(DOB) | 
# (month(RecordedDate) == month(DOB) & day(RecordedDate) < day(DOB))
# checks if the birthday has already occurred in the RecordedDate year.

# Condition Explanation:
#   
# month(RecordedDate) < month(DOB): Checks if the recorded month is before the birth month.
# |: Logical OR operator.
#
# (month(RecordedDate) == month(DOB) & day(RecordedDate) < day(DOB)): Checks if the recorded month is the same as the birth month but the recorded day is before the birthday.
#
# Together, this condition determines whether the birthday has occurred in the current year.
# 1, 0 in ifelse()
# 
# If the condition is TRUE, subtract 1 from the preliminary age.
# Otherwise, subtract 0.


df <- df %>%
  mutate(
    age = year(RecordedDate) - year(DOB) -
      ifelse(month(RecordedDate) < month(DOB) | 
               (month(RecordedDate) == month(DOB) & day(RecordedDate) < day(DOB)), 
             1, 0)
  )


### Step 4: Examine the age column ###
describe(df$age)
hist(df$age)

### Step 5: Remove unneeded columns using dplyr
df<-dplyr::select(df, -BirthYear, -BirthMonth, -DayOfBirthIMPUTED, -DOB)

# Reorganize to make age the 3rd variable
df <- select(df, 1:2, age, everything())

##~~~~~~~~~~~~~~~~~~
##  ~ Hispanic  ----
##~~~~~~~~~~~~~~~~~~

# 95 corresponds to refusal to respond to the item, so we recode these as NA's
unique(df$Hispanic)

df$Hispanic<-ifelse(df$Hispanic == 95, NA, df$Hispanic)

table(df$Hispanic)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Race and Ethnicity  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Objectives: Replace NA's in Race/Ethnicity with 0's
#             Create new variable to denote missing Race/Ethnicity

# Steps: 1.) Use a for loop to replace all NA's with 0's
#        2.) Create new variable that adds up all the ethnicity columns
#        3.) If the sum of all ethnicity columns is 0, make a new missing_enthnicity column that is = 1
#        4.) Repeat this for Race


### Step 1: Use a for loop to replace all NA's with 0's ###

# Identify Ethnicity column numbers (7:13)
colnames(df[,7:15])

 
### Step 2: Use a for loop to replace NA's with 0 ###

for(i in 7:13){
  df[,i]<-ifelse(is.na(df[,i])==T, 0, df[,i])
}

### Step 3: Create missing_ethnicity variable ###

# Initialize a missing_ethnicity variable
df$missing_ethnicity = NA
for(i in 1:nrow(df)){
  df[i, "missing_ethnicity"]<-ifelse(sum(df[i, 7:13])==0, 1, 0)
}

table(df$missing_ethnicity)


# Reorganize to make the missing_ethnicity the 15rd variable
df <- select(df, 1:14, missing_ethnicity, everything())


### Step 4: Repeat for Race ###
colnames(df[,16:32])

for(i in 16:31){
  df[,i]<-ifelse(is.na(df[,i])==T, 0, df[,i])
}

df$missing_race = NA
for(i in 1:nrow(df)){
  df[i, "missing_race"]<-ifelse(sum(df[i, 16:31])==0, 1, 0)
}

table(df$missing_race)

df <- select(df, 1:32, missing_race, everything())

colnames(df)


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Gender - Dummy coding  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Objectives: Turn the Gender column into dummy coded (0,1) variables for each gender

unique(df$Gender)
table(df$Gender)

# 1 - Male
# 2 - Female
# 5 - Transgender
# 6 - Nonbinary
# 7 - Other

# Initialize variables
df$Gender_Male <- NA
df$Gender_Female <- NA
df$Gender_Transgender <- NA
df$Gender_Nonbinary <- NA
df$Gender_Other <- NA



# Use ifelse functions to assign 0,1 values to each

df$Gender_Male <- ifelse(df$Gender==1, 1, 0)
df$Gender_Female <- ifelse(df$Gender==2, 1, 0)
df$Gender_Transgender <- ifelse(df$Gender==5, 1, 0)
df$Gender_Nonbinary <- ifelse(df$Gender==6, 1, 0)
df$Gender_Other <- ifelse(df$Gender==7, 1, 0)

# Add NA's where applicable using a for loop
gender_var_list<-c("Gender_Male", "Gender_Female", "Gender_Transgender", "Gender_Nonbinary", "Gender_Other")

for(gend in gender_var_list){
  df[, gend] <- ifelse(is.na(df$Gender)==T, NA, df[, gend])
}

rm(gender_var_list)
colnames(df)
df<-dplyr::select(df, -Gender)

df <- select(df, 1:3, Gender_Male, Gender_Female, Gender_Transgender, Gender_Nonbinary, Gender_Other, everything())



##~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Transgender -  ----
##~~~~~~~~~~~~~~~~~~~~~~~


