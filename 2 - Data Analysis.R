
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                  ART of R - Organizational Headings Tool                 ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# install.packages("ARTofR") # Install only once
library(ARTofR)
ARTofR::xxx_title1('Select Variables of Interest')
ARTofR::xxx_title3('View Results')

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##----------------------- SELECT VARIABLES OF INTEREST--------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(df)

data<-df[,c(4,5,283:291,295:304,347:354)]

head(data)
colnames(data)

# Keep only rows where gender is either male or female

data$remove<-ifelse(data$Gender_Female == 0 & data$Gender_Male==0,1,0)

table(data$remove)

data<- data[data$remove == 0, ]

data<-dplyr::select(data,-remove)

str(data)


##~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Compute Variables  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~

# AUDIT

# Select the AUDIT columns (AUDIT_1 to AUDIT_10)
audit_columns <- paste0("AUDIT_", 1:10)

# Create a new variable audit_total that sums the AUDIT scores for rows with no NAs
data$audit_total <- rowSums(data[, audit_columns], na.rm = FALSE)

# For rows with NAs in any of the AUDIT columns, set audit_total to NA
data$audit_total[!complete.cases(data[, audit_columns])] <- NA




# Depression

# Select the PHQ9 columns (PHQ9_1 to PHQ9_9)
phq9_columns <- paste0("PHQ9_", 1:9)

# Create a new variable phq9_total that sums the PHQ9 scores for rows with no NAs
data$phq9_total <- rowSums(data[, phq9_columns], na.rm = FALSE)

# For rows with NAs in any of the PHQ9 columns, set phq9_total to NA
data$phq9_total[!complete.cases(data[, phq9_columns])] <- NA




# Flourishing

# Select the Diener columns (Diener1 to Diener8)
diener_columns <- paste0("Diener", 1:8)

# Create a new variable diener_mean that calculates the mean of the Diener scores for rows with no NAs
data$diener_mean <- rowMeans(data[, diener_columns], na.rm = FALSE)

# For rows with NAs in any of the Diener columns, set diener_mean to NA
data$diener_mean[!complete.cases(data[, diener_columns])] <- NA

# Clean up data to remove individual items
data<-dplyr::select(data, Gender_Male, audit_total, phq9_total, diener_mean)


# Examine missingness
finalfit::missing_plot(data)

mcar_test(data)
data <- na.omit(data)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ View Descriptives  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~
describe(data)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Examine Histograms  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~
par(mfrow = c(1,3))
hist(data$audit_total, main = "AUDIT Scores")
hist(data$diener_mean, main = "Flourishing Scores")
hist(data$phq9_total, main = "PHQ-9 Scores")


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ View Correlation Matrix  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cor.plot(data[,2:4])


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Compare Means (t-tests)  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Test for equality of variances

var.test(data$audit_total ~ data$Gender_Male)
var.test(data$phq9_total ~ data$Gender_Male)
var.test(data$diener_mean ~ data$Gender_Male)

# None of the variances are equal across gender

var(na.omit(data[data$Gender_Male==1, "audit_total"]))
var(na.omit(data[data$Gender_Male==0, "audit_total"]))


var(na.omit(data[data$Gender_Male==1, "phq9_total"]))
var(na.omit(data[data$Gender_Male==0, "phq9_total"]))


var(na.omit(data[data$Gender_Male==1, "diener_mean"]))
var(na.omit(data[data$Gender_Male==0, "diener_mean"]))


t.test(data$audit_total ~ data$Gender_Male, var.equal = F) 
t.test(data$phq9_total ~ data$Gender_Male, var.equal = T)
t.test(data$diener_mean ~ data$Gender_Male, var.equal = F) 


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Multiple Linear Regression (MLR)  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# DV = Depression
# IVs = Gender, AUDIT, and Flourishing

par(mfrow=c(1,1))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Assumptions of MLR  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#1: Independence of observations (study design)
#2: No measurement error in X (reliable / valid measures used given target pop)
#3: Model is correctly specified

#4: Linear Relationship between each X & Y
#     Before running regression

