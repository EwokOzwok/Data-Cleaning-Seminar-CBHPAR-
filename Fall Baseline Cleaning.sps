* Encoding: UTF-8.


* Delete Unneeded variables.
DELETE VARIABLES 
StartDate EndDate Status IPAddress Duration__in_seconds_ Finished ResponseId RecipientLastName RecipientFirstName RecipientEmail ExternalReference LocationLatitude LocationLongitude DistributionChannel UserLanguage InfConsent.


* Rename Variables.
RENAME VARIABLE
(BirthMonth=BirthMonth)
(BirthYear=BirthYear)
(Gender=Gender)
(Gender_7_TEXT=Gender_TEXT)
(B_Hispanic=Hispanic)
(B_Ethnicity_1=Ethn_centralam)
(B_Ethnicity_2=Ethn_cuban)
(B_Ethnicity_6=Ethn_dominican)
(B_Ethnicity_7=Ethn_mexican)
(B_Ethnicity_8=Ethn_puertorican)
(B_Ethnicity_9=Ethn_southam)
(B_Ethnicity_10=Ethn_other)
(B_Ethnicity_10_TEXT=Ethn_other_TXT)
(B_Race_1=Race_Black)
(B_Race_2=Race_White)
(B_Race_3=Race_AIAN)
(B_Race_4=Race_Asian)
(B_Race_5=Race_AsianIndian)
(B_Race_6=Race_Chinese)
(B_Race_7=Race_Filipino)
(B_Race_8=Race_Japanese)
(B_Race_9=Race_Korean)
(B_Race_10=Race_Vietnamese)
(B_Race_11=Race_OtherAsian)
(B_Race_12=Race_NH)
(B_Race_13=Race_Guamanian)
(B_Race_14=Race_Samoan)
(B_Race_15=Race_OtherPacIsland)
(B_Race_16=Race_Other)
(B_Race_16_TEXT=Race_Other_TXT)
(LangNotEnglishAtHome=LangNotEnglishAtHome)
(LangNotEnglishSpoken=LangNotEnglishSpoken)
(LangNotEnglishSpoken_2_TEXT=LangNotEnglishSpoken_TEXT)
(B_Transgender=Transgender)
(SexIdentity_1=Heterosexual)
(SexIdentity_2=Bisexual)
(SexIdentity_3=Gay_Lesbian)
(SexIdentity_4=Queer)
(SexIdentity_5=Pansexual)
(SexIdentity_6=Questioning)
(SexIdentity_7=Asexual)
(SexIdentity_8=SexIdentity_other)
(SexIdentity_8_TEXT=SexIdentity_other_TXT)
(RelationshipStatus=RelationshipStatus)
(Pregnant=Pregnant)
(Children=Children)
(ChildrenUnder18Nr=ChildrenUnder18Nr)
(ChildrenCustody=ChildrenCustody)
(ChildrenCustodyNr=ChildrenCustodyNr)
(ChildrenReunited=ChildrenReunited)
(ChildrenReunitedNr=ChildrenReunitedNr)
(B_ArmedForces=ArmedForces)
(ServicesTravelTime=ServicesTravelTime)
(HOMETYPE_N=HOMETYPE_N)
(COLLEGE=COLLEGE)
(ArrestedValue_1=ArrestedValue)
(ParoleOrProbation=ParoleOrProbation)
(HIV_RESULTS_N=HIV_RESULTS_N)
(ViralHepatitisStatus=ViralHepatitisStatus)
(KnowSA=KnowSA)
(UA_KnowSA=UA_KnowSA)
(KnowHIV=KnowHIV)
(UA_KnowHIV=UA_KnowHIV)
(HIncome=HIncome)
(UA_GPA=GPA)
(UA_CollegeYear=CollegeYear)
(M_AreYou_1=TransferStudent)
(M_AreYou_2=InternationalStudent)
(M_AreYou_3=Student_w_Disability)
(M_AreYou_4=VarsityAthlete)
(M_AreYou_5=FSL)
(M_AreYou_6=Student_in_Recovery)
(M_AreYou_7=Veteran)
(M_AreYou_8=EOP)
(M_AreYou_9=Areyou_Refused)
(UA_SocialMediaT=SocialMediaT)
(Aca_Discipline=Aca_Discipline)
(Aca_Discipline_TXT=Aca_Discipline_TXT)
(Perc_Fin_need1=Perc_Fin_need)
(TobRisk_cleanthis=TobRisk)
(RSKALC=RSKALC)
(RSKMJ=RSKMJ)
(RSKNDL_SHR=RSKNDL_SHR)
(NonRXOpioid_cleanthi=NonRXOpioid_Risk)
(RXOpioid_cleanthis=RXOpioid_Risk)
(RSKANYSEX_UNP=RSKANYSEX_UNP)
(RSKSEX_ALCDRG=RSKSEX_ALCDRG)
(CNTRL_REFUSECNDM=CNTRL_REFUSECNDM)
(B_AlcUse30_1=B_AlcUse30_1)
(AlcoholRoute=AlcoholRoute)
(OpioidUse_Dich=OpioidUse_Dich)
(OpioidsHeroinDays_1=OpioidsHeroinDays_1)
(OpioidsMorphineDays_1=OpioidsMorphineDays_1)
(OpioidsFentanylDays_1=OpioidsFentanylDays_1)
(OpioidsDilaudidDays_1=OpioidsDilaudidDays_1)
(OpioidsDemerolDays_1=OpioidsDemerolDays_1)
(OpioidsPercocetDays_1=OpioidsPercocetDays_1)
(OpioidsCodeineDays_1=OpioidsCodeineDays_1)
(OpioidsTylenolDays_1=OpioidsTylenolDays_1)
(OpioidsOxycoDays_1=OpioidsOxycoDays_1)
(OpioidsNonPresMethadoneDays_1=OpioidsNonPresMethadoneDays_1)
(OpioidsNonPresBupDays_1=OpioidsNonPresBupDays_1)
(OpioidsHeroinRoute=OpioidsHeroinRoute)
(OpioidsMorphineRoute=OpioidsMorphineRoute)
(OpioidsFentanylRoute=OpioidsFentanylRoute)
(OpioidsDilaudidRoute=OpioidsDilaudidRoute)
(OpioidsDemerolRoute=OpioidsDemerolRoute)
(OpioidsPercocetRoute=OpioidsPercocetRoute)
(OpioidsCodeineRoute=OpioidsCodeineRoute)
(OpioidsTylenolRoute=OpioidsTylenolRoute)
(OpioidsOxycoRoute=OpioidsOxycoRoute)
(OpioidsNonPresMethadoneRoute=OpioidsNonPresMethadoneRoute)
(OpioidsNonPresBupRoute=OpioidsNonPresBupRoute)
(B_AlcUse30_1.0=MJ30D)
(MarijuanaRoute=MarijuanaRoute)
(B_AlcUse30_1.1=SynthCannabis30D)
(SynthCannRoute=SynthCannRoute)
(SedativeUse_Dich=SedativeUse_Dich)
(SedativeDays_4=SedativeDays)
(HypnoDays_4=HypnoDays)
(BarbituratesDays_4=BarbituratesDays)
(AnxioBenzoDays_4=AnxioBenzoDays)
(SedativeDaysChain_10_4=SedativeDaysChain)
(SedativeRoute=SedativeRoute)
(HypnoRoute=HypnoRoute)
(BarbituratesRoute=BarbituratesRoute)
(AnxioBenzoRoute=AnxioBenzoRoute)
(SedativeRouteChain_16=SedativeRouteChain)
(STIMS_Dich=STIMS_Dich)
(CocaineDays_2=CocaineDays)
(CrackDays_2=CrackDays)
(MethamDays_2=MethamDays)
(StimMedsDays_2=StimMedsDays)
(S_ILL30ROA_Cocaine=S_ILL30ROA_Cocaine)
(S_ILL30ROA_Crack=S_ILL30ROA_Crack)
(S_ILL30ROA_Amph=S_ILL30ROA_Amph)
(S_ILL30ROA_StimMeds=S_ILL30ROA_StimMeds)
(InhPCP_Dich=InhPCP_Dich)
(PCPDays_2=PCPDays)
(InhalantsDays_2=InhalantsDays)
(S_ILL30ROA_Inh=S_ILL30ROA_Inh)
(S_ILL30ROA_PCP=S_ILL30ROA_PCP)
(Psychedelic1_Dich=Psychedelic1_Dich)
(MDMADays_2=MDMADays)
(LSDDays_2=LSDDays)
(MushroomDays_2=MushroomDays)
(MescalineDays_2=MescalineDays)
(S_ILL30ROA_MDMA=S_ILL30ROA_MDMA)
(S_ILL30ROA_LSD=S_ILL30ROA_LSD)
(S_ILL30ROA_Mush=S_ILL30ROA_Mush)
(S_ILL30ROA_Mesc=S_ILL30ROA_Mesc)
(Psychedelic2_Dich=Psychedelic_Dich)
(SalviaDays_2=SalviaDays)
(DMTDays_2=DMTDays)
(NonPrescGhbDays_2=NonPrescGhbDays)
(KetamineDays_2=KetamineDays)
(S_ILL30ROA_Salv=S_ILL30ROA_Salv)
(S_ILL30ROA_DMT=S_ILL30ROA_DMT)
(S_ILL30ROA_GHB=S_ILL30ROA_GHB)
(S_ILL30ROA_Ket=S_ILL30ROA_Ket)
(OtherDrugs_Dich=OtherDrugs_Dich)
(BathSaltsDays_2=BathSaltsDays)
(KratomDays_2=KratomDays)
(KhatDays_2=KhatDays)
(S_ILL30ROA_Salts=S_ILL30ROA_Salts)
(S_ILL30ROA_Krat=S_ILL30ROA_Krat)
(S_ILL30ROA_Khat=S_ILL30ROA_Khat)
(B_TobUse30_1=B_TobUse30)
(Tobacco_ROA=Tobacco_ROA)
(B_VapeUse30_1=B_VapeUse30)
(Nicotine_ROA=Nicotine_ROA)
(AUD_Dxs=AUD_Dxs)
(AlcMedNoneRcvdDxs_cl=AlcMedNoneRcvdDxs_cl)
(AlcMedExtRelNaltrexoneDoses_1=AlcMedExtRelNaltrexoneDoses)
(AlcMedDisulfiramDays_1=AlcMedDisulfiramDays)
(AlcMedAcamprosate_1=AlcMedAcamprosate)
(AlcMedAcamprosateDays_1=AlcMedAcamprosateDays)
(OUD_Dxs=OUD_Dxs)
(OpMedNoneRcvdDxs_cle=OpMedNoneRcvdDxs_cle)
(OpMedMethadoneDays_1=OpMedMethadoneDays)
(OpMedBuprenorphineDays_1=OpMedBuprenorphineDays)
(OpMedNaltrexoneDays_1=OpMedNaltrexoneDays)
(OpMedExtRelNaltrexoneDoses_1=OpMedExtRelNaltrexoneDoses)
(StimUD_Dxs=StimUD_Dxs)
(StimDisNoneRcvdDx_cl=StimDisNoneRcvdDx_cl)
(StimDisContingMgmtDays_1=StimDisContingMgmtDays)
(StimDisCommReinfDays_1=StimDisCommReinfDays)
(StimDisCBTDays_1=StimDisCBTDays)
(StimDisOtherEBIDays_1=StimDisOtherEBIDays)
(TUD_Dxs=TUD_Dxs)
(TUDNoneRcvdDiagnosed=TUDNoneRcvdDiagnosed)
(TUDNicReplaceDays_1=TUDNicReplaceDays)
(TUDBupropionDays_1=TUDBupropionDays)
(TUDVareniclineDays_1=TUDVareniclineDays)
(Overdose=Overdose)
(OD_InterventionChain_1=OD_Narcan)
(OD_InterventionChain_2=OD_EmergDept)
(OD_InterventionChain_3=OD_PCP)
(OD_InterventionChain_4=OD_HospitalAdmit)
(OD_InterventionChain_5=OD_Supervision)
(TxSUD=TxSUD)
(TxSUDWhen=TxSUDWhen)
(MHDiagnosis=MHDiagnosis)
(MHDxs_Chain_1=DxBriefPsych)
(MHDxs_Chain_2=DxDelusional)
(MHDxs_Chain_3=DxSchizoaffective)
(MHDxs_Chain_4=DxSchizophrenia)
(MHDxs_Chain_47=DxSchizotypal)
(MHDxs_Chain_5=DxSharedPsychotic)
(MHDxs_Chain_6=DxUnspecPsych)
(MHDxs_Chain_7=DxBipolar)
(MHDxs_Chain_8=DxMajorDepRecurr)
(MHDxs_Chain_9=DxMajorDepSingle)
(MHDxs_Chain_10=DxManicEp)
(MHDxs_Chain_11=DxPersistMood)
(MHDxs_Chain_12=DxUnspecMood)
(MHDxs_Chain_13=DxAgora)
(MHDxs_Chain_14=DxAgoraWithPD)
(MHDxs_Chain_15=DxAgoraUnspec)
(MHDxs_Chain_16=DxGAD)
(MHDxs_Chain_17=DxPanic)
(MHDxs_Chain_18=DxPhobic)
(MHDxs_Chain_19=DxSocialPhobia)
(MHDxs_Chain_20=DxSpecPhobia)
(MHDxs_Chain_21=DxExcoriation)
(MHDxs_Chain_22=DxHoarding)
(MHDxs_Chain_23=DxOCD)
(MHDxs_Chain_24=DxOCDMixed)
(MHDxs_Chain_25=DxAcuteStress)
(MHDxs_Chain_26=DxAdjustment)
(MHDxs_Chain_27=DxBodyDysmorph)
(MHDxs_Chain_28=DxDissocConvers)
(MHDxs_Chain_29=DxDissocID)
(MHDxs_Chain_30=DxPTSD)
(MHDxs_Chain_31=DxSomat)
(MHDxs_Chain_32=DxEating)
(MHDxs_Chain_33=DxSleep)
(MHDxs_Chain_34=DxAntisocial)
(MHDxs_Chain_35=DxAvoidant)
(MHDxs_Chain_36=DxBorderline)
(MHDxs_Chain_37=DxDependent)
(MHDxs_Chain_38=DxHistrionic)
(MHDxs_Chain_39=DxIntellect)
(MHDxs_Chain_40=DxObsessCompulsPers)
(MHDxs_Chain_41=DxOtherSpecPD)
(MHDxs_Chain_42=DxParanoid)
(MHDxs_Chain_43=DxPersonalityUnspec)
(MHDxs_Chain_44=DxDevelopmentalDis)
(MHDxs_Chain_45=DxSchizoidPD)
(VAP30D_1_1=VAP30D)
(M_Binge30_1=M_Binge30)
(UA_LastParty_NumDrk=UA_LastParty_NumDrk)
(UA_LastParty_Typical=UA_LastParty_Typical)
(INJECT30D_1_1=INJECT30D)
(DaysShareInjectionEq_1_1=DaysShareInjectionEq)
(HowManySexualPartner=HowManySexualPartner)
(UA_SharedStatus=UA_SharedStatus)
(UA_KnowStatus=UA_KnowStatus)
(M_HaveYouHadWithAMale=M_HaveYouHadWithAMale)
(M_HaveYouHadWithAFemale=M_HaveYouHadWithAFemale)
(M_HaveYouHadWithATransgender=M_HaveYouHadWithATransgender)
(M_HaveYouHadWithAMonogamousSignificantOther=M_HaveYouHadWithAMonogamousSignificantOther)
(M_HaveYouHadWithMultiplePartners=M_HaveYouHadWithMultiplePartners)
(M_HaveYouHadWithHivPositivePerson=M_HaveYouHadWithHivPositivePerson)
(M_HaveYouHadWithHepatitisPositivePerson=M_HaveYouHadWithHepatitisPositivePerson)
(M_HaveYouHadWithPersonWhoInjectsDrugs=M_HaveYouHadWithPersonWhoInjectsDrugs)
(M_HaveYouHadWithManWhoHasSexWithMen=M_HaveYouHadWithManWhoHasSexWithMen)
(HadSexForResources=HadSexForResources)
(ANYABUSE_3M=ANYABUSE_3M)
(LS1=LS1)
(LS2=LS2)
(LS3=LS3)
(PHQ9_1=PHQ9_1)
(PHQ9_2=PHQ9_2)
(PHQ9_3=PHQ9_3)
(PHQ9_4=PHQ9_4)
(PHQ9_5=PHQ9_5)
(PHQ9_6=PHQ9_6)
(PHQ9_7=PHQ9_7)
(PHQ9_8=PHQ9_8)
(PHQ9_9=PHQ9_9)
(PHQ9_10=PHQ9_10)
(UA_SUICIDE_Considered=UA_SUICIDE_Considered)
(UA_SUICIDE_Attempted=UA_SUICIDE_Attempted)
(AUDIT_1=AUDIT_1)
(AUDIT_2=AUDIT_2)
(AUDIT_3=AUDIT_3)
(AUDIT_4=AUDIT_4)
(AUDIT_5=AUDIT_5)
(AUDIT_6=AUDIT_6)
(AUDIT_7=AUDIT_7)
(AUDIT_8=AUDIT_8)
(AUDIT_9=AUDIT_9)
(AUDIT_10=AUDIT_10)
(DAST1=DAST1)
(DAST2=DAST2)
(DAST3=DAST3)
(DAST4=DAST4)
(DAST5=DAST5)
(DAST6=DAST6)
(DAST7_=DAST7_)
(DAST8=DAST8)
(DAST9=DAST9)
(DAST10=DAST10)
(RG_Part1_1=RG_Part1_1)
(RG_Part1_2=RG_Part1_2)
(RG_Part1_3=RG_Part1_3)
(RG_Part1_4=RG_Part1_4)
(RG_Part1_5=RG_Part1_5)
(RG_Part1_6=RG_Part1_6)
(RG_Part1_7=RG_Part1_7)
(RG_Part1_8=RG_Part1_8)
(RG_Part1_9=RG_Part1_9)
(RG_Part1_10=RG_Part1_10)
(RG_Part1_11=RG_Part1_11)
(RG_Part1_12=RG_Part1_12)
(RG_Part1_13=RG_Part1_13)
(RG_Part1_14=RG_Part1_14)
(RG_Part1_15=RG_Part1_15)
(RG_Part1_16=RG_Part1_16)
(RG_Part1_17=RG_Part1_17)
(RG_Part1_18=RG_Part1_18)
(RG_Part1_19=RG_Part1_19)
(RG_Part2_1=RG_Part2_1)
(RG_Part2_2=RG_Part2_2)
(RG_Part2_3=RG_Part2_3)
(PGSI_1=PGSI_1)
(PGSI_2=PGSI_2)
(PGSI_3=PGSI_3)
(PGSI_4=PGSI_4)
(PGSI_5=PGSI_5)
(PGSI_6=PGSI_6)
(PGSI_7=PGSI_7)
(PGSI_8=PGSI_8)
(PGSI_9=PGSI_9)
(GAMB_FinancialAid=GAMB_FinancialAid)
(Diener1=Diener1)
(Diener2=Diener2)
(Diener3=Diener3)
(Diener4=Diener4)
(Diener5=Diener5)
(Diener6=Diener6)
(Diener7=Diener7)
(Diener8=Diener8)
(BelongUA1=BelongUA1)
(PSS1=PSS1)
(PSS2=PSS2)
(PSS3=PSS3)
(PSS4=PSS4)
(PSS5=PSS5)
(PSS6=PSS6)
(PSS7=PSS7)
(PSS8=PSS8)
(PSS9=PSS9)
(PSS10=PSS10)
(AWAI1=AWAI1)
(AWAI2=AWAI2)
(AWAI3=AWAI3)
(AWAI4=AWAI4)
(AWAI5=AWAI5)
(AWAI6=AWAI6)
(AWAI7=AWAI7)
(AWAI8=AWAI8)
(AWAI9=AWAI9)
(AWAI10=AWAI10)
(AWAI11=AWAI11)
(Burnout1=Burnout1)
(Burnout2=Burnout2)
(Burnout3=Burnout3)
(Burnout4=Burnout4)
(Burnout5=Burnout5)
(Burnout6=Burnout6)
(Burnout7=Burnout7)
(Burnout8=Burnout8)
(Burnout9=Burnout9)
(Burnout10=Burnout10)
(Burnout11=Burnout11)
(Burnout12=Burnout12)
(Burnout13=Burnout13)
(Burnout14=Burnout14)
(Burnout15=Burnout15)
(SC0=SC0)
(SC1=SC1)
(SC2=SC2)
(SC3=SC3)
(SC4=SC4)
(PHQ9_SCORE=PHQ9_SCORE)
(AUDIT=AUDIT)
(DAST=DAST)
(RG_PART3_SCORE=RG_PART3_SCORE)
(FS_TOTAL=FS_TOTAL).
Execute.

***********************************************************************************
***********************************************************************************
***********************************************************************************

* Creating an Excel Code book. 
DISPLAY DICTIONARY.

* THEN right click the first table, copy special, as excel worksheet. 
* Paste first table into an excel worksheet
* REPEAT for the second table, pasting into a new excel worksheet. 


***********************************************************************************
***********************************************************************************
***********************************************************************************


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
