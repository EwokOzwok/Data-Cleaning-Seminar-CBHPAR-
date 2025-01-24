* Encoding: UTF-8.
* Rename Variables.
RENAME VARIABLE
(B_Ethnicity_1 = E_CentralAmerican)
(B_Ethnicity_2 = E_Cuban).
Execute.


* Compute Variables.
COMPUTE 
Flourishing_Mean = mean.8(Diener1,Diener2,Diener3,Diener4,Diener5,Diener6,Diener7,Diener8).
COMPUTE
AUDIT_Total_Score = sum.10(AUDIT_1, AUDIT_2, AUDIT_3, AUDIT_4, AUDIT_5, AUDIT_6, AUDIT_7, AUDIT_8, AUDIT_9, AUDIT_10).
COMPUTE
PHQ9_Total_Score = sum.9(PHQ9_1,PHQ9_2,PHQ9_3,PHQ9_4,PHQ9_5,PHQ9_6,PHQ9_7,PHQ9_8,PHQ9_9).


* Add Lables to Newly Computed Variables.
VARIABLE LABELS
Flourishing_Mean 'Flourishing Mean'
AUDIT_Total_Score 'AUDIT Total Score'
PHQ9_Total_Score 'PHQ9 Total Score'.
Execute.

* Compute Dichotomous M = 1 F = 0 Variable.
COMPUTE
Male = 0.
FORMATS Male (F1).
IF (Gender = 1) Male = 1.
IF (Gender = 2) Male = 0.
IF(Gender > 2) Male = -1.
missing values Male (-1).
VARIABLE LEVEL Male (NOMINAL).
VALUE LABELS Male 0 'Female' 1 'Male'.
VARIABLE LABELS Male 'Dichotomous Gender (M/F)'.
Execute.


* Generate Descriptive Stats.
DESCRIPTIVES VARIABLES=PHQ9_Total_Score Flourishing_Mean AUDIT_Total_Score
  /STATISTICS=MEAN STDDEV MIN MAX.
Execute.



* Generate Histograms.
GRAPH
  /HISTOGRAM(NORMAL)=PHQ9_Total_Score
  /TITLE = 'Histogram of PHQ-9 Total Scores'.
GRAPH
  /HISTOGRAM(NORMAL)=AUDIT_Total_Score
  /TITLE = 'Histogram of AUDIT Total Scores'.
GRAPH
  /HISTOGRAM(NORMAL)=Flourishing_Mean
  /TITLE = 'Histogram of Flourishing Mean'.
EXECUTE.

*Levene's test syntax as pasted from Analyze - Compare Means - One-Way ANOVA.
ONEWAY Flourishing_Mean AUDIT_Total_Score PHQ9_Total_Score BY Male
/STATISTICS DESCRIPTIVES HOMOGENEITY
/MISSING ANALYSIS.
* Population Variances are not equal if p < .05.


* Independent Samples t-test.
T-TEST GROUPS=Male(1 0) 
  /MISSING=ANALYSIS 
  /VARIABLES=Flourishing_Mean AUDIT_Total_Score PHQ9_Total_Score 
  /CRITERIA=CI(.95).


* Multiple Regression with Diagnostics.
REGRESSION 
  /MISSING LISTWISE 
  /STATISTICS COEFF OUTS CI(95) R ANOVA 
  /CRITERIA=PIN(.05) POUT(.10) 
  /NOORIGIN 
  /DEPENDENT PHQ9_Total_Score 
  /METHOD=ENTER Flourishing_Mean AUDIT_Total_Score Male 
  /SCATTERPLOT=(*ZRESID ,*ZPRED) 
  /RESIDUALS DURBIN HISTOGRAM(ZRESID) NORMPROB(ZRESID) 
  /CASEWISE PLOT(ZRESID) OUTLIERS(3)
  /SAVE ZRESID.

GRAPH
  /SCATTERPLOT(BIVAR)=PHQ9_Total_Score WITH ZRE_1
  /MISSING=LISTWISE.