plot(data$audit_total, data$phq9_total, xlab = "AUDIT", ylab = "Depression", main= "Plot of AUDIT and Depression")
fit<-lm(phq9_total~audit_total, data)
abline(fit, col="red")

plot(data$diener_mean, data$phq9_total, xlab = "Flourishing", ylab = "Depression", main= "Plot of Flourishing and Depression")
fit<-lm(phq9_total~diener_mean, data)
abline(fit, col="red")


####################### NOT LINEAR?: Look into exponential or quadradic regression (i.e., poloynomial regression)

fit<-lm(phq9_total~audit_total+diener_mean+Gender_Male, data)


#5: Homoskedasticity of residuals
#     Post-Regression
#           Look at the plot(fit) matrix
#             Uniform distribution of residuals around Y (0) in Resid. vs. Fitted?
#             Scale-Location graph's line sticking close to center (up & down's ok)?

####################### IF NOT: Look into Weighted Least Sq. Regression (WLS)

par(mfrow=c(2,2))

plot(fit)


#6: Independence of Residuals - also taps into #1
#     Durbin-Watson test must be NON-SIG (test is sensitive in with high n's)


library(car)
durbinWatsonTest(fit)



#7: Normally Distributed Residuals
#     Q-Q plot from plot(fit) should not deviate much from the line
#           Often happens at the tail ends.
###################### IF DEVIATING TOO MUCH: Increase Sample size, Transform the data and re-test, use WLS

plot(fit)

#8: No multicollinearity
# VIF should be less than 5, and CERTAINLY less than 10
vif(fit)


#9: No influential Outliers


################ Discrepancy: once modeled, the deviations along the y-axis

# studentized deleted residuals
#     Create new variable SDR1


# install.packages('olsrr')
library(olsrr)


# olsrr package: studentized deleted residuals
#
#
#  Threshold is for large samples by default, research a way
#   to change it to the more conservative value "2" (small n) "3-4"(n>100)
ols_plot_resid_stud(fit)


################ Influence: Both leverage & discrepancy.
# Standardized difference in fit (DFFIT)
# olsrr package:
#
#
# The default threshold is ALSO based on the large data set
# Research how to change this to the value of 1 (even tho it's very close)
ols_plot_dffits(fit)

# Cook's Distance
ols_plot_cooksd_bar(fit)

# Standardized DFBETA:
ols_plot_dfbetas(fit)



##~~~~~~~~~~~~~~~~~~~~~~
##  ~ View Results  ----
##~~~~~~~~~~~~~~~~~~~~~~

summary(fit)


##~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Robust Regression  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ONE OF THE WAYS TO DEAL WITH INFLUENTIAL OUTLIERS WITHOUT DELETING THEM
# OR TO REPORT THE DIFFERENCES IN ROBUST REG OUTCOMES WITH OUTLIERS PRESENT OR ABSENT


# Use the summaryR function (lower-case 's')
# FIRST, run the function below
# Chose the type of robust regression you wish to use "hc3", "hc0...1...2...4" hc3 is most common.
#     Best bet, choose the one with the most conservative output? -just my approach


# RUN THIS FUNCTION FIRST OR summaryR won't work!
summaryR <- function(model, type=c("hc3", "hc0", "hc1", "hc2", "hc4"), ...){
  
  if (!require(car)) stop("Required car package is missing.")
  
  type <- match.arg(type)
  V <- hccm(model, type=type)
  sumry <- summary(model)
  table <- coef(sumry)
  table[,2] <- sqrt(diag(V))
  table[,3] <- table[,1]/table[,2]
  table[,4] <- 2*pt(abs(table[,3]), df.residual(model), lower.tail=FALSE)
  
  sumry$coefficients <- table
  p <- nrow(table)
  hyp <- cbind(0, diag(p - 1))
  sumry$fstatistic[1] <- linearHypothesis(model, hyp,white.adjust=type)[2,"F"]
  sumry$type <- type
  
  return(sumry)
}


summaryR(fit, type="hc3")

confint(fit, level=0.95)

