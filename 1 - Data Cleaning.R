
# Install Packages (done only once) ---------------------------------------

# install.packages("haven")
# install.packages("dplyr")
# install.packages("psych")
# install.packages("car")
# install.packages("caTools")
# install.packages("finalfit")

# Load Libraries ----------------------------------------------------------

library(haven)
library(dplyr)
library(psych)
library(car)
library(caTools)
library(finalfit)


# Load Data ---------------------------------------------------------------

df<-read_sav("Fall24-Baseline.sav")

# remove additional meta data from SPSS .sav file
df<-as.data.frame(as.matrix(df))



# Inspect Data Structure --------------------------------------------------

# Print Column Names
colnames(df)

# Remove Header columns
df<-df[,-c(1:18)]
colnames(df)

# Examine data-type for all variables
str(df)


# Data-type cleaning ------------------------------------------------------

# All variables are 'character' type,
# Therefore, we need to change all non-char variables to numeric (by column number)
colnames(df)
numeric_cols<-c(1:3, 5:12, 14:29, 31:32, 34:42, 44:77, 79:391)

# Our first 'for-loop'

for(col in numeric_cols){
  df[,col]<-as.numeric(df[,col])
}

str(df)



# Variable Name Cleaning --------------------------------------------------

# Write column names to csv & manually clean in Excel

# write.csv(colnames(df), "col_names.csv", row.names = F)


clean_columns<-read.csv("col_names.csv")

colnames(df)<-clean_columns$clean

colnames(df)



