---
  title: "Personal hardship narrows the partisan gap in COVID-19 and climate change responses"
author: "Cornelius"
date: "6/8/2023"
output: 
  html_document: 
  code_download: true
toc: true
toc_depth: 2
toc_float: 
  collapsed: false
smooth_scroll: true
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```



```{r}
# Analysis conducted using
# R version 4.2.1 (2022-06-23) 
# on Platform: x86_64-apple-darwin17.0 (64-bit)
####################################

rm(list=ls(all=TRUE))
#dev.off()

# PACKAGES AND DATA ----------------------------------------------------------------
# tidyverse packages
library(dplyr) # Version 1.0.9
library(tidyr) # Version 1.2.0
library(stringr) # Version 1.4.0
# plotting
library(sjPlot) # Version 2.8.11
library(sjlabelled) # Version 1.2.0
library(ggplot2) # Version 3.3.6
library(corrplot) # Version 0.92
# misc
library(stargazer) # Version 5.2.3
library(xtable) # Version 1.8-4
library(qwraps2) # Version 0.5.2

```

##  Replication Materials for PNAS Personal hardship narrows the partisan gap in COVID-19 and climate change responses  


#  1. Introduction  

The public health risks posed by the COVID-19 pandemic have prompted various reactions from individuals and governments around the world. People's perspectives, responses, and actions during the epidemic were heavily influenced by partisan divisions in the United States. Concerns about the virus, efforts to avoid it, and backing for legislation to do so varied greatly between Democrats and Republicans. However, as the pandemic developed, it was intriguing to witness how first-hand reports of COVID-19 seemed to unite people across ideological lines. This study aims to examine the relationship between personal suffering, political allegiance, and responses to the COVID-19 pandemic and climate change. We seek to gain a better understanding of how people's experiences with these new hazards influence their views, opinions, and policy choices by studying the correlation between the two. We also investigate at how partisanship and experience shape public responses to crises like the COVID-19 outbreak and climate change. During the COVID-19 epidemic, social scientists have a unique opportunity to study how the public reacts to a rapidly evolving worldwide threat in the context of a severely divided society. The response was affected by the fact that the Republican Trump Administration and the Democratic Party leadership saw the health emergency through different lenses. Political gaps on values, risk perceptions, and preferred policies hardened as polarization quickly expanded throughout society. The growing splits may reflect differences in personal contacts with the virus as well as differences in partisanship, given the uneven distribution of experience with the virus across the United States. This research combines the insights of psychology and politics to examine the ways in which individuals' backgrounds and party identification shape their perspectives and policy preferences in the present. It is well-established that traumatic events can profoundly alter one's outlook and emotional state. However, studies on this topic have revealed that people's understanding and responses to climate change can be influenced by their ideological biases. Climate change studies highlight the two-way interaction between experience and prior fear, where one's views can modify one's interpretation and recollection of environmental threats and reinforce one's experience. We performed three waves of surveys among a broad representative sample of Americans, beginning shortly after the WHO declared COVID-19 a global pandemic, with the purpose of delving into the complex dynamics of partisanship and experience. Concerns about COVID-19 and desired policies in response to climate change were gathered via these questionnaires. By analyzing cross-sectional and longitudinal data, as well as COVID-19 incidence rates at the county level, we hoped to make sense of the complicated interplay between people's lived experiences, political allegiances, and responses to these threats. Learning more about what makes individuals react the way they do to public health crises and environmental problems is useful for policymakers, public health authorities, and environmental researchers. Analyzing the impact of personal suffering on bridging the party gap can provide light on how people respond to current obstacles and provide insight into how to resist partisan propaganda and worldviews. Furthermore, the results contribute to our understanding of the relationship between experience and partisanship and have major implications for effective communication, policy formation, and future research. We will present our findings, discuss their significance, and highlight research gaps in the following section. We think that by analyzing how people's backgrounds, political beliefs, and responses to the COVID-19 pandemic and climate change interact with one another, we can all gain a deeper understanding of this complex dynamic.


## 2. Data and methods

### 2.1. Data

The six modules used to collect data for the study covered a wide range of subjects, including extreme weather, climate change, COVID-19, trust and community, political beliefs, and demographics. The average time spent filling out the survey was 25 minutes, and this was despite the fact that participants had no idea which modules belonged in which group. The arrangement of the COVID-19 blocks and the climate change blocks was established by random chance. The second wave of the poll, conducted in June and July of 2020, was mostly focused on during the height of the COVID-19 outbreak in the United States. This poll went above and beyond its predecessors in its in-depth questioning of respondents' values, routines, and favored policies. The major evaluators utilized a 4-point scale to rank respondents' worries about COVID-19 and climate change. The survey results on the effects of COVID-19 on the economy, health, psychology, and society, as well as the effects of natural disasters, were used to build the explanatory factors. Other analyses that included in COVID-19 incidence rates at the county level employed risk and exposure from natural hazards as stand-ins for actual experience. Vulnerability to natural hazards was modeled using FEMA disaster alerts and the natural hazard risk index, and cumulative cases of COVID-19 were collected from Johns Hopkins University. As part of the study's embedded experiments, participants were assigned to receive either information on the costs of various COVID-19 mitigation measures or the identities of various political parties that support such policies. Information on the survey's basic structure, wave 2's principal focus, the primary variables measured, and the use of both individual and county-level measurements for COVID-19 and natural hazards are detailed in this section.
 [here](https://www.europeansocialsurvey.org/data/conditions_of_use.html).
 

```{r}
# Load data
load("C:/Users/User/Downloads/w1.Rdata")
load("C:/Users/User/Downloads/w2.rdata")
load("C:/Users/User/Downloads/w3.Rdata")
load("C:/Users/User/Downloads/df_set.Rdata")
load("C:/Users/User/Downloads/df_set_w1w2.Rdata")
load("C:/Users/User/Downloads/df_set_w2w3.Rdata")
load("C:/Users/User/Downloads/w2_noearthquake.Rdata")
```


```{r}

# Set plotting preferences
set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center")
control_vars <- c("cv_day_cases_cum_per100k_log", "dem_age", "dem_latino", "dem_income", "dem_educ", "dem_race_cat", "dem_gender_cat","dem_urban_cat", "Region", "dem_stcount_1_char", "SURVEY", "REPEATER", "weight_ANES")
```

```{r}
names("C:/Users/User/Downloads/w2.rdata")
```


## 3 Results

## 3 Analyses

The outcomes of several linear regression analyses are shown. Gender, age, ethnicity, race, income, education, region, a categorical variable denoting residential area (urban, suburban, or rural), and a dummy variable for repeat respondents are only few of the sociodemographic control factors used in the regression models. There was a deviation from the preregistration due to the addition of the dummy variable for repeat respondents, which was introduced to account for variations between respondents who took part in many online surveys and those who did not.

Depending on the context of the study, partisan identification is treated as a primary independent variable (H1) or a moderator (H2 through H4). The following tables contains the output of the analyses.

```{r echo=FALSE}
library(grid)
library(png)
# Create a new plot
plot.new()

# Load the image file
Table1 <- readPNG("C://Users//User//Downloads//Table1.PNG") 


x <- 0.5  # X-coordinate (in inches)
y <- 0.5  # Y-coordinate (in inches)
width <- 0.9  # Width of the image (in inches)
height <- 1.3 # Height of the image (in inches)

# Draw the image on the plot
grid.raster(Table1, x = x, y = y, width = width, height = height)



```




```{r echo=FALSE}

# Create a new plot
plot.new()

Table2 <- readPNG("C://Users//User//Downloads//Table2.PNG")
x <- 0.5  # X-coordinate (in inches)
y <- 0.5  # Y-coordinate (in inches)
width <- 0.9  # Width of the image (in inches)
height <- 1.3 # Height of the image (in inches)

# Draw the image on the plot
grid.raster(Table1, x = x, y = y, width = width, height = height)
```

```{r echo=FALSE}
# Create a new plot
plot.new()

# Load the image file
Table3 <- readPNG("C://Users//User//Downloads//Table3.PNG") 


x <- 0.5  # X-coordinate (in inches)
y <- 0.5  # Y-coordinate (in inches)
width <- 0.9  # Width of the image (in inches)
height <- 1.3 # Height of the image (in inches)

# Draw the image on the plot
grid.raster(Table1, x = x, y = y, width = width, height = height)

```


```{r echo=FALSE}

# Create a new plot
plot.new()

# Load the image file
Table5 <- readPNG("C://Users//User//Downloads//Table5.PNG") 


x <- 0.5  # X-coordinate (in inches)
y <- 0.5  # Y-coordinate (in inches)
width <- 0.9  # Width of the image (in inches)
height <- 1.3 # Height of the image (in inches)

# Draw the image on the plot
grid.raster(Table5, x = x, y = y, width = width, height = height)

```


```{r echo=FALSE}

# Create a new plot
plot.new()

# Load the image file
Table6 <- readPNG("C://Users//User//Downloads//Table6.PNG") 


x <- 0.5  # X-coordinate (in inches)
y <- 0.5  # Y-coordinate (in inches)
width <- 0.9  # Width of the image (in inches)
height <- 1.3 # Height of the image (in inches)

# Draw the image on the plot
grid.raster(Table5, x = x, y = y, width = width, height = height)

```

Trust in crisis institutions and actors is strongly connected with Republicans' stated personal experience with COVID-19. Those who have had more negative experiences tend to have more trust in these central figures. The relationship between expertise, political differences, anxiety, behavior, policy preferences, and trust is examined further through supplementary analyses and robustness checks. The goal is to check for the presence of partisan-motivated thinking.
The repercussions of COVID-19 have been more severely felt by Democrats than by Republicans. There used to be substantial disparities in reported experience based on party affiliation, but they no longer exist once demographic and geographic controls were incorporated to account for variance in illness exposure unrelated to party affiliation. Self-reported exposure to COVID-19 is in close agreement with incidence rates calculated at the county level, suggesting that objective incidence rates are related to self-reported exposure. Still, it's understood that Republicans in high-incidence counties may be fundamentally different from Republicans in low-incidence counties.


```{r}
### MAIN MANUSCRIPT FIGURES AND TABLES

# Figure 1: Worry, Mask wearing, WTP ----------------------------------------------------------------
worry_party_w2 <- lm(cv4 ~ party_id, data=data.frame(w2), weights = weight_ANES)
#png(file = "TABLES_FIGURES/worry_party_w2.png",width=1200,height=1200, res=300)
plot_model(worry_party_w2, type="pred",terms="party_id") + ylim(2.7,3.6)  +
  labs(x="Party ID", y="Worry - Covid", title="Worry")
dev.off()

cvmask_party_w2 <- lm(cv_mask ~ party_id, data=w2, weights= weight_ANES)
png(file = "TABLES_FIGURES/cvmask_party_w2.png",width=1200,height=1200, res=300)
plot_model(cvmask_party_w2, type="pred", terms="party_id") + ylim(3.8,4.7) +
  labs(x="Party ID", y="Mask Wearing", title="Mask Wearing")
dev.off()

cvSolve_w2 <- w2[,c("cvSolve0", "cvSolve1", "cvSolve10", "cvSolve50", "cvSolve100", "cc6", "cv4","negexpindex_CV_log_revised", "party_id", "party_id_dembase", control_vars)]
cvSolve_w2$issue <- "CV"
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve0)]  <- cvSolve_w2$cvSolve0[!is.na(cvSolve_w2$cvSolve0)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve1)]  <- cvSolve_w2$cvSolve1[!is.na(cvSolve_w2$cvSolve1)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve10)]  <- cvSolve_w2$cvSolve10[!is.na(cvSolve_w2$cvSolve10)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve100)]  <- cvSolve_w2$cvSolve100[!is.na(cvSolve_w2$cvSolve100)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve50)]  <- cvSolve_w2$cvSolve50[!is.na(cvSolve_w2$cvSolve50)] 
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve0)] <- "0"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve1)] <- "1"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve10)] <- "10"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve100)] <- "100"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve50)] <- "50"
cvSolve_w2$amount <- as.factor(cvSolve_w2$amount)

wtp_solve_party_w2_nocont <- lm(approval ~ amount*party_id, data=cvSolve_w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/wtp_solve_party_w2_fig1_nocontrols.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_party_w2_nocont , type="int", legend.title = "Party ID", colors=c("red2", "blue2", "violet")) + ylim(2,4.5) + aes(color = group, shape=group) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Policy Support", color="Party ID", shape="Party ID")  
dev.off()
```



```{r}



# Figure 2: Copartisan messenger ----------------------------------------------------------------
x <- data.frame(df_set[,c("cvccAirDemHealth",  "cvccAirDemCC", "cvccAirRepHealth","cvccAirRepCC", "cvccAirHealth", "cvccAirCC", "WAVE", "party_id","party_id_dembase", control_vars)])
x$cvccAir_value[!is.na(x$cvccAirDemHealth)] <- x$cvccAirDemHealth[!is.na(x$cvccAirDemHealth)]
x$cvccAir_value[!is.na(x$cvccAirDemCC)] <- x$cvccAirDemCC[!is.na(x$cvccAirDemCC)]
x$cvccAir_value[!is.na(x$cvccAirRepHealth)] <- x$cvccAirRepHealth[!is.na(x$cvccAirRepHealth)]
x$cvccAir_value[!is.na(x$cvccAirRepCC)] <- x$cvccAirRepCC[!is.na(x$cvccAirRepCC)]
x$cvccAir_value[!is.na(x$cvccAirHealth)] <- x$cvccAirHealth[!is.na(x$cvccAirHealth)]
x$cvccAir_value[!is.na(x$cvccAirCC)] <- x$cvccAirCC[!is.na(x$cvccAirCC)]
x$cvccAir_messenger[!is.na(x$cvccAirDemHealth)] <- "Dem"
x$cvccAir_messenger[!is.na(x$cvccAirDemCC)] <- "Dem"
x$cvccAir_messenger[!is.na(x$cvccAirRepHealth)] <- "Rep"
x$cvccAir_messenger[!is.na(x$cvccAirRepCC)] <- "Rep"
x$cvccAir_messenger[!is.na(x$cvccAirHealth)] <- "Non-Partisan"
x$cvccAir_messenger[!is.na(x$cvccAirCC)] <- "Non-Partisan"
x$cvccAir_messenger <- as.factor(x$cvccAir_messenger)
x$cvccAir_issue[!is.na(x$cvccAirDemHealth)] <- "CV"
x$cvccAir_issue[!is.na(x$cvccAirRepHealth)] <- "CV"
x$cvccAir_issue[!is.na(x$cvccAirHealth)] <- "CV"
x$cvccAir_issue[!is.na(x$cvccAirDemCC)] <- "CC"
x$cvccAir_issue[!is.na(x$cvccAirRepCC)] <- "CC"
x$cvccAir_issue[!is.na(x$cvccAirCC)] <- "CC"
x$cvccAir_copartisan <- NA
x$cvccAir_copartisan[x$party_id=="Rep" & x$cvccAir_messenger=="Dem"] <- "No"
x$cvccAir_copartisan[x$party_id=="Dem" & x$cvccAir_messenger=="Rep"] <- "No"
x$cvccAir_copartisan[x$party_id=="Rep" & x$cvccAir_messenger=="Rep"] <- "Yes"
x$cvccAir_copartisan[x$party_id=="Dem" & x$cvccAir_messenger=="Dem"] <- "Yes"
x$cvccAir_copartisan[x$cvccAir_messenger=="Non-Partisan"] <- NA
x$cvccAir_copartisan <- as.factor(x$cvccAir_copartisan)
x$cvccAir_messenger <- relevel(x$cvccAir_messenger, "Rep")
table(x$cvccAir_copartisan)

cvccAir_messenger_CV_w2 <- lm(cvccAir_value ~ party_id*cvccAir_messenger  + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region+ REPEATER, data=x , subset=cvccAir_issue=="CV" & WAVE==2)
png(file = "TABLES_FIGURES/air_messenger_cv_w2.png",width=1500,height=1200, res=300)
plot_model(cvccAir_messenger_CV_w2, type="int", colors = c("red2", "blue2", "grey"))  + aes(color = group, shape=group)+ 
  labs(fill="Messenger", x="Respondent Party ID", y="Approval for Emissions Reduction Policy", title="", color="Messenger", shape="Messenger") + ylim(2.9,4.5)
dev.off()

# Figure 3: Worry each wave -----------------------------------------------
worry_percexp_byparty_w1 <- lm(cv4 ~ negexpindex_CV_log_revised*party_id  + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_percexp_byparty_w1.png",width=1200,height=1200, res=300)
plot_model(worry_percexp_byparty_w1, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +aes(color = group, linetype=group) +
  labs(x="Perceived Negative Experience - Covid", y="Worry - Covid", title="Wave 1", color="Party ID", linetype="Party ID")  + ylim(2,4) + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center")
dev.off()

worry_percexp_byparty_w2 <- lm(cv4 ~ negexpindex_CV_log_revised*party_id  + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_percexp_byparty_w2.png",width=1200,height=1200, res=300)
plot_model(worry_percexp_byparty_w2, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +aes(color = group, linetype=group) +
  labs(x="Perceived Negative Experience - Covid", y="Worry - Covid", title="Wave 2", color="Party ID", linetype="Party ID")  +ylim(2,4) + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center")
dev.off()

worry_percexp_byparty_w3 <- lm(cv4 ~ negexpindex_CV_log_revised*party_id  + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_percexp_byparty_w3.png",width=1200,height=1200, res=300)
plot_model(worry_percexp_byparty_w3, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +aes(color = group, linetype=group) +
  labs(x="Perceived Negative Experience - Covid", y="Worry - Covid", title="Wave 3", color="Party ID", linetype="Party ID")  +ylim(2,4) + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center")
dev.off()

# Table 1: Worry ----------------------------------------------------------
cv4 <- lm(cv4_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male","Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cv4$AIC <- AIC(cv4)
cat(stargazer(cv4, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry (Standardized)"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worry.tex")

# Figure 4: WTP Solve by Exp -----------------------------------------------------
wtp_solve_exp_w2_rep <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, subset = party_id=="Rep")
wtp_solve_exp_w2_dem <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, subset = party_id=="Dem")

png(file = "TABLES_FIGURES/wtp_solve_exp_w2_rep.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_exp_w2_rep , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Covid-19 - Republicans",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightpink","red2"),labels=c("Min","Max"))
dev.off()

png(file = "TABLES_FIGURES/wtp_solve_exp_w2_dem.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_exp_w2_dem , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Covid-19 - Democrats",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightblue","blue2"),labels=c("Min","Max"))
dev.off()

### SUPPLEMENTARY MATERIALS FIGURES AND TABLES

# SM Figure 3: Worry by Wave -----------------------------------------------------
worry_wave_123 <- lm(cv4 ~ WAVE*party_id, data=df_set, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_party_123.png",width=1200,height=1200, res=300)
plot_model(worry_wave_123, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  ylim(2.5,3.6) +
  labs(x="Wave", y="Mean Value of Worry - Covid", title="") + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center") 
dev.off()

# SM Figure 4: Distancing, Masking ----------------------------------------
pol13_wave_123 <- lm(pol13_distancingworthcost ~ WAVE*party_id, data=df_set, weights = weight_ANES)
png(file = "TABLES_FIGURES/pol13_wave_123.png",width=1200,height=1200, res=300)
plot_model(pol13_wave_123, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of Social Distancing Worth Cost", title="") 
dev.off()

cvmask_wave_23 <- lm(cv_mask ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/cvmask_wave_23.png",width=1200,height=1200, res=300)
plot_model(cvmask_wave_23, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of Mask Wearing", title="") 
dev.off()


# SM Figure 5-9: Policy by wave/party ---------------------------------------

cvcc5_wave_123 <- lm(cvcc5 ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/cvcc5_wave_123.png",width=1200,height=1200, res=300)
plot_model(cvcc5_wave_123, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of Important to Self-Isolate", title="") 
dev.off()

cv_vaccine_wave_23 <- lm(cv_vaccine ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/cv_vaccine_wave_23.png",width=1200,height=1200, res=300)
plot_model(cv_vaccine_wave_23, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of Support Vaccine", title="") 
dev.off()

cv_late.ind_slow_isolate_wave_2 <- lm(cv_late.ind_slow_isolate ~ party_id, data=w2, weights= weight_ANES)
png(file = "TABLES_FIGURES/cv_late.ind_slow_isolate_wave_2.png",width=1200,height=1200, res=300)
plot_model(cv_late.ind_slow_isolate_wave_2, type="pred",terms="party_id") + labs(x="Party ID", y="Mean Value of Slow to Self-Isolate", title="")
dev.off()

cv_late.pub_state_slow_SD_wave_2 <- lm(cv_late.pub_state_slow_SD ~ party_id, data=w2, weights= weight_ANES)
png(file = "TABLES_FIGURES/cv_late.pub_state_slow_SD_wave_2.png",width=1200,height=1200, res=300)
plot_model(cv_late.pub_state_slow_SD_wave_2, type="pred",terms="party_id") + labs(x="Party ID", y="Mean Value of State Slow to Social Dist.", title="")
dev.off()

cv_reopen_reverse <- lm(cv_reopen_reverse ~ party_id, data=w2, weights= weight_ANES)
png(file = "TABLES_FIGURES/cv_reopen_reverse_wave_2.png",width=1200,height=1200, res=300)
plot_model(cv_reopen_reverse, type="pred",terms="party_id") + labs(x="Party ID", y="Mean Value of Oppose Rapid Reopening", title="")
dev.off()

cvIO_wave23 <- lm(cvIO ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/cvIO_wave23.png",width=1200,height=1200, res=300)
plot_model(cvIO_wave23, type="int", colors = c("red2", "blue2", "violet"), show.legend = F, legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of IO Global Effort", title="") + ylim(2.8,4.5)
dev.off()

cvGovt_wave23 <- lm(cvGovt ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/cvGovt_wave23.png",width=1200,height=1200, res=300)
plot_model(cvGovt_wave23, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of National Global Effort", title="") + ylim(2.8,4.5)
dev.off()

pol_trust_cdc_wave123 <- lm(pol_trust_cdc ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/pol_trust_cdc_wave123.png",width=1200,height=1200, res=300)
plot_model(pol_trust_cdc_wave123, type="int", colors = c("red2", "blue2", "violet"),show.legend = F, legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of Trust in CDC", title="") + ylim(2,3.5)
dev.off()

pol_trust_news_wave123 <- lm(pol_trust_news ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/pol_trust_news_wave123.png",width=1200,height=1200, res=300)
plot_model(pol_trust_news_wave123, type="int", colors = c("red2", "blue2", "violet"), show.legend = F,legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of Trust in News", title="") + ylim(2,3.5)
dev.off()

pol_trust_sci_wave123 <- lm(pol_trust_sci ~ WAVE*party_id, data=df_set, weights= weight_ANES)
png(file = "TABLES_FIGURES/pol_trust_sci_wave123.png",width=1200,height=1200, res=300)
plot_model(pol_trust_sci_wave123, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  labs(x="Wave", y="Mean Value of Trust in Scientists", title="") + ylim(2,3.5)
dev.off()

# SM Table 4: Partisan messenger ----------------------------------------
x <- data.frame(df_set[,c("cvccAirDemHealth",  "cvccAirDemCC", "cvccAirRepHealth","cvccAirRepCC", "cvccAirHealth", "cvccAirCC", "WAVE", "party_id","party_id_dembase", control_vars)])
x$cvccAir_value[!is.na(x$cvccAirDemHealth)] <- x$cvccAirDemHealth[!is.na(x$cvccAirDemHealth)]
x$cvccAir_value[!is.na(x$cvccAirDemCC)] <- x$cvccAirDemCC[!is.na(x$cvccAirDemCC)]
x$cvccAir_value[!is.na(x$cvccAirRepHealth)] <- x$cvccAirRepHealth[!is.na(x$cvccAirRepHealth)]
x$cvccAir_value[!is.na(x$cvccAirRepCC)] <- x$cvccAirRepCC[!is.na(x$cvccAirRepCC)]
x$cvccAir_value[!is.na(x$cvccAirHealth)] <- x$cvccAirHealth[!is.na(x$cvccAirHealth)]
x$cvccAir_value[!is.na(x$cvccAirCC)] <- x$cvccAirCC[!is.na(x$cvccAirCC)]
x$cvccAir_messenger[!is.na(x$cvccAirDemHealth)] <- "Dem"
x$cvccAir_messenger[!is.na(x$cvccAirDemCC)] <- "Dem"
x$cvccAir_messenger[!is.na(x$cvccAirRepHealth)] <- "Rep"
x$cvccAir_messenger[!is.na(x$cvccAirRepCC)] <- "Rep"
x$cvccAir_messenger[!is.na(x$cvccAirHealth)] <- "Non-Partisan"
x$cvccAir_messenger[!is.na(x$cvccAirCC)] <- "Non-Partisan"
x$cvccAir_messenger <- as.factor(x$cvccAir_messenger)
x$cvccAir_issue[!is.na(x$cvccAirDemHealth)] <- "CV"
x$cvccAir_issue[!is.na(x$cvccAirRepHealth)] <- "CV"
x$cvccAir_issue[!is.na(x$cvccAirHealth)] <- "CV"
x$cvccAir_issue[!is.na(x$cvccAirDemCC)] <- "CC"
x$cvccAir_issue[!is.na(x$cvccAirRepCC)] <- "CC"
x$cvccAir_issue[!is.na(x$cvccAirCC)] <- "CC"
x$cvccAir_copartisan <- NA
x$cvccAir_copartisan[x$party_id=="Rep" & x$cvccAir_messenger=="Dem"] <- "No"
x$cvccAir_copartisan[x$party_id=="Dem" & x$cvccAir_messenger=="Rep"] <- "No"
x$cvccAir_copartisan[x$party_id=="Rep" & x$cvccAir_messenger=="Rep"] <- "Yes"
x$cvccAir_copartisan[x$party_id=="Dem" & x$cvccAir_messenger=="Dem"] <- "Yes"
x$cvccAir_copartisan[x$cvccAir_messenger=="Non-Partisan"] <- NA
x$cvccAir_copartisan <- as.factor(x$cvccAir_copartisan)
x$cvccAir_messenger <- relevel(x$cvccAir_messenger, "Dem")
cvccAir_messenger_CV_w2 <- lm(cvccAir_value ~ cvccAir_messenger*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region+ REPEATER, data=x , subset=cvccAir_issue=="CV" & WAVE==2)
cvccAir_messenger_CV_copart_w2 <- lm(cvccAir_value ~ cvccAir_copartisan*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region+ REPEATER, data=x , subset=cvccAir_issue=="CV" & WAVE==2)
stargazer(cvccAir_messenger_CV_w2,cvccAir_messenger_CV_copart_w2)
varlabels <- c("Messenger: Republican", "Messenger: Non Partisan", "Copartisan",
               "Respondent: Republican", "Respondent: Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Messenger: Republican * Respondent: Republican", "Messenger: Non Partisan * Respondent: Republican",
               "Messenger: Republican * Respondent: Independent", "Messenger: Non Partisan * Respondent: Independent",
               "Copartisan * Republican")
cvccAir_messenger_CV_w2$AIC <- AIC(cvccAir_messenger_CV_w2)
cvccAir_messenger_CV_copart_w2$AIC <- AIC(cvccAir_messenger_CV_copart_w2)
cat(stargazer(cvccAir_messenger_CV_w2,cvccAir_messenger_CV_copart_w2,
              float=FALSE, dep.var.labels=c("Approval for Emissions Reduction Policy - Covid"),
              covariate.labels = varlabels, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              df = F,no.space = T), file = "TABLES_FIGURES/emissions_cv_w2.tex", sep="\n")

# SM Table 5: Partisan messenger ----------------------------------------

z_w2 <- data.frame(w2[,c("negexpindex_CV_log_revised","cvcc9_cv", "cv12_Dem",  "cv12_Rep", "cv12_Control", "party_id","party_id_dembase", control_vars)])
z_w2$cv12_value[!is.na(z_w2$cv12_Dem)] <- z_w2$cv12_Dem[!is.na(z_w2$cv12_Dem)]
z_w2$cv12_value[!is.na(z_w2$cv12_Rep)] <- z_w2$cv12_Rep[!is.na(z_w2$cv12_Rep)]
z_w2$cv12_value[!is.na(z_w2$cv12_Control)] <- z_w2$cv12_Control[!is.na(z_w2$cv12_Control)]
z_w2$cv12_messenger[!is.na(z_w2$cv12_Dem)] <- "Dem"
z_w2$cv12_messenger[!is.na(z_w2$cv12_Rep)] <- "Rep"
z_w2$cv12_messenger[!is.na(z_w2$cv12_Control)] <- "Non-Partisan"
z_w2$cv12_messenger <- as.factor(z_w2$cv12_messenger)
z_w2$cv12_messenger <- relevel(z_w2$cv12_messenger, "Dem")
z_w2$cv12_copartisan <- NA
z_w2$cv12_copartisan[z_w2$party_id=="Rep" & z_w2$cv12_messenger=="Dem"] <- "No"
z_w2$cv12_copartisan[z_w2$party_id=="Dem" & z_w2$cv12_messenger=="Rep"] <- "No"
z_w2$cv12_copartisan[z_w2$party_id=="Rep" & z_w2$cv12_messenger=="Rep"] <- "Yes"
z_w2$cv12_copartisan[z_w2$party_id=="Dem" & z_w2$cv12_messenger=="Dem"] <- "Yes"
z_w2$cv12_copartisan <- as.factor(z_w2$cv12_copartisan)
cv12_w2 <- lm(cv12_value ~ cv12_messenger*party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=z_w2, weights= weight_ANES)
cv12_copart_w2 <- lm(cv12_value ~ cv12_copartisan*party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=z_w2, subset=cv12_messenger !="Non-Partisan")
varlabels <- c("Messenger: Non Partisan","Messenger: Republican", 
               "Co-Partisan",
               "Respondent: Republican", "Respondent: Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Messenger: Non Partisan * Respondent: Republican","Messenger: Republican * Respondent: Republican",
               "Messenger: Non Partisan * Respondent: Independent","Messenger: Republican * Respondent: Independent",
               "Co-Partisan * Respondent: Republican")
cv12_w2$AIC <- AIC(cv12_w2)
cv12_copart_w2$AIC <- AIC(cv12_copart_w2)
cat(stargazer(cv12_w2,cv12_copart_w2,float=FALSE, dep.var.labels=c("Approval for Mask Policy"),
              covariate.labels = varlabels,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),df = F,no.space = T), file = "TABLES_FIGURES/mask_w2_dem.tex", sep="\n")

# SM Figure 9; Table 6: WTP CV by party -------------------------------------------

cvComp_w2 <- w2[,c("cvComp0", "cvComp1", "cvComp10", "cvComp50", "cvComp100", "cc6", "cv4","negexpindex_CV_log_revised", "party_id", "party_id_dembase",control_vars)]
cvComp_w2$issue <- "CV"
cvComp_w2$approval[!is.na(cvComp_w2$cvComp0)]  <- cvComp_w2$cvComp0[!is.na(cvComp_w2$cvComp0)] 
cvComp_w2$approval[!is.na(cvComp_w2$cvComp1)]  <- cvComp_w2$cvComp1[!is.na(cvComp_w2$cvComp1)] 
cvComp_w2$approval[!is.na(cvComp_w2$cvComp10)]  <- cvComp_w2$cvComp10[!is.na(cvComp_w2$cvComp10)] 
cvComp_w2$approval[!is.na(cvComp_w2$cvComp100)]  <- cvComp_w2$cvComp100[!is.na(cvComp_w2$cvComp100)] 
cvComp_w2$approval[!is.na(cvComp_w2$cvComp50)]  <- cvComp_w2$cvComp50[!is.na(cvComp_w2$cvComp50)] 
cvComp_w2$amount[!is.na(cvComp_w2$cvComp0)] <- "0"
cvComp_w2$amount[!is.na(cvComp_w2$cvComp1)] <- "1"
cvComp_w2$amount[!is.na(cvComp_w2$cvComp10)] <- "10"
cvComp_w2$amount[!is.na(cvComp_w2$cvComp100)] <- "100"
cvComp_w2$amount[!is.na(cvComp_w2$cvComp50)] <- "50"
cvComp_w2$amount <- as.factor(cvComp_w2$amount)

cvSolve_w2 <- w2[,c("cvSolve0", "cvSolve1", "cvSolve10", "cvSolve50", "cvSolve100", "cc6", "cv4","negexpindex_CV_log_revised", "party_id", "party_id_dembase", control_vars)]
cvSolve_w2$issue <- "CV"
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve0)]  <- cvSolve_w2$cvSolve0[!is.na(cvSolve_w2$cvSolve0)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve1)]  <- cvSolve_w2$cvSolve1[!is.na(cvSolve_w2$cvSolve1)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve10)]  <- cvSolve_w2$cvSolve10[!is.na(cvSolve_w2$cvSolve10)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve100)]  <- cvSolve_w2$cvSolve100[!is.na(cvSolve_w2$cvSolve100)] 
cvSolve_w2$approval[!is.na(cvSolve_w2$cvSolve50)]  <- cvSolve_w2$cvSolve50[!is.na(cvSolve_w2$cvSolve50)] 
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve0)] <- "0"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve1)] <- "1"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve10)] <- "10"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve100)] <- "100"
cvSolve_w2$amount[!is.na(cvSolve_w2$cvSolve50)] <- "50"
cvSolve_w2$amount <- as.factor(cvSolve_w2$amount)

wtp_solve_party_w2_png <- lm(approval ~ amount*party_id + negexpindex_CV_log_revised + dem_age  + dem_income + dem_educ + dem_latino+ dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/wtp_solve_party_w2.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_party_w2_png , type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Wave 2")
dev.off()

wtp_comp_party_w2_png <- lm(approval ~ amount*party_id + negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvComp_w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/wtp_comp_party_w2.png",width=1200,height=1200, res=300)
plot_model(wtp_comp_party_w2_png , type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Compensation", title="Wave 2")
dev.off()


wtp_comp_party_w2 <- lm(approval ~ amount*party_id_dembase + negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvComp_w2, weights = weight_ANES)
wtp_solve_party_w2 <- lm(approval ~ amount*party_id_dembase + negexpindex_CV_log_revised + dem_age  + dem_income + dem_educ + dem_latino+ dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, weights = weight_ANES)

varlabels_wtp_party <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", 
                          "Republican", "Independent", "Negative Experience Index",
                          "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                          "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                          "Amount - 1 * Republican", "Amount - 10 * Republican",
                          "Amount - 100 * Republican","Amount - 50 * Republican",
                          "Amount - 1 * Independent", "Amount - 10 * Independent",
                          "Amount - 100 * Independent","Amount - 50 * Independent")

wtp_comp_party_w2$AIC <- AIC(wtp_comp_party_w2)
wtp_solve_party_w2$AIC <- AIC(wtp_solve_party_w2)

cat(stargazer(wtp_comp_party_w2, wtp_solve_party_w2,
              covariate.labels = varlabels_wtp_party,
              float=FALSE,  dep.var.labels=c("Support for Policy"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Dependent Variable", "Compensation", "Mitigation")))
    , file = "TABLES_FIGURES/wtp_party_cv.tex", sep="\n")


# SM Table 7: WTP CV by Exp -----------------------------------------------

wtp_comp_exp_w2 <- lm(approval ~ amount*negexpindex_CV_log_revised + party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvComp_w2, weights = weight_ANES)
wtp_solve_exp_w2 <- lm(approval ~ amount*negexpindex_CV_log_revised + party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, weights = weight_ANES)

stargazer(wtp_comp_exp_w2, wtp_solve_exp_w2)
varlabels_wtp_exp <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", "Negative Experience Index",
                        "Republican", "Independent",
                        "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "Amount - 1 * Negative Experience", "Amount - 10 * Negative Experience",
                        "Amount - 100 * Negative Experience","Amount - 50 * Negative Experience")
wtp_comp_exp_w2$AIC <- AIC(wtp_comp_exp_w2)
wtp_solve_exp_w2$AIC <- AIC(wtp_solve_exp_w2)
cat(stargazer(wtp_comp_exp_w2, wtp_solve_exp_w2,
              covariate.labels = varlabels_wtp_exp,
              float=FALSE, dep.var.labels=c("Support for Policy"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Dependent Variable", "Compensation", "Mitigation")))
    , file = "TABLES_FIGURES/wtp_exp_cv.tex", sep="\n")

# SM Figure 10-11: WTP CV by party and experience -------------------------
wtp_comp_exp_w2_rep <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvComp_w2, subset = party_id=="Rep")
wtp_comp_exp_w2_dem <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvComp_w2, subset = party_id=="Dem")
png(file = "TABLES_FIGURES/wtp_comp_exp_w2_rep.png",width=1200,height=1200, res=300)
plot_model(wtp_comp_exp_w2_rep , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Compensation", title="Covid-19 - Republicans",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightpink","red2"),labels=c("Min","Max"))
dev.off()
png(file = "TABLES_FIGURES/wtp_comp_exp_w2_dem.png",width=1200,height=1200, res=300)
plot_model(wtp_comp_exp_w2_dem , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Compensation", title="Covid-19 - Democrats",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightblue","blue2"),labels=c("Min","Max"))
dev.off()

wtp_solve_exp_w2_rep <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, subset = party_id=="Rep")
wtp_solve_exp_w2_dem <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, subset = party_id=="Dem")
png(file = "TABLES_FIGURES/wtp_solve_exp_w2_rep.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_exp_w2_rep , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Covid-19 - Republicans",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightpink","red2"),labels=c("Min","Max"))
dev.off()
png(file = "TABLES_FIGURES/wtp_solve_exp_w2_dem.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_exp_w2_dem , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Covid-19 - Democrats",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightblue","blue2"),labels=c("Min","Max"))
dev.off()

# SM Table 8-9: WTP by experience by party --------------------------------
wtp_comp_exp_w2_rep <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvComp_w2, subset = party_id=="Rep")
wtp_comp_exp_w2_dem <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvComp_w2, subset = party_id=="Dem")
wtp_comp_exp_w2_rep$AIC <- AIC(wtp_comp_exp_w2_rep)
wtp_comp_exp_w2_dem$AIC <- AIC(wtp_comp_exp_w2_dem)

varlabels_wtp_exp <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", "Negative Experience Index",
                        "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "Amount - 1 * Negative Experience", "Amount - 10 * Negative Experience",
                        "Amount - 100 * Negative Experience","Amount - 50 * Negative Experience")

cat(stargazer(wtp_comp_exp_w2_rep, wtp_comp_exp_w2_dem,
              covariate.labels = varlabels_wtp_exp,
              float=FALSE,  dep.var.labels=c("Support for Compensation"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Subsample", "Republicans", "Democrats")))
    , file = "TABLES_FIGURES/wtp_comp_exp_party.tex", sep="\n")

wtp_solve_exp_w2_rep <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, subset = party_id=="Rep")
wtp_solve_exp_w2_dem <- lm(approval ~ amount*negexpindex_CV_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=cvSolve_w2, subset = party_id=="Dem")
wtp_solve_exp_w2_rep$AIC <- AIC(wtp_solve_exp_w2_rep)
wtp_solve_exp_w2_dem$AIC <- AIC(wtp_solve_exp_w2_dem)

varlabels_wtp_exp <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", "Negative Experience Index",
                        "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "Amount - 1 * Negative Experience", "Amount - 10 * Negative Experience",
                        "Amount - 100 * Negative Experience","Amount - 50 * Negative Experience")

cat(stargazer(wtp_solve_exp_w2_rep, wtp_solve_exp_w2_dem,
              covariate.labels = varlabels_wtp_exp,
              float=FALSE,  dep.var.labels=c("Support for Mitigation"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Subsample", "Republicans", "Democrats")))
    , file = "TABLES_FIGURES/wtp_solve_exp_party.tex", sep="\n")

# SM Figure 14: Experience and Covid-19 cases ------------------------------------------

percexp_county_byparty_w1 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log*party_id + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
png(file = "TABLES_FIGURES/percexp_county_byparty_w1.png",width=1200,height=1200, res=300)
plot_model(percexp_county_byparty_w1, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID")  + aes(color = group, linetype=group) +
  labs(x="County Cumulative Covid Cases Per 100k (log)", y="Perceived Negative Experience - Covid", title="Wave 1", color="Party ID", linetype="Party ID")  
dev.off()

percexp_county_byparty_w2 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log*party_id + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/percexp_county_byparty_w2.png",width=1200,height=1200, res=300)
plot_model(percexp_county_byparty_w2, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +aes(color = group, linetype=group) +
  labs(x="County Cumulative Covid Cases Per 100k (log)", y="Perceived Negative Experience - Covid", title="Wave 2", color="Party ID", linetype="Party ID")  
dev.off()

percexp_county_byparty_w3 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log*party_id + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)
png(file = "TABLES_FIGURES/percexp_county_byparty_w3.png",width=1200,height=1200, res=300)
plot_model(percexp_county_byparty_w3, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +aes(color = group, linetype=group) +
  labs(x="County Cumulative Covid Cases Per 100k (log)", y="Perceived Negative Experience - Covid", title="Wave 3", color="Party ID", linetype="Party ID")  
dev.off()

# SM Table 10: County experience by party ---------------------------------

p_c_w1 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
p_c_w2 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
p_c_w3 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)

p_c_part_w1 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
p_c_part_w2 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
p_c_part_w3 <- lm(negexpindex_CV_log_revised ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)

varlabels_percexp <- c( "County Cumulative Covid Cases per 100k, Log", "Republican", "Independent",
                        "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "County Cases * Republican", "County Cases * Independent")

p_c_w1$AIC <- AIC(p_c_w1)
p_c_w2$AIC <- AIC(p_c_w2)
p_c_w3$AIC <- AIC(p_c_w3)
p_c_part_w1$AIC <- AIC(p_c_part_w1)
p_c_part_w2$AIC <- AIC(p_c_part_w2)
p_c_part_w3$AIC <- AIC(p_c_part_w3)

cat(stargazer(p_c_w1, p_c_part_w1, p_c_w2, p_c_part_w2, p_c_w3,p_c_part_w3,covariate.labels = varlabels_percexp,
              float=FALSE, dep.var.labels=c("Perceived Negative Experience Index"),df = F,no.space = T,
              add.lines=list(c("Wave", "1", "1", "2", "2", "3", "3")), keep.stat=c("aic", "rsq","adj.rsq","f", "n"))
    , file = "TABLES_FIGURES/percexp_county_byparty.tex", sep="\n")

# SM Figure 12: Neg Exp by party by wave ----------------------------------

negexp_wave_123 <- lm(negexpindex_CV_log_revised ~ WAVE*party_id, data=df_set, weights = weight_ANES)
png(file = "TABLES_FIGURES/negexp_party_123.png",width=1200,height=1200, res=300)
plot_model(negexp_wave_123, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  ylim(0.5,0.82) +
  labs(x="Wave", y="Mean Value of Neg Exp Index - Covid", title="")  
dev.off()

# SM Figure 13: Worry by Neg Exp by Party ---------------------------------

df_set$negexpindex_CV_log_BINARY <- if_else(df_set$negexpindex_CV_log_revised==0,"No Experience","Experience")

worry_exp_wave_123_rep <- lm(cv4 ~ WAVE*negexpindex_CV_log_BINARY, data=df_set, party_id=="Rep")
png(file = "TABLES_FIGURES/worry_exp_wave_123_rep.png",width=1200,height=1200, res=300)
plot_model(worry_exp_wave_123_rep, type="int", colors = c("green", "purple"), legend.title = "Negative Experience") + 
  labs(x="Wave", y="Mean Value of Worry - Covid", title="Republicans") + ylim(2.4, 3.6) +
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center") 
dev.off()

worry_exp_wave_123_dem <- lm(cv4 ~ WAVE*negexpindex_CV_log_BINARY, data=df_set, party_id=="Dem")
png(file = "TABLES_FIGURES/worry_exp_wave_123_dem.png",width=1200,height=1200, res=300)
plot_model(worry_exp_wave_123_dem, type="int", colors = c("green", "purple"), legend.title = "Negative Experience") + 
  labs(x="Wave", y="Mean Value of Worry - Covid", title="Democrats") + ylim(2.4, 3.6)+ 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center") 
dev.off()


# SM Table 11: Worry by Experience * Party --------------------------------

worry_percexp_byparty_w1 <- lm(cv4 ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
worry_percexp_byparty_w2 <- lm(cv4 ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
worry_percexp_byparty_w3 <- lm(cv4 ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")

worry_percexp_byparty_w1$AIC <- AIC(worry_percexp_byparty_w1)
worry_percexp_byparty_w2$AIC <- AIC(worry_percexp_byparty_w2)
worry_percexp_byparty_w3$AIC <- AIC(worry_percexp_byparty_w3)

cat(stargazer(worry_percexp_byparty_w1, worry_percexp_byparty_w2, worry_percexp_byparty_w3, covariate.labels = varlabels,
              float=FALSE, dep.var.labels=c("Worry - Covid"),df = F,no.space = T,  
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),  add.lines=list(c("Wave", "1", "2", "3")))
    , file = "TABLES_FIGURES/worry_percexp_byparty_wave.tex", sep="\n")

# SM Table 12: Worry, harm, concern ---------------------------------------

cv4 <- lm(cv4_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv2_comm <- lm(cv2_comm_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv3_comm <- lm(cv3_comm_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cv4$AIC <- AIC(cv4)
cv2_comm$AIC <- AIC(cv2_comm)
cv3_comm$AIC <- AIC(cv3_comm)
cat(stargazer(cv4, cv2_comm, cv3_comm, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry", "Current Harm Comm.", "Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worryharm.tex")

smtab12_adjusted <- cbind(c("Worry", "Current Harm Comm.", "Future Harm Comm"),
                    round(p.adjust(c(summary(cv4)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv2_comm)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(cv3_comm)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),
                                   method = "BH"),3),
                    round(p.adjust(c(summary(cv4)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv2_comm)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(cv3_comm)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),
                                   method = "bonferroni"),3))


# SM Table 13: PPA --------------------------------------------------------

cvcc5 <- lm(cvcc5_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
cv_mask <- lm(cv_mask_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv_vaccine <- lm(cv_vaccine_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv_late.ind_slow_isolate <- lm(cv_late.ind_slow_isolate_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cvcc5$AIC <- AIC(cvcc5)
cv_mask$AIC <- AIC(cv_mask)
cv_vaccine$AIC <- AIC(cv_vaccine)
cv_late.ind_slow_isolate$AIC <- AIC(cv_late.ind_slow_isolate)

cat(stargazer(cv_mask, cv_vaccine, cvcc5, cv_late.ind_slow_isolate,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Wear Mask Public", "Support Vaccine", "Important to Self-Isolate", "Perception Slow to Self-Isolate"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_ppa.tex")


smtab13_adjusted <- cbind(c("Wear Mask Public", "Support Vaccine", "Important to Self-Isolate", "Perception Slow to Self-Isolate"),
                    round(p.adjust(c(summary(cvcc5)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv_mask)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(cv_vaccine)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv_late.ind_slow_isolate)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),
                                   method = "BH"),3),
                    round(p.adjust(c(summary(cvcc5)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv_mask)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(cv_vaccine)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv_late.ind_slow_isolate)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),
                                   method = "bonferroni"),3))
# SM Table 14: Policy support ---------------------------------------------

cv_late.pub_state_slow_SD <- lm(cv_late.pub_state_slow_SD_z ~ negexpindex_CV_log_revised*party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv_reopen <- lm(cv_reopen_reverse_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cvIO <- lm(cvIO_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
cvGovt <- lm(cvGovt_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cv_late.pub_state_slow_SD$AIC <- AIC(cv_late.pub_state_slow_SD)
cv_reopen$AIC <- AIC(cv_reopen)
cvIO$AIC <- AIC(cvIO)
cvGovt$AIC <- AIC(cvGovt)
cat(stargazer(cv_late.pub_state_slow_SD, cv_reopen, cvIO, cvGovt,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("State Slow to Social Dist.", "Oppose Rapid Reopening", "IO Global Effort", "National Global Effort"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_policies.tex")



smtab14_adjusted <- cbind(c("State Slow to Social Dist.", "Oppose Rapid Reopening", "IO Global Effort", "National Global Effort"),
                    round(p.adjust(c(summary(cv_late.pub_state_slow_SD)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv_reopen)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(cvIO)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cvGovt)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),
                                   method = "BH"),3),
                    round(p.adjust(c(summary(cv_late.pub_state_slow_SD)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cv_reopen)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(cvIO)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(cvGovt)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),
                                   method = "bonferroni"),3))
# SM Table 15: Trust ------------------------------------------------------


pol_trust_cdc <- lm(pol_trust_cdc_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
pol_trust_news <- lm(pol_trust_news_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
pol_trust_sci <- lm(pol_trust_sci_z ~ negexpindex_CV_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
pol_trust_cdc$AIC <- AIC(pol_trust_cdc)
pol_trust_news$AIC <- AIC(pol_trust_news)
pol_trust_sci$AIC <- AIC(pol_trust_sci)
cat(stargazer(pol_trust_cdc, pol_trust_news, pol_trust_sci,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Trust in CDC", "Trust in News Media", "Trust in Scientists"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_trust.tex")


smtab15_adjusted <- cbind(c("Trust in CDC", "Trust in News Media", "Trust in Scientists"),
                    round(p.adjust(c(summary(pol_trust_cdc)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(pol_trust_news)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(pol_trust_sci)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),
                                   method = "BH"),3),
                    round(p.adjust(c(summary(pol_trust_cdc)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4],  
                                     summary(pol_trust_news)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4] , 
                                     summary(pol_trust_sci)$coefficients["negexpindex_CV_log_revised:party_id_dembaseRep",4]),  
                                   method = "bonferroni"),3))

# SM Table 16: Worry -- County --------------------------------------------

cv4_county <- lm(cv4_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv2_comm_county <- lm(cv2_comm_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv3_comm_county <- lm(cv3_comm_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("County Cumulative Covid Cases per 100k, Log", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "County Cases * Republican", "County Cases * Independent")
cv4_county$AIC <- AIC(cv4_county)
cv2_comm_county$AIC <- AIC(cv2_comm_county)
cv3_comm_county$AIC <- AIC(cv3_comm_county)
cat(stargazer(cv4_county, cv2_comm_county, cv3_comm_county, covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry", "Current Harm Comm.", "Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worryharm_county.tex")


# SM Table 17: PPA -- County -----------------------------------------
cvcc5_county <- lm(cvcc5_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
cv_mask_county <- lm(cv_mask_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv_vaccine_county <- lm(cv_vaccine_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv_late.ind_slow_isolate_county <- lm(cv_late.ind_slow_isolate_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("County Cumulative Covid Cases per 100k, Log", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "County Cases * Republican", "County Cases * Independent")
cvcc5_county$AIC <- AIC(cvcc5_county)
cv_mask_county$AIC <- AIC(cv_mask_county)
cv_vaccine_county$AIC <- AIC(cv_vaccine_county)
cv_late.ind_slow_isolate_county$AIC <- AIC(cv_late.ind_slow_isolate_county)

cat(stargazer(cv_mask_county, cv_vaccine_county, cvcc5_county, cv_late.ind_slow_isolate_county,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Wear Mask Public", "Support Vaccine", "Important to Self-Isolate", "Perception Slow to Self-Isolate"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_ppa_county.tex")


# SM Table 18: Policies -- County  -----------------------------------------

cv_late <- lm(cv_late.pub_state_slow_SD_z ~ cv_day_cases_cum_per100k_log*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv_reopen_county <- lm(cv_reopen_reverse_z ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cvIO_county <- lm(cvIO_z ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
cvGovt_county <- lm(cvGovt_z ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
varlabels <- c("County Cumulative Covid Cases per 100k, Log", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "County Cases * Republican", "County Cases * Independent")
cv_late$AIC <- AIC(cv_late)
cv_reopen_county$AIC <- AIC(cv_reopen_county)
cvIO_county$AIC <- AIC(cvIO_county)
cvGovt_county$AIC <- AIC(cvGovt_county)
cat(stargazer(cv_late, cv_reopen_county, cvIO_county, cvGovt_county,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("State Slow to Social Dist.", "Oppose Rapid Reopening", "IO Global Effort", "National Global Effort"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_policies_county.tex")


# SM Table 19: Trust -- County --------------------------------------------

pol_trust_cdc_county <- lm(pol_trust_cdc_z ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
pol_trust_news_county <- lm(pol_trust_news_z ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
pol_trust_sci_county <- lm(pol_trust_sci_z ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("County Cumulative Covid Cases per 100k, Log", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "County Cases * Republican", "County Cases * Independent")
pol_trust_cdc_county$AIC <- AIC(pol_trust_cdc_county)
pol_trust_news_county$AIC <- AIC(pol_trust_news_county)
pol_trust_sci_county$AIC <- AIC(pol_trust_sci_county)
cat(stargazer(pol_trust_cdc_county, pol_trust_news_county, pol_trust_sci_county,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Trust in CDC", "Trust in News Media", "Trust in Scientists"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_trust_county.tex")


# SM Figure 15: Worry CC by wave ------------------------------------------

worry_wave_123_cc <- lm(cc6 ~ WAVE*party_id, data=df_set, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_party_123_cc.png",width=1200,height=1200, res=300)
plot_model(worry_wave_123_cc, type="int", colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + 
  ylim(2,3.6) +
  labs(x="Wave", y="Mean Value of Worry - Climate", title="") + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center") 
dev.off()


# SM Figure 16: Worry CC Exp by Wave --------------------------------------


worry_percexp_byparty_w1_cc <- lm(cc6 ~ negexpindex_CC_log_revised*party_id  + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_percexp_byparty_w1_cc.png",width=1200,height=1200, res=300)
plot_model(worry_percexp_byparty_w1_cc, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +
  labs(x="Perceived Negative Experience - Climate", y="Worry - Climate", title="Wave 1")  +ylim(1.8,3.6) + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center")
dev.off()

worry_percexp_byparty_w2_cc <- lm(cc6 ~ negexpindex_CC_log_revised*party_id  + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_percexp_byparty_w2_cc.png",width=1200,height=1200, res=300)
plot_model(worry_percexp_byparty_w2_cc, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +
  labs(x="Perceived Negative Experience - Climate", y="Worry - Climate", title="Wave 2")  +ylim(1.8,3.6) + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center")
dev.off()

worry_percexp_byparty_w3_cc <- lm(cc6 ~ negexpindex_CC_log_revised*party_id  + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)
png(file = "TABLES_FIGURES/worry_percexp_byparty_w3_cc.png",width=1200,height=1200, res=300)
plot_model(worry_percexp_byparty_w3_cc, type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") +
  labs(x="Perceived Negative Experience - Climate", y="Worry - Climate", title="Wave 3")  +ylim(1.8,3.6) + 
  set_theme(base=theme_classic(), title.color = "black",title.size = 1.5, title.align = "center")
dev.off()

# SM Table 20: Worry CC Exp by Party  --------------------------------------

worry_w1_cc <- lm(cc6 ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
worry_w2_cc <- lm(cc6 ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
worry_w3_cc <- lm(cc6 ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)
worry_w3_cc_no <- lm(cc6 ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ + dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
worry_w1_cc$AIC <- AIC(worry_w1_cc)
worry_w2_cc$AIC <- AIC(worry_w2_cc)
worry_w3_cc$AIC <- AIC(worry_w3_cc)
worry_w3_cc_no$AIC <- AIC(worry_w3_cc_no)
cat(stargazer(worry_w1_cc, worry_w2_cc, worry_w3_cc,worry_w3_cc_no,
              covariate.labels = varlabels,
              float=FALSE, dep.var.labels=c("Worry - Climate"),df = F,no.space = T,  
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),  
              add.lines=list(c("Wave", "1", "2", "3","3"), c("Weights", "Yes", "Yes", "Yes", "No")))
    , file = "TABLES_FIGURES/worry_percexp_byparty_wave_cc.tex", sep="\n")


# SM Table 21: CC Exp by County  -------------------------------------------
exp_w2_cc <- lm(negexpindex_CC_log_revised ~ Hazards + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
exp_part_w2_cc <- lm(negexpindex_CC_log_revised ~ Hazards*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
exp_w2_cc_no <- lm(negexpindex_CC_log_revised ~ Hazards + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
exp_part_w2_cc_no <- lm(negexpindex_CC_log_revised ~ Hazards*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
varlabels <- c("Natural Hazards Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Natural Hazards Index * Republican", "Natural Hazards Index * Independent")
exp_w2_cc$AIC <- AIC(exp_w2_cc)
exp_part_w2_cc$AIC <- AIC(exp_part_w2_cc)
exp_w2_cc_no$AIC <- AIC(exp_w2_cc_no)
exp_part_w2_cc_no$AIC <- AIC(exp_part_w2_cc_no)
cat(stargazer(exp_w2_cc, exp_part_w2_cc, exp_w2_cc_no, exp_part_w2_cc_no,
              covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Negative Experience Index - Extreme Weather Last 10 Years"), float=F, df=F,
              add.lines=list(c("Weights", "Yes", "Yes","No", "No"))),
    file = "TABLES_FIGURES/percexp_county_CC.tex")

# SM Table 22: CC Worry, harm, Concern ------------------------------------

cc6 <- lm(cc6_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cc4_comm <- lm(cc4_comm_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cc5_comm <- lm(cc5_comm_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cc6$AIC <- AIC(cc6)
cc4_comm$AIC <- AIC(cc4_comm)
cc5_comm$AIC <- AIC(cc5_comm)
cat(stargazer(cc6, cc4_comm, cc5_comm, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry", "Current Harm Comm.", "Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worryharm_CC.tex")

# SM Table 23: CC PPA Policy ------------------------------------

cvcc6 <- lm(cvcc6_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
ccIO <- lm(ccIO_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
ccGovt <- lm(ccGovt_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cvcc6$AIC <- AIC(cvcc6)
ccIO$AIC <- AIC(ccIO)
ccGovt$AIC <- AIC(ccGovt)
cat(stargazer(cvcc6,ccIO,ccGovt,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Individuals Take Action", "IO Global Effort", "National Global Effort"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_ppapolicies_CC.tex")

# SM Table 24: CC Trust ---------------------------------------------------

pol_trust_epa_CC <- lm(pol_trust_epa_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
pol_trust_news_CC <- lm(pol_trust_news_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
pol_trust_sci_CC <- lm(pol_trust_sci_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
pol_trust_epa_CC$AIC <- AIC(pol_trust_epa_CC)
pol_trust_news_CC$AIC <- AIC(pol_trust_news_CC)
pol_trust_sci_CC$AIC <- AIC(pol_trust_sci_CC)
cat(stargazer(pol_trust_epa_CC, pol_trust_news_CC, pol_trust_sci_CC,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Trust in EPA", "Trust in News Media", "Trust in Scientists"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_trust_CC.tex")

# SM Table 25: CC WTP by Party  -----------------------------------------------

ccComp_w2 <- w2[,c("ccComp0", "ccComp1", "ccComp10", "ccComp50", "ccComp100", "cc6", "cv4","negexpindex_CC_log_revised", "party_id", "party_id_dembase",control_vars)]
ccComp_w2$approval[!is.na(ccComp_w2$ccComp0)]  <- ccComp_w2$ccComp0[!is.na(ccComp_w2$ccComp0)] 
ccComp_w2$approval[!is.na(ccComp_w2$ccComp1)]  <- ccComp_w2$ccComp1[!is.na(ccComp_w2$ccComp1)] 
ccComp_w2$approval[!is.na(ccComp_w2$ccComp10)]  <- ccComp_w2$ccComp10[!is.na(ccComp_w2$ccComp10)] 
ccComp_w2$approval[!is.na(ccComp_w2$ccComp100)]  <- ccComp_w2$ccComp100[!is.na(ccComp_w2$ccComp100)] 
ccComp_w2$approval[!is.na(ccComp_w2$ccComp50)]  <- ccComp_w2$ccComp50[!is.na(ccComp_w2$ccComp50)] 
ccComp_w2$amount[!is.na(ccComp_w2$ccComp0)] <- "0"
ccComp_w2$amount[!is.na(ccComp_w2$ccComp1)] <- "1"
ccComp_w2$amount[!is.na(ccComp_w2$ccComp10)] <- "10"
ccComp_w2$amount[!is.na(ccComp_w2$ccComp100)] <- "100"
ccComp_w2$amount[!is.na(ccComp_w2$ccComp50)] <- "50"
ccComp_w2$amount <- as.factor(ccComp_w2$amount)

ccSolve_w2 <- w2[,c("ccSolve0", "ccSolve1", "ccSolve10", "ccSolve50", "ccSolve100", "cc6", "cv4","negexpindex_CC_log_revised", "party_id", "party_id_dembase", control_vars)]
ccSolve_w2$approval[!is.na(ccSolve_w2$ccSolve0)]  <- ccSolve_w2$ccSolve0[!is.na(ccSolve_w2$ccSolve0)] 
ccSolve_w2$approval[!is.na(ccSolve_w2$ccSolve1)]  <- ccSolve_w2$ccSolve1[!is.na(ccSolve_w2$ccSolve1)] 
ccSolve_w2$approval[!is.na(ccSolve_w2$ccSolve10)]  <- ccSolve_w2$ccSolve10[!is.na(ccSolve_w2$ccSolve10)] 
ccSolve_w2$approval[!is.na(ccSolve_w2$ccSolve100)]  <- ccSolve_w2$ccSolve100[!is.na(ccSolve_w2$ccSolve100)] 
ccSolve_w2$approval[!is.na(ccSolve_w2$ccSolve50)]  <- ccSolve_w2$ccSolve50[!is.na(ccSolve_w2$ccSolve50)] 
ccSolve_w2$amount[!is.na(ccSolve_w2$ccSolve0)] <- "0"
ccSolve_w2$amount[!is.na(ccSolve_w2$ccSolve1)] <- "1"
ccSolve_w2$amount[!is.na(ccSolve_w2$ccSolve10)] <- "10"
ccSolve_w2$amount[!is.na(ccSolve_w2$ccSolve100)] <- "100"
ccSolve_w2$amount[!is.na(ccSolve_w2$ccSolve50)] <- "50"
ccSolve_w2$amount <- as.factor(ccSolve_w2$amount)

wtp_comp_party_w2_cc <- lm(approval ~ amount*party_id_dembase + negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccComp_w2, weights = weight_ANES)
wtp_solve_party_w2_cc <- lm(approval ~ amount*party_id_dembase + negexpindex_CC_log_revised + dem_age  + dem_income + dem_educ + dem_latino+ dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccSolve_w2, weights = weight_ANES)
wtp_comp_party_w2_cc$AIC <- AIC(wtp_comp_party_w2_cc)
wtp_solve_party_w2_cc$AIC <- AIC(wtp_solve_party_w2_cc)

varlabels_wtp_party <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", 
                          "Republican", "Independent", "Negative Experience Index",
                          "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                          "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                          "Amount - 1 * Republican", "Amount - 10 * Republican",
                          "Amount - 100 * Republican","Amount - 50 * Republican",
                          "Amount - 1 * Independent", "Amount - 10 * Independent",
                          "Amount - 100 * Independent","Amount - 50 * Independent")

cat(stargazer(wtp_comp_party_w2_cc, wtp_solve_party_w2_cc,
              covariate.labels = varlabels_wtp_party,
              float=FALSE,  dep.var.labels=c("Support for Policy"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Dependent Variable", "Compensation", "Mitigation")))
    , file = "TABLES_FIGURES/wtp_party_cc.tex", sep="\n")

# SM Table 26: CC WTP by Exp ----------------------------------------------

wtp_comp_exp_w2_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccComp_w2, weights = weight_ANES)
wtp_solve_exp_w2_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccSolve_w2, weights = weight_ANES)
wtp_comp_exp_w2_cc$AIC <- AIC(wtp_comp_exp_w2_cc)
wtp_solve_exp_w2_cc$AIC <- AIC(wtp_solve_exp_w2_cc)

varlabels_wtp_exp <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", "Negative Experience Index",
                        "Republican", "Independent",
                        "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "Amount - 1 * Negative Experience", "Amount - 10 * Negative Experience",
                        "Amount - 100 * Negative Experience","Amount - 50 * Negative Experience")
cat(stargazer(wtp_comp_exp_w2_cc, wtp_solve_exp_w2_cc,
              covariate.labels = varlabels_wtp_exp,
              float=FALSE, dep.var.labels=c("Support for Policy"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Dependent Variable", "Compensation", "Mitigation")))
    , file = "TABLES_FIGURES/wtp_exp_cc.tex", sep="\n")

# SM Figure 17: CC WTP by party -------------------------------------------

wtp_comp_party_w2_cc <- lm(approval ~ amount*party_id + negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccComp_w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/wtp_comp_party_w2_cc.png",width=1200,height=1200, res=300)
plot_model(wtp_comp_party_w2_cc , type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Compensation - Climate", title="Wave 2")
dev.off()

wtp_solve_party_w2_cc <- lm(approval ~ amount*party_id + negexpindex_CC_log_revised + dem_age  + dem_income + dem_educ + dem_latino+ dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccSolve_w2, weights = weight_ANES)
png(file = "TABLES_FIGURES/wtp_solve_party_w2_cc.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_party_w2_cc , type="int",colors = c("red2", "blue2", "violet"), legend.title = "Party ID") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation - Climate", title="Wave 2")
dev.off()


# SM Figure 18-19: CC WTP by Party and Exp --------------------------------

wtp_comp_exp_w2_rep_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccComp_w2, subset = party_id=="Rep")
wtp_comp_exp_w2_dem_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccComp_w2, subset = party_id=="Dem")
png(file = "TABLES_FIGURES/wtp_comp_exp_w2_rep_cc.png",width=1200,height=1200, res=300)
plot_model(wtp_comp_exp_w2_rep_cc , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Compensation", title="Climate - Republicans",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightpink","red2"),labels=c("Min","Max"))
dev.off()
png(file = "TABLES_FIGURES/wtp_comp_exp_w2_dem_cc.png",width=1200,height=1200, res=300)
plot_model(wtp_comp_exp_w2_dem_cc , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Compensation", title="Climate - Democrats",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightblue","blue2"),labels=c("Min","Max"))
dev.off()

wtp_solve_exp_w2_rep_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccSolve_w2, subset = party_id=="Rep")
wtp_solve_exp_w2_dem_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccSolve_w2, subset = party_id=="Dem")
png(file = "TABLES_FIGURES/wtp_solve_exp_w2_rep_cc.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_exp_w2_rep_cc , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Climate - Republicans",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightpink","red2"),labels=c("Min","Max"))
dev.off()
png(file = "TABLES_FIGURES/wtp_solve_exp_w2_dem_cc.png",width=1200,height=1200, res=300)
plot_model(wtp_solve_exp_w2_dem_cc , type="int") + ylim(1,5) +
  labs(x="Amount per Month", y="Policy Support for Mitigation", title="Climate - Democrats",color="Neg.Exp.Index") + 
  scale_colour_manual(values=c("lightblue","blue2"),labels=c("Min","Max"))
dev.off()


# SM Table 27-28: CC WTP Comp and Solve by Party ---------------------------------------

wtp_comp_exp_w2_rep_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccComp_w2, subset = party_id=="Rep")
wtp_comp_exp_w2_dem_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccComp_w2, subset = party_id=="Dem")
wtp_comp_exp_w2_rep_cc$AIC <- AIC(wtp_comp_exp_w2_rep_cc)
wtp_comp_exp_w2_dem_cc$AIC <- AIC(wtp_comp_exp_w2_dem_cc)
varlabels_wtp_exp <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", "Negative Experience Index",
                        "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "Amount - 1 * Negative Experience", "Amount - 10 * Negative Experience",
                        "Amount - 100 * Negative Experience","Amount - 50 * Negative Experience")
cat(stargazer(wtp_comp_exp_w2_rep_cc, wtp_comp_exp_w2_dem_cc,
              covariate.labels = varlabels_wtp_exp,
              float=FALSE,  dep.var.labels=c("Support for Compensation"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Subsample", "Republicans", "Democrats")))
    , file = "TABLES_FIGURES/wtp_comp_exp_party_cc.tex", sep="\n")

wtp_solve_exp_w2_rep_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccSolve_w2, subset = party_id=="Rep")
wtp_solve_exp_w2_dem_cc <- lm(approval ~ amount*negexpindex_CC_log_revised + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=ccSolve_w2, subset = party_id=="Dem")
wtp_solve_exp_w2_rep_cc$AIC <- AIC(wtp_solve_exp_w2_rep_cc)
wtp_solve_exp_w2_dem_cc$AIC <- AIC(wtp_solve_exp_w2_dem_cc)
varlabels_wtp_exp <- c( "Amount - 1", "Amount - 10", "Amount - 100", "Amount - 50", "Negative Experience Index",
                        "Age", "Income", "Education","Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "Amount - 1 * Negative Experience", "Amount - 10 * Negative Experience",
                        "Amount - 100 * Negative Experience","Amount - 50 * Negative Experience")
cat(stargazer(wtp_solve_exp_w2_rep_cc, wtp_solve_exp_w2_dem_cc,
              covariate.labels = varlabels_wtp_exp,
              float=FALSE,  dep.var.labels=c("Support for Mitigation"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              add.lines=list(c("Subsample", "Republicans", "Democrats")))
    , file = "TABLES_FIGURES/wtp_solve_exp_party_cc.tex", sep="\n")


# SM Table 29-30: Change Exp County -------------------------------------

change_percexp_county_byparty_w1w2 <- lm(negexpindex_CV_sum_revised_diff ~ cv_day_confirmed_cum_per100k_diff*party_id_dembase_w1 + negexpindex_CV_log_revised_w1 + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2, 
                                            subset = negexpindex_CV_sum_revised_diff>=0 & cv_day_confirmed_cum_per100k_diff>=0)
change_percexp_county_byparty_w2w3 <- lm(negexpindex_CV_sum_revised_diff ~ cv_day_confirmed_cum_per100k_diff*party_id_dembase_w2 + negexpindex_CV_log_revised_w2 + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3, 
                                            subset = cv_day_confirmed_cum_per100k_diff<10000 & negexpindex_CV_sum_revised_diff>=0 & cv_day_confirmed_cum_per100k_diff>=0)
varlabels_change_percexp <- c( "Change in County Cumulative Covid Cases per 100k", "Republican", "Independent", "Baseline Negative Experience Index, Log",
                        "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", 
                        "Change in County Cases * Republican", "Change in County Cases * Independent")
change_percexp_county_byparty_w1w2$AIC <- AIC(change_percexp_county_byparty_w1w2)
change_percexp_county_byparty_w2w3$AIC <- AIC(change_percexp_county_byparty_w2w3)

cat(stargazer(change_percexp_county_byparty_w1w2,
              covariate.labels = varlabels_change_percexp,
              float=FALSE, dep.var.labels=c("Change in Sum of Negative Experience Index - Wave 1 to Wave 2"),df = F,no.space = T,
               keep.stat=c("aic", "rsq","adj.rsq","f", "n"))
    , file = "TABLES_FIGURES/change_percexp_county_byparty_w1w2.tex", sep="\n")

# Note: limited to observations with non-negative change in negative experience index (excludes 557 observations) 
# and change in county cumulative covid cases per 100k >= 0 (excludes 14 observations where individuals moved from high case-rate counties in W1 to low case-rate counties in W2).
sum(df_set_w1w2$negexpindex_CV_sum_revised_diff<0)
sum(df_set_w1w2$cv_day_confirmed_cum_per100k_diff<0)
df_set_w1w2$county_name_w1[df_set_w1w2$cv_day_confirmed_cum_per100k_diff<0]
df_set_w1w2$county_name_w2[df_set_w1w2$cv_day_confirmed_cum_per100k_diff<0]

cat(stargazer(change_percexp_county_byparty_w2w3,
              covariate.labels = varlabels_change_percexp,
              float=FALSE, dep.var.labels=c("Change in Sum of Negative Experience Index - Wave 2 to Wave 3"),df = F,no.space = T,
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"))
    , file = "TABLES_FIGURES/change_percexp_county_byparty_w2w3.tex", sep="\n")
# Note: limited to observations with non-negative change in negative experience index (excludes 365 observations) 
# and change in county cumulative covid cases per 100k < 10,000 (excludes 2 observations in South Dakota - Pennington)
# and change in county cumulative covid cases per 100k >= 0 (excludes 11 observations where individuals moved from high case-rate counties in W2 to low case-rate counties in W3).
sum(df_set_w2w3$negexpindex_CV_sum_revised_diff<0)
sum(df_set_w2w3$cv_day_confirmed_cum_per100k_diff>10000)
df_set_w2w3$county_name_w2[df_set_w2w3$cv_day_confirmed_cum_per100k_diff>10000]
sum(df_set_w2w3$cv_day_confirmed_cum_per100k_diff<0)


# SM Figure 20: Change Exp by Wave ----------------------------------------

negexp_party_w1w2 <- lm(negexpindex_CV_sum_revised_diff ~ party_id_dembase_w1, data=df_set_w1w2 ,  subset = negexpindex_CV_sum_revised_diff>=0)
png(file = "TABLES_FIGURES/negexp_party_w1w2.png",width=1200,height=1200, res=300)
plot_model(negexp_party_w1w2, type="pred",terms="party_id_dembase_w1")  + ylim(0.3,0.9) +
  labs(x="Party ID", y="Change in Negative Experience", title="Wave 1 -- Wave 2")
dev.off()

negexp_party_w2w3 <- lm(negexpindex_CV_sum_revised_diff ~ party_id_dembase_w2, data=df_set_w2w3 ,  subset = negexpindex_CV_sum_revised_diff>=0)
png(file = "TABLES_FIGURES/negexp_party_w2w3.png",width=1200,height=1200, res=300)
plot_model(negexp_party_w2w3, type="pred",terms="party_id_dembase_w2") + ylim(0.3,0.9)  +
  labs(x="Party ID", y="Change in Negative Experience", title="Wave 2 -- Wave 3")
dev.off()


# SM Table 31-32: Change Worry Exp  ----------------------------------------

sum(is.na(df_set_w1w2$cv2_comm_noNA_w1))
sum(is.na(df_set_w1w2$cv3_comm_noNA_w1))

ch_wo_12 <- lm(cv4_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w1  + cv4_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                             subset = negexpindex_CV_sum_revised_diff>=0)
ch_wo_p12 <- lm(cv4_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w1  + cv4_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                     subset = negexpindex_CV_sum_revised_diff>=0)
ch_cv2_12 <- lm(cv2_comm_diff ~ negexpindex_CV_sum_revised_diff+party_id_dembase_w1 + cv2_comm_noNA_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                      subset = negexpindex_CV_sum_revised_diff>=0)
ch_cv2_p12 <- lm(cv2_comm_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w1 + cv2_comm_noNA_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                 subset = negexpindex_CV_sum_revised_diff>=0)
ch_cv3_12 <- lm(cv3_comm_diff ~ negexpindex_CV_sum_revised_diff+party_id_dembase_w1 + cv3_comm_noNA_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                         subset = negexpindex_CV_sum_revised_diff>=0)
ch_cv3_p12 <- lm(cv3_comm_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w1 + cv3_comm_noNA_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                 subset = negexpindex_CV_sum_revised_diff>=0)
varlabels_change_worry <- c( "Change in Sum of Negative Experience Index", "Republican", "Independent", 
                             "Baseline Worry", "Baseline Current Harm", "Baseline Future Harm",
                               "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region",
                             "Change in Negative Experience * Republican", "Change in Negative Experience * Independent")
ch_wo_12$AIC <- AIC(ch_wo_12)
ch_wo_p12$AIC <- AIC(ch_wo_p12)
ch_cv2_12$AIC <- AIC(ch_cv2_12)
ch_cv2_p12$AIC <- AIC(ch_cv2_p12)
ch_cv3_12$AIC <- AIC(ch_cv3_12)
ch_cv3_p12$AIC <- AIC(ch_cv3_p12)

cat(stargazer(ch_wo_12,ch_wo_p12,ch_cv2_12, ch_cv2_p12,ch_cv3_12, ch_cv3_p12,
              covariate.labels = varlabels_change_worry, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Change in Worry", "Change in Current Harm Comm.", "Change in Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/change_worryharm_w1w2.tex")

ch_wo_23 <- lm(cv4_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2 + cv4_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2,  data=df_set_w2w3,
                                             subset = negexpindex_CV_sum_revised_diff>=0)
ch_wo_p23 <- lm(cv4_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2 + cv4_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2,  data=df_set_w2w3,
                               subset = negexpindex_CV_sum_revised_diff>=0)
ch_cv2_23 <- lm(cv2_comm_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2 + cv2_comm_noNA_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2,  data=df_set_w2w3,
                                      subset = negexpindex_CV_sum_revised_diff>=0)
ch_cv2_p23 <- lm(cv2_comm_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2 + cv2_comm_noNA_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2,  data=df_set_w2w3,
                                 subset = negexpindex_CV_sum_revised_diff>=0)
varlabels_change_worry <- c( "Change in Sum of Negative Experience Index", "Republican", "Independent", 
                             "Baseline Worry", "Baseline Current Harm", 
                             "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                             "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region",
                             "Change in Negative Experience * Republican", "Change in Negative Experience * Independent")

ch_wo_23$AIC <- AIC(ch_wo_23)
ch_wo_p23$AIC <- AIC(ch_wo_p23)
ch_cv2_23$AIC <- AIC(ch_cv2_23)
ch_cv2_p23$AIC <- AIC(ch_cv2_p23)
cat(stargazer(ch_wo_23,ch_wo_p23,ch_cv2_23,ch_cv2_p23,
              covariate.labels = varlabels_change_worry, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Change in Worry", "Change in Current Harm Comm." ), float=F, df=F),
    file = "TABLES_FIGURES/change_worryharm_w2w3.tex")


# SM Table 33: Change CVCC5 Exp W1W2 ------------------------------------------

change_cvcc5_negexp_w1w2 <- lm(cvcc5_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w1  + cvcc5_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                               subset = negexpindex_CV_sum_revised_diff>=0)
change_cvcc5_negexp_party_w1w2 <- lm(cvcc5_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w1  + cvcc5_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                               subset = negexpindex_CV_sum_revised_diff>=0)

change_cvcc5_negexp_w1w2$AIC <- AIC(change_cvcc5_negexp_w1w2)
change_cvcc5_negexp_party_w1w2$AIC <- AIC(change_cvcc5_negexp_party_w1w2)
stargazer(change_cvcc5_negexp_w1w2,change_cvcc5_negexp_party_w1w2)
varlabels_change_cvcc5 <- c( "Change in Sum of Negative Experience Index", "Republican", "Independent", 
                             "Baseline Important to Self-Isolate", 
                             "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                             "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region",
                             "Change in Negative Experience * Republican", "Change in Negative Experience * Independent")
cat(stargazer(change_cvcc5_negexp_w1w2, change_cvcc5_negexp_party_w1w2,
              covariate.labels = varlabels_change_cvcc5, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Change in Important to Self-Isolate" ), float=F, df=F),
    file = "TABLES_FIGURES/change_cvcc5_negexp_w1w2.tex")

# SM Table 34: Change PPA Exp W2W3  ------------------------------------------

cvcc5_23 <- lm(cvcc5_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2  + cvcc5_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                               subset = negexpindex_CV_sum_revised_diff>=0)
cvcc5_p23 <- lm(cvcc5_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2  + cvcc5_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                     subset = negexpindex_CV_sum_revised_diff>=0)
mask_23 <- lm(cv_mask_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2  + cv_mask_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                subset = negexpindex_CV_sum_revised_diff>=0)
mask_p23 <- lm(cv_mask_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2  + cv_mask_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                      subset = negexpindex_CV_sum_revised_diff>=0)
vac_23 <- lm(cv_vaccine_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2  + cv_vaccine_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                   subset = negexpindex_CV_sum_revised_diff>=0)
vac_p23 <- lm(cv_vaccine_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2  + cv_vaccine_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                         subset = negexpindex_CV_sum_revised_diff>=0)
cvcc5_23$AIC <- AIC(cvcc5_23)
cvcc5_p23$AIC <- AIC(cvcc5_p23)
mask_23$AIC <- AIC(mask_23)
mask_p23$AIC <- AIC(mask_p23)
vac_23$AIC <- AIC(vac_23)
vac_p23$AIC <- AIC(vac_p23)

varlabels_change_ppa <- c( "Change in Sum of Negative Experience Index", "Republican", "Independent", 
                           "Baseline Wear Mask Public", "Baseline Support Vaccine", "Baseline Important Action to Self-Isolate", 
                           "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                           "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region",
                           "Change in Negative Experience * Republican", "Change in Negative Experience * Independent")

cat(stargazer(cvcc5_23, cvcc5_p23, 
              mask_23, mask_p23, 
              vac_23, vac_p23,
              covariate.labels = varlabels_change_ppa, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Change in Wear Mask Public" , "Change in Support Vaccine" ,"Change in Important to Self-Isolate" ), float=F, df=F),
    file = "TABLES_FIGURES/change_ppa_negexp_w2w3.tex")

# SM Table 35: Change Late Pub W2W3 ----------------------------------------------------------------------

change_cvlatepub_negexp_w2w3 <- lm(cv_late.pub_state_slow_SD_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2  + cv_late.pub_state_slow_SD_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                   subset = negexpindex_CV_sum_revised_diff>=0)
change_cvlatepub_negexp_party_w2w3 <- lm(cv_late.pub_state_slow_SD_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2  + cv_late.pub_state_slow_SD_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                         subset = negexpindex_CV_sum_revised_diff>=0)
change_cvlatepub_negexp_w2w3$AIC <- AIC(change_cvlatepub_negexp_w2w3)
change_cvlatepub_negexp_party_w2w3$AIC <- AIC(change_cvlatepub_negexp_party_w2w3)

varlabels_change_cvlatepub <- c( "Change in Sum of Negative Experience Index", "Republican", "Independent", 
                                 "Baseline State Slow to Social Dist", 
                                 "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                                 "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region",
                                 "Change in Negative Experience * Republican", "Change in Negative Experience * Independent")

cat(stargazer(change_cvlatepub_negexp_w2w3,change_cvlatepub_negexp_party_w2w3, 
              covariate.labels = varlabels_change_cvlatepub, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Change in State Slow to Social Dist."), float=F, df=F),
    file = "TABLES_FIGURES/change_cvlatepub_negexp_w2w3.tex")


# SM Table 36: Change Trust W1W2  ------------------------------------------

cdc_12 <- lm(pol_trust_cdc_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w1  + pol_trust_cdc_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                subset = negexpindex_CV_sum_revised_diff>=0)
cdc_p12 <- lm(pol_trust_cdc_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w1  + pol_trust_cdc_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                      subset = negexpindex_CV_sum_revised_diff>=0)
news_12 <- lm(pol_trust_news_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w1  + pol_trust_news_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                 subset = negexpindex_CV_sum_revised_diff>=0)
news_p12 <- lm(pol_trust_news_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w1  + pol_trust_news_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                       subset = negexpindex_CV_sum_revised_diff>=0)
sci_12 <- lm(pol_trust_sci_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w1  + pol_trust_sci_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                subset = negexpindex_CV_sum_revised_diff>=0)
sci_p12 <- lm(pol_trust_sci_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w1  + pol_trust_sci_w1   + dem_age_w1 + dem_latino_w1 + dem_income_w1 + dem_educ_w1 + dem_race_cat_w1 + dem_gender_cat_w1 + dem_urban_cat_w1 + Region_w1, data=df_set_w1w2,
                                      subset = negexpindex_CV_sum_revised_diff>=0)
cdc_12$AIC <- AIC(cdc_12)
cdc_p12$AIC <- AIC(cdc_p12)
news_12$AIC <- AIC(news_12)
news_p12$AIC <- AIC(news_p12)
sci_12$AIC <- AIC(sci_12)
sci_p12$AIC <- AIC(sci_p12)
varlabels_change_trust <- c( "Change in Sum of Negative Experience Index", "Republican", "Independent", 
                             "Baseline Trust CDC", "Baseline Trust News", "Baseline Trust Scientists",  
                             "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                             "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region",
                           "Change in Negative Experience * Republican", "Change in Negative Experience * Independent")
cat(stargazer(cdc_12,cdc_p12, 
              news_12, news_p12, 
              sci_12, sci_p12, 
              covariate.labels = varlabels_change_trust, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Change in Trust CDC", "Change in Trust News", "Change in Trust Scientists"), float=F, df=F),
    file = "TABLES_FIGURES/change_trust_negexp_w1w2.tex")

# SM Table 37: Change Trust W2W3  ------------------------------------------

cdc_23 <- lm(pol_trust_cdc_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2  + pol_trust_cdc_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                subset = negexpindex_CV_sum_revised_diff>=0)
cdc_p23 <- lm(pol_trust_cdc_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2  + pol_trust_cdc_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                subset = negexpindex_CV_sum_revised_diff>=0)
news_23 <- lm(pol_trust_news_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2  + pol_trust_news_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                 subset = negexpindex_CV_sum_revised_diff>=0)
news_p23 <- lm(pol_trust_news_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2  + pol_trust_news_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                 subset = negexpindex_CV_sum_revised_diff>=0)
sci_23 <- lm(pol_trust_sci_diff ~ negexpindex_CV_sum_revised_diff + party_id_dembase_w2  + pol_trust_sci_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                subset = negexpindex_CV_sum_revised_diff>=0)
sci_p23 <- lm(pol_trust_sci_diff ~ negexpindex_CV_sum_revised_diff*party_id_dembase_w2  + pol_trust_sci_w2   + dem_age_w2 + dem_latino_w2 + dem_income_w2 + dem_educ_w2 + dem_race_cat_w2 + dem_gender_cat_w2 + dem_urban_cat_w2 + Region_w2, data=df_set_w2w3,
                                subset = negexpindex_CV_sum_revised_diff>=0)

cdc_23$AIC <- AIC(cdc_23)
cdc_p23$AIC <- AIC(cdc_p23)
news_23$AIC <- AIC(news_23)
news_p23$AIC <- AIC(news_p23)
sci_23$AIC <- AIC(sci_23)
sci_p23$AIC <- AIC(sci_p23)

varlabels_change_trust <- c( "Change in Sum of Negative Experience Index", "Republican", "Independent", 
                           "Baseline Trust CDC", "Baseline Trust News", "Baseline Trust Scientists", 
                           "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                           "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region",
                           "Change in Negative Experience * Republican", "Change in Negative Experience * Independent")

cat(stargazer(cdc_23,cdc_p23, 
              news_23,news_p23, 
              sci_23,sci_p23, 
              covariate.labels = varlabels_change_trust, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Change in Trust CDC", "Change in Trust News", "Change in Trust Scientists"), float=F, df=F),
    file = "TABLES_FIGURES/change_trust_negexp_w2w3.tex")

# SM Table 38: Worry by Econ/Health ----------------------------------------------------------

worry_econhealth <- lm(cv4_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
worry_health_byparty <- lm(cv4_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
worry_econ_byparty <- lm(cv4_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)

health_econ_varlabels <- c("Health Negative Experience Index (Z)", "Econ Negative Experience Index (Z)", 
                           "Republican", "Independent", 
                           "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                           "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                           "Health Negative Experience Index * Republican", "Health Negative Experience Index * Independent",
                           "Econ Negative Experience Index * Republican", "Econ Negative Experience Index * Independent")
cat(stargazer(worry_econhealth, worry_health_byparty, worry_econ_byparty,
              covariate.labels = health_econ_varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry"),
              float=F, df=F),
    file = "TABLES_FIGURES/econhealth_worry_z.tex")

# SM Table 39: PPA by Econ/Health  ----------------------------------------------------------

ceh <- lm(cvcc5_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
chp <- lm(cvcc5_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
cep <- lm(cvcc5_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)

meh <- lm(cv_mask_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
mhp <- lm(cv_mask_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
mep <- lm(cv_mask_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)

veh <- lm(cv_vaccine_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
vhp <- lm(cv_vaccine_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
vep <- lm(cv_vaccine_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)

leh <- lm(cv_late.ind_slow_isolate_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
lhp <- lm(cv_late.ind_slow_isolate_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
lep <- lm(cv_late.ind_slow_isolate_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)


health_econ_varlabels <- c("Health Negative Experience Index (Z)", "Econ Negative Experience Index (Z)", 
                           "Republican", "Independent", 
                           "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                           "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                           "Health Negative Experience Index * Republican", "Health Negative Experience Index * Independent",
                           "Econ Negative Experience Index * Republican", "Econ Negative Experience Index * Independent")

cat(stargazer(meh, mhp, mep,
              veh, vhp, vep,
              ceh, chp, cep,
              leh, lhp, lep,
              covariate.labels = health_econ_varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Wear Mask Public", "Support Vaccine", "Effort to Self-Isolate", "Perception Slow to Self-Isolate"),
              float=F, df=F),
    file = "TABLES_FIGURES/econhealth_ppa_z.tex")

# SM Table 40: Policies by Econ/Health  ----------------------------------------------------------

lseh <- lm(cv_late.pub_state_slow_SD_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
lshp <- lm(cv_late.pub_state_slow_SD_z ~ negexpindex_CV_health_z*party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
lsep <- lm(cv_late.pub_state_slow_SD_z ~ negexpindex_CV_econ_z*party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)

reh <- lm(cv_reopen_reverse_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
rhp <- lm(cv_reopen_reverse_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
rep <- lm(cv_reopen_reverse_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)

cat(stargazer(lseh, lshp, lsep,
              reh, rhp, rep,
              covariate.labels = health_econ_varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("State Slow to Social Dist.", "Oppose Rapid Reopening"),
              float=F, df=F),
    file = "TABLES_FIGURES/econhealth_policies_z.tex")

# SM Table 41: Trust by Econ/Health  ----------------------------------------------------------

cdceh <- lm(pol_trust_cdc_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z + party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cdchp <- lm(pol_trust_cdc_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cdcep <- lm(pol_trust_cdc_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)

seh <- lm(pol_trust_sci_z ~ negexpindex_CV_health_z + negexpindex_CV_econ_z +party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
shp <- lm(pol_trust_sci_z ~ negexpindex_CV_health_z*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
sep <- lm(pol_trust_sci_z ~ negexpindex_CV_econ_z*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)


cat(stargazer(cdceh, cdchp, cdcep,
              seh, shp, sep,
              covariate.labels = health_econ_varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Trust in CDC", "Trust in Scientists"),
              float=F, df=F),
    file = "TABLES_FIGURES/econhealth_trust_z.tex")


# SM Table 42-43: Attrition ---------------------------------------------------------------

repeater_w1 <- lm(REP_w1w2 ~ negexpindex_CV_log_revised + party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w1, weights = weight_ANES)
repeater_party_w1 <- lm(REP_w1w2 ~ negexpindex_CV_log_revised*party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w1, weights = weight_ANES)
repeater_w2 <- lm(REP_w2w3 ~ negexpindex_CV_log_revised + party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w2, weights = weight_ANES)
repeater_party_w2 <- lm(REP_w2w3 ~ negexpindex_CV_log_revised*party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w2, weights = weight_ANES)

repeater_labels <- c("Negative Experience Index",  "Republican", "Independent", 
                           "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                           "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", 
                           "Negative Experience Index * Republican", "Negative Experience Index * Independent")

cat(stargazer(repeater_w1, repeater_party_w1, repeater_w2, repeater_party_w2,
              covariate.labels = repeater_labels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Return for W2", "Return for W3"),
              add.lines=list(c("Wave", "1", "1", "2", "2")),
              float=F, df=F),
    file = "TABLES_FIGURES/repeater_exp_party.tex")

# Use county cumulative counts for first date of next survey wave 
rep_county_w1 <- lm(REP_w1w2 ~ cv_day_confirmed_cum_june15_per100k_log + party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w1, weights = weight_ANES)
rep_county_party_w1 <- lm(REP_w1w2 ~ cv_day_confirmed_cum_june15_per100k_log*party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w1, weights = weight_ANES)
rep_county_w2 <- lm(REP_w2w3 ~ cv_day_confirmed_cum_oct9_per100k_log + party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w2, weights = weight_ANES)
rep_county_party_w2 <- lm(REP_w2w3 ~ cv_day_confirmed_cum_oct9_per100k_log*party_id_dembase + dem_age + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region, data=w2, weights = weight_ANES)

repeater_county_labels <- c("County Cumulative Covid Cases per 100k, Log (6/15/20)", "County Cumulative Covid Cases per 100k, Log (10/9/20)", 
                            "Republican", "Independent", 
                     "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                     "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", 
                     "County (6/15/20) * Republican", "County (6/15/20) * Independent",
                     "County (10/9/20) * Republican", "County (10/9/20) * Independent")

cat(stargazer(rep_county_w1, rep_county_party_w1, rep_county_w2, rep_county_party_w2,
              covariate.labels = repeater_county_labels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Return for W2", "Return for W3"),
              add.lines=list(c("Wave", "1", "1", "2", "2")),
              float=F, df=F),
    file = "TABLES_FIGURES/repeater_county_party.tex")


# SM Table 44-47 Benjamini-Hochberg and Bonferroni ------------------------------------------------------
#  adjusted p-value for Negative Experience Index * Republican
colnames(smtab12_adjusted) <- colnames(smtab13_adjusted) <- colnames(smtab14_adjusted) <- colnames(smtab15_adjusted) <- c("Outcome", "Benjamini-Hochberg", "Bonferroni")
smtab12_adjusted[smtab12_adjusted=="0"]<- "<.001"
smtab13_adjusted[smtab13_adjusted=="0"]<- "<.001"
smtab14_adjusted[smtab14_adjusted=="0"]<- "<.001"
smtab15_adjusted[smtab15_adjusted=="0"]<- "<.001"
smtab12_adjusted[smtab12_adjusted=="2e-05"]<- "<.001"
smtab15_adjusted[smtab15_adjusted=="2e-05"]<- "<.001"
smtab15_adjusted[smtab15_adjusted=="3e-05"]<- "<.001"

cat(print.xtable(xtable(smtab12_adjusted), floating=F, include.rownames=F), file = "TABLES_FIGURES/smtab12_adjusted.tex", sep="\n")
cat(print.xtable(xtable(smtab13_adjusted), floating=F, include.rownames=F), file = "TABLES_FIGURES/smtab13_adjusted.tex", sep="\n")
cat(print.xtable(xtable(smtab14_adjusted), floating=F, include.rownames=F), file = "TABLES_FIGURES/smtab14_adjusted.tex", sep="\n")
cat(print.xtable(xtable(smtab15_adjusted), floating=F, include.rownames=F), file = "TABLES_FIGURES/smtab15_adjusted.tex", sep="\n")

# SM Table 48-52 Full negative experience index  ------------------------------------------

exp1f <- lm(negexpindex_CV_log ~ cv_day_cases_cum_per100k_log + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
exp2f <- lm(negexpindex_CV_log ~ cv_day_cases_cum_per100k_log + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
exp3f <- lm(negexpindex_CV_log ~ cv_day_cases_cum_per100k_log + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)
exp1pf <- lm(negexpindex_CV_log ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w1, weights = weight_ANES)
exp2pf <- lm(negexpindex_CV_log ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
exp3pf <- lm(negexpindex_CV_log ~ cv_day_cases_cum_per100k_log*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w3, weights = weight_ANES)
varlabels_percexp <- c( "County Cumulative Covid Cases per 100k, Log", "Republican", "Independent",
                        "Age", "Latinx", "Income", "Education","Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
                        "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
                        "County Cases * Republican", "County Cases * Independent")
cat(stargazer(exp1f, exp1pf, exp2f, exp2pf, exp3f,exp3pf,
              covariate.labels = varlabels_percexp,
              float=FALSE, dep.var.labels=c("Perceived Negative Experience Index"),df = F,no.space = T,
              add.lines=list(c("Wave", "1", "1", "2", "2", "3", "3")), keep.stat=c("aic", "rsq","adj.rsq","f", "n"))
    , file = "TABLES_FIGURES/percexp_county_byparty_fullindex.tex", sep="\n")


cv4_fullindex <- lm(cv4_z ~ negexpindex_CV_log*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv2_comm_fullindex <- lm(cv2_comm_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cv3_comm_fullindex <- lm(cv3_comm_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cat(stargazer(cv4_fullindex, cv2_comm_fullindex, cv3_comm_fullindex, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry", "Current Harm Comm.", "Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worryharm_fullindex.tex")

cvcc5_f <- lm(cvcc5_z ~ negexpindex_CV_log*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
mask_f <- lm(cv_mask_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
vac_f <- lm(cv_vaccine_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
late_f <- lm(cv_late.ind_slow_isolate_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cat(stargazer(mask_f, vac_f, cvcc5_f, late_f,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Wear Mask Public", "Support Vaccine", "Important to Self-Isolate", "Perception Slow to Self-Isolate"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_ppa_fullindex.tex")

state_f <- lm(cv_late.pub_state_slow_SD_z ~ negexpindex_CV_log*party_id_dembase + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
reopen_f <- lm(cv_reopen_reverse_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
IO_f <- lm(cvIO_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
Gov_f <- lm(cvGovt_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cat(stargazer(state_f, reopen_f, IO_f, Gov_f,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("State Slow to Social Dist.", "Oppose Rapid Reopening", "IO Global Effort", "National Global Effort"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_policies_fullindex.tex")

cdc_f <- lm(pol_trust_cdc_z ~ negexpindex_CV_log*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
news_f <- lm(pol_trust_news_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
sci_f <- lm(pol_trust_sci_z ~ negexpindex_CV_log*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cat(stargazer(cdc_f, news_f, sci_f,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Trust in CDC", "Trust in News Media", "Trust in Scientists"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_trust_fullindex.tex")

# SM Table 53 County Climate Risk and FEMA -----------------------------------------------------------

percexp_countyfema_w2_cc <- lm(negexpindex_CC_log_revised ~ fema_total_declarations + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
percexp_countyfema_byparty_w2_cc <- lm(negexpindex_CC_log_revised ~ fema_total_declarations*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Total FEMA Declarations Jan 1, 2010 - Jun 15, 2020", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "FEMA Declarations * Republican", "FEMA Declarations * Independent")
cat(stargazer(percexp_countyfema_w2_cc, percexp_countyfema_byparty_w2_cc, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Negative Experience Index - Extreme Weather Last 10 Years"), float=F, df=F),
    file = "TABLES_FIGURES/percexp_countyfema_CC.tex")

# SM Table 54-55 Worry by County CC ---------------------------------------------

cc6_hazards <- lm(cc6_z ~ Hazards*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cc4_comm_hazards <- lm(cc4_comm_z ~ Hazards*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cc5_comm_hazards <- lm(cc5_comm_z ~ Hazards*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Natural Hazards Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Natural Hazards Index * Republican", "Natural Hazards Index * Independent")
cat(stargazer(cc6_hazards, cc4_comm_hazards, cc5_comm_hazards, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry", "Current Harm Comm.", "Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worryharm_countyhazards_CC.tex")

cc6_fema <- lm(cc6_z ~ fema_total_declarations*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cc4_comm_fema <- lm(cc4_comm_z ~ fema_total_declarations*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
cc5_comm_fema <- lm(cc5_comm_z ~ fema_total_declarations*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2, weights = weight_ANES)
varlabels <- c("Total FEMA Declarations Jan 1, 2010 - Jun 15, 2020", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "FEMA Declarations * Republican", "FEMA Declarations * Independent")
cat(stargazer(cc6_fema, cc4_comm_fema, cc5_comm_fema, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry", "Current Harm Comm.", "Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worryharm_countyfema_CC.tex")

# SM Table 56-60 Remove Earthquake from Climate Analyses ------------------------------

percexp_county_w2_cc_noearthquake <- lm(negexpindex_CC_log_revised ~ Hazards_noearthquake + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
percexp_county_byparty_w2_cc_noearthquake <- lm(negexpindex_CC_log_revised ~ Hazards_noearthquake*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
varlabels <- c("Natural Hazards Index (No Earthquake)", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Natural Hazards Index * Republican", "Natural Hazards Index * Independent")
cat(stargazer(percexp_county_w2_cc_noearthquake, percexp_county_byparty_w2_cc_noearthquake, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Negative Experience Index - Extreme Weather Last 10 Years"), float=F, df=F),
    file = "TABLES_FIGURES/percexp_county_CC_noearthquake.tex")

percexp_countyfemaclimate_w2_cc_noearthquake <- lm(negexpindex_CC_log_revised ~ fema_total_declarations_climate + party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
percexp_countyfemaclimate_byparty_w2_cc_noearthquake <- lm(negexpindex_CC_log_revised ~ fema_total_declarations_climate*party_id_dembase + dem_age + dem_latino + dem_income + dem_educ + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
varlabels <- c("Total FEMA Declarations Jan 1, 2010 - Jun 15, 2020 (No Earthquake)", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "FEMA Declarations * Republican", "FEMA Declarations * Independent")
cat(stargazer(percexp_countyfemaclimate_w2_cc_noearthquake, percexp_countyfemaclimate_byparty_w2_cc_noearthquake, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Negative Experience Index - Extreme Weather Last 10 Years"), float=F, df=F),
    file = "TABLES_FIGURES/percexp_countyfemaclimate_CC_noearthquake.tex")

cc6_noearthquake <- lm(cc6_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
cc4_comm_noearthquake <- lm(cc4_comm_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
cc5_comm_noearthquake <- lm(cc5_comm_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cat(stargazer(cc6_noearthquake, cc4_comm_noearthquake, cc5_comm_noearthquake, covariate.labels = varlabels, no.space = T, keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Worry", "Current Harm Comm.", "Future Harm Comm"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_worryharm_CC_noearthquake.tex")

cvcc6_noearthquake <- lm(cvcc6_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake)
ccIO_noearthquake <- lm(ccIO_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake)
ccGovt_noearthquake <- lm(ccGovt_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cat(stargazer(cvcc6_noearthquake,ccIO_noearthquake,ccGovt_noearthquake,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Individuals Take Action", "IO Global Effort", "National Global Effort"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_ppapolicies_CC_noearthquake.tex")


epa_CC_noearthquake <- lm(pol_trust_epa_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age  + dem_income + dem_educ + dem_latino + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
news_CC_noearthquake <- lm(pol_trust_news_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
sci_CC_noearthquake <- lm(pol_trust_sci_z ~ negexpindex_CC_log_revised*party_id_dembase  + dem_age + dem_income + dem_educ+ dem_latino  + dem_race_cat + dem_gender_cat + dem_urban_cat + Region + REPEATER, data=w2_noearthquake, weights = weight_ANES_noearthquake)
varlabels <- c("Negative Experience Index", "Republican", "Independent", 
               "Age", "Income", "Education", "Latinx", "Asian", "Black", "Pacific Islander", "Multi Racial", "Native American", "Other Race", 
               "Male", "Self-Describe", "Suburban", "Urban", "NE Region", "S Region", "W Region", "Repeat Respondent", 
               "Negative Experience Index * Republican", "Negative Experience Index * Independent")
cat(stargazer(epa_CC_noearthquake, news_CC_noearthquake, sci_CC_noearthquake,
              covariate.labels = varlabels, no.space = T, 
              keep.stat=c("aic", "rsq","adj.rsq","f", "n"),
              dep.var.labels = c("Trust in EPA", "Trust in News Media", "Trust in Scientists"), float=F, df=F),
    file = "TABLES_FIGURES/interaction_trust_CC_noearthquake.tex")

# ------------ SUMMARY STATISTICS - INDEPENDENT VARIABLES + CONTROLS -------------

options(qwraps2_markup = "latex")
df_set <- as.data.frame(df_set)

summary_statistics <-
  list(
    "County Incidence" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv_day_cases_cum_per100k_log, na_rm = TRUE),
        "min" = ~min(cv_day_cases_cum_per100k_log, na.rm = TRUE),
        "max" = ~round(max(cv_day_cases_cum_per100k_log, na.rm = TRUE),digits=2)
      ),
    "Negative Experience" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(negexpindex_CV_log_revised, na_rm = TRUE),
        "min" = ~min(negexpindex_CV_log_revised, na.rm = TRUE),
        "max" = ~round(max(negexpindex_CV_log_revised, na.rm = TRUE),digits=2)
      ),
    "Party" =
      list(
        "Republican" = ~qwraps2::n_perc(na.omit(party_id)=="Rep"),
        "Democrat" = ~qwraps2::n_perc(na.omit(party_id)=="Dem"),
        "Independent" = ~qwraps2::n_perc(na.omit(party_id)=="Ind")
      ),
    "Age" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(dem_age, na_rm = TRUE),
        "min" = ~min(dem_age, na.rm = TRUE),
        "max" = ~max(dem_age, na.rm = TRUE)
      ),
    "Education" =
      list(
        "Advanced degree" = ~qwraps2::n_perc(na.omit(dem_educ)==6),
        "Bachelor degree" = ~qwraps2::n_perc(na.omit(dem_educ)==5),
        "Associate degree" = ~qwraps2::n_perc(na.omit(dem_educ)==4),
        "Some college, no degree" = ~qwraps2::n_perc(na.omit(dem_educ)==3),
        "HS diploma or GED" = ~qwraps2::n_perc(na.omit(dem_educ)==2),
        "HS, no diploma" = ~qwraps2::n_perc(na.omit(dem_educ)==1)
      ),
    "Income in $1000" =
      list(
        ">200" = ~qwraps2::n_perc(na.omit(dem_income)==6),
        "100-200" = ~qwraps2::n_perc(na.omit(dem_income)==5),
        "75-99" = ~qwraps2::n_perc(na.omit(dem_income)==4),
        "50-74" = ~qwraps2::n_perc(na.omit(dem_income)==3),
        "25-49" = ~qwraps2::n_perc(na.omit(dem_income)==2),
        "<25" = ~qwraps2::n_perc(na.omit(dem_income)==1)
      ),
    "Latinx" =
      list(
        "Yes" = ~qwraps2::n_perc(na.omit(dem_latino)==1)  
      ),
    "Race" =
      list(
        "White" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="white"),
        "Asian" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="asian"),
        "Black" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="black"),
        "Pacific Islander" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="islander"),
        "Native American" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="native"),
        "Multiracial" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="multiracial"),
        "Other" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="other")
      ),
    "Gender" =
      list(
        "Female" = ~qwraps2::n_perc(na.omit(dem_gender_cat)=="female"),
        "Self-describe" = ~qwraps2::n_perc(na.omit(dem_gender_cat)=="other")
      ),
    "Geographic Classification" =
      list(
        "Urban" = ~qwraps2::n_perc(na.omit(dem_urban_cat)=="urban"),
        "Suburban" = ~qwraps2::n_perc(na.omit(dem_urban_cat)=="suburban"),
        "Rural" = ~qwraps2::n_perc(na.omit(dem_urban_cat)=="rural")
      ),
    "Region" =
      list(
        "Midwest" = ~qwraps2::n_perc(na.omit(Region)=="MW"),
        "Northeast" = ~qwraps2::n_perc(na.omit(Region)=="NE"),
        "South" = ~qwraps2::n_perc(na.omit(Region)=="S"),
        "West" = ~qwraps2::n_perc(na.omit(Region)=="W")
      )   
  )

table <- qwraps2::summary_table(
  dplyr::group_by(df_set, WAVE),
  summary_statistics
)

print(table, caption = "Summary Statistics: Independent Variables and Controls", markup = "latex")


# ------------ SUMMARY STATISTICS - DVS -------------

options(qwraps2_markup = "latex")
df_set <- as.data.frame(df_set)

summary_statistics <-
  list(
    "Worry (CV)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv4, na_rm = TRUE),
        "min" = ~min(cv4, na.rm = TRUE),
        "max" = ~max(cv4, na.rm = TRUE)
      ),
    "Wearing Mask" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv_mask, na_rm = TRUE),
        "min" = ~min(cv_mask, na.rm = TRUE),
        "max" = ~max(cv_mask, na.rm = TRUE)
      ),
    "Harm to Community, current (CV)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv2_comm, na_rm = TRUE),
        "min" = ~min(cv2_comm, na.rm = TRUE),
        "max" = ~max(cv2_comm, na.rm = TRUE)
      ),
    "Harm to Community, future (CV)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv3_comm, na_rm = TRUE),
        "min" = ~min(cv3_comm, na.rm = TRUE),
        "max" = ~max(cv3_comm, na.rm = TRUE)
      ),
    "Important to Act (CV)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cvcc5, na_rm = TRUE),
        "min" = ~min(cvcc5, na.rm = TRUE),
        "max" = ~max(cvcc5, na.rm = TRUE)
      ),
    "Vaccination Intention" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv_vaccine, na_rm = TRUE),
        "min" = ~min(cv_vaccine, na.rm = TRUE),
        "max" = ~max(cv_vaccine, na.rm = TRUE)
      ),
    "Slow to Isolate" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv_late.ind_slow_isolate, na_rm = TRUE),
        "min" = ~min(cv_late.ind_slow_isolate, na.rm = TRUE),
        "max" = ~max(cv_late.ind_slow_isolate, na.rm = TRUE)
      ),
    "Slow to Mandate Social Distance" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv_late.pub_state_slow_SD, na_rm = TRUE),
        "min" = ~min(cv_late.pub_state_slow_SD, na.rm = TRUE),
        "max" = ~max(cv_late.pub_state_slow_SD, na.rm = TRUE)
      ),
    "Reopening the Economy (Reverse)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv_reopen_reverse, na_rm = TRUE),
        "min" = ~min(cv_reopen_reverse, na.rm = TRUE),
        "max" = ~max(cv_reopen_reverse, na.rm = TRUE)
      ),
    "Contribute to Int'l Org Effort (CV)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cvIO, na_rm = TRUE),
        "min" = ~min(cvIO, na.rm = TRUE),
        "max" = ~max(cvIO, na.rm = TRUE)
      ),
    "Contribute to Int'l Gov Effort (CV)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cvGovt, na_rm = TRUE),
        "min" = ~min(cvGovt, na.rm = TRUE),
        "max" = ~max(cvGovt, na.rm = TRUE)
      ),
    "Trust in CDC" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(pol_trust_cdc, na_rm = TRUE),
        "min" = ~min(pol_trust_cdc, na.rm = TRUE),
        "max" = ~max(pol_trust_cdc, na.rm = TRUE)
      ),
    "Trust in News Media" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(pol_trust_news, na_rm = TRUE),
        "min" = ~round(min(pol_trust_news, na.rm = TRUE),digits=2),
        "max" = ~round(max(pol_trust_news, na.rm = TRUE),digits=2)
      ),
    "Trust in Scientists" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(pol_trust_sci, na_rm = TRUE),
        "min" = ~round(min(pol_trust_sci, na.rm = TRUE),digits=2),
        "max" = ~round(max(pol_trust_sci, na.rm = TRUE),digits=2)
      ),
    "Worry (CC)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cc6, na_rm = TRUE),
        "min" = ~round(min(cc6, na.rm = TRUE),digits=2),
        "max" = ~round(max(cc6, na.rm = TRUE),digits=2)
      ),
    "Harm to Community, current (CC)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cc4_comm, na_rm = TRUE),
        "min" = ~round(min(cc4_comm, na.rm = TRUE),digits=2),
        "max" = ~round(max(cc4_comm, na.rm = TRUE),digits=2)
      ),
    "Harm to Community, future (CC)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cc5_comm, na_rm = TRUE),
        "min" = ~round(min(cc5_comm, na.rm = TRUE),digits=2),
        "max" = ~round(max(cc5_comm, na.rm = TRUE),digits=2)
      ),
    "Important to Act (CC)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cvcc6, na_rm = TRUE),
        "min" = ~round(min(cvcc6, na.rm = TRUE),digits=2),
        "max" = ~round(max(cvcc6, na.rm = TRUE),digits=2)
      ),
    "Mitigation Behaviors (CC)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cc_behaviorchange, na_rm = TRUE),
        "min" = ~round(min(cc_behaviorchange, na.rm = TRUE),digits=2),
        "max" = ~round(max(cc_behaviorchange, na.rm = TRUE),digits=2)
      ),
    "Contribute to Int'l Org Effort (CC)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(ccIO, na_rm = TRUE),
        "min" = ~round(min(ccIO, na.rm = TRUE),digits=2),
        "max" = ~round(max(ccIO, na.rm = TRUE),digits=2)
      ),
    "Contribute to Int'l Gov Effort (CC)" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(ccGovt, na_rm = TRUE),
        "min" = ~round(min(ccGovt, na.rm = TRUE),digits=2),
        "max" = ~round(max(ccGovt, na.rm = TRUE),digits=2)
      ),
    "Trust in the EPA" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(pol_trust_epa, na_rm = TRUE),
        "min" = ~round(min(pol_trust_epa, na.rm = TRUE),digits=2),
        "max" = ~round(max(pol_trust_epa, na.rm = TRUE),digits=2)
      )
  )

table2 <- summary_table(
  dplyr::group_by(df_set, WAVE),
  summary_statistics
)

print(table2, caption = "Summary Statistics: Dependent Variables", markup = "latex")

# ------------ SUMMARY STATISTICS - REPEATERS ----------

options(qwraps2_markup = "latex")
w2 <- as.data.frame(w2)

summary_statistics <-
  list(
    "County Incidence" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(cv_day_cases_cum_per100k_log, na_rm = TRUE),
        "min" = ~min(cv_day_cases_cum_per100k_log, na.rm = TRUE),
        "max" = ~round(max(cv_day_cases_cum_per100k_log, na.rm = TRUE),digits=2)
      ),
    "Negative Experience" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(negexpindex_CV_log_revised, na_rm = TRUE),
        "min" = ~min(negexpindex_CV_log_revised, na.rm = TRUE),
        "max" = ~round(max(negexpindex_CV_log_revised, na.rm = TRUE),digits=2)
      ),
    "Party" =
      list(
        "Republican" = ~qwraps2::n_perc(na.omit(party_id)=="Rep"),
        "Democrat" = ~qwraps2::n_perc(na.omit(party_id)=="Dem"),
        "Independent" = ~qwraps2::n_perc(na.omit(party_id)=="Ind")
      ),
    "Age" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(dem_age, na_rm = TRUE),
        "min" = ~min(dem_age, na.rm = TRUE),
        "max" = ~max(dem_age, na.rm = TRUE)
      ),
    "Education" =
      list(
        "Advanced degree" = ~qwraps2::n_perc(na.omit(dem_educ)==6),
        "Bachelor degree" = ~qwraps2::n_perc(na.omit(dem_educ)==5),
        "Associate degree" = ~qwraps2::n_perc(na.omit(dem_educ)==4),
        "Some college, no degree" = ~qwraps2::n_perc(na.omit(dem_educ)==3),
        "HS diploma or GED" = ~qwraps2::n_perc(na.omit(dem_educ)==2),
        "HS, no diploma" = ~qwraps2::n_perc(na.omit(dem_educ)==1)
      ),
    "Income in $1000" =
      list(
        ">200" = ~qwraps2::n_perc(na.omit(dem_income)==6),
        "100-200" = ~qwraps2::n_perc(na.omit(dem_income)==5),
        "75-99" = ~qwraps2::n_perc(na.omit(dem_income)==4),
        "50-74" = ~qwraps2::n_perc(na.omit(dem_income)==3),
        "25-49" = ~qwraps2::n_perc(na.omit(dem_income)==2),
        "<25" = ~qwraps2::n_perc(na.omit(dem_income)==1)
      ),
    "Latinx" =
      list(
        "Yes" = ~qwraps2::n_perc(na.omit(dem_latino)==1)  
      ),
    "Race" =
      list(
        "White" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="white"),
        "Asian" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="asian"),
        "Black" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="black"),
        "Pacific Islander" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="islander"),
        "Native American" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="native"),
        "Multiracial" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="multiracial"),
        "Other" = ~qwraps2::n_perc(na.omit(dem_race_cat)=="other")
      ),
    "Gender" =
      list(
        "Female" = ~qwraps2::n_perc(na.omit(dem_gender_cat)=="female"),
        "Self-describe" = ~qwraps2::n_perc(na.omit(dem_gender_cat)=="other")
      ),
    "Geographic Classification" =
      list(
        "Urban" = ~qwraps2::n_perc(na.omit(dem_urban_cat)=="urban"),
        "Suburban" = ~qwraps2::n_perc(na.omit(dem_urban_cat)=="suburban"),
        "Rural" = ~qwraps2::n_perc(na.omit(dem_urban_cat)=="rural")
      ),
    "Region" =
      list(
        "Midwest" = ~qwraps2::n_perc(na.omit(Region)=="MW"),
        "Northeast" = ~qwraps2::n_perc(na.omit(Region)=="NE"),
        "South" = ~qwraps2::n_perc(na.omit(Region)=="S"),
        "West" = ~qwraps2::n_perc(na.omit(Region)=="W")
      )   
  )


table <- qwraps2::summary_table(
  dplyr::group_by(w2, REPEATER),
  summary_statistics
)

print(table, caption = "Summary Statistics: Repeat Participants, Wave 2", markup = "latex")
```


 
During the COVID-19 epidemic, the results section looks at how people's past negative experiences, political leanings, and trust in crisis institutions and actors all connected. Differences in partisans' faith in the Centers for Disease Control and Prevention (CDC), the media, and scientists are examined. Republicans with no negative experiences seem to have much less trust in these actors than Democrats do. When it comes to having faith in the media, the gap between the parties is especially glaring. County-level incidence rates and longitudinal data are incorporated into the analysis to shed light on the connection between environmental factors and individual responses. However, there is not always a substantial correlation between county incidence rates, partisanship, and outcome variables (worry, behaviors, policy support, and trust). Except for Republicans, who are more likely to report wearing masks in public if they live in a high-incidence county, there is no statistically significant relationship between county incidence rates and anxiety. Similarly, for most indicators of behavior, policy, and trust, there is no significant relationship between county incidence rates and Republican affiliation.
A longitudinal examination of the panel data demonstrates that a change in negative experience with the virus inside an individual is associated with an increase in anxiety, behavior, and support for policy. Republicans and Democrats do not differ considerably in the impact of experience on these factors. When it comes to concern over climate change, there is a large party gap that has persisted through the tides. The partisan divide on climate change concern is diminished by direct contact with the effects of catastrophic disasters. Negative life events cause Republicans to place a higher value on taking personal action to combat climate change. Support for national and international initiatives to prevent climate change and trust in important actors are both positively impacted.

In general, the findings show that exposure to COVID-19 and other environmental hazards might negatively affect trust, anxiety, behavior, and support for policy. While there are party differences in some of these areas, there is no evidence that Republicans and Democrats view the value of experience differently. Having a bad experience increases your level of anxiety, but there is no solid link between bad experiences and subsequent actions or policy support.
 

 
## 4. Conclusions

 
The study found that partisan identification and personal experience shape COVID-19 opinions. The data show political differences in fear, protective behaviors, and pandemic risk policies. The study also shows "party over policy" impacts, with Republicans being more inclined to accept a COVID-19 policy advocated by their party. These findings show that copartisan messaging is vital to gaining policy support for contentious issues, even health threats.
The study investigates how partisanship and personal experience interact. Negative COVID-19 encounters narrow partisan gaps on many responses. Republicans who have personally suffered are more inclined to support pandemic mitigation programs. COVID-19 experience increases trust in crisis communication institutions, especially among Republicans. The study adds that while personal experience may overcome partisan barriers, the correlational character of the findings cautions against conclusive conclusions.
The analysis shows that COVID-19 experience is not simply influenced by partisan identification, suggesting that threat signals can transcend partisan prejudices. In most analyses, county-level incidence rates replace self-reported experience, making the connections statistically inconsequential. Population density, income, occupation types, and COVID-19 policy decisions may impact behavior and opinion regardless of personal experience. More research is needed on how state and county COVID-19 testing and data reporting methods affect attitudes and behaviors.
Within-subject variations in experience show varied impacts on behavior and policy support in the study's panel format. Experience predicts fear, but it does not always lead to mitigation or policy support. The findings show that personal experience may not be enough to motivate bipartisan policy support for contested subjects. Self-reported data may be biased by partisanship.
The study shows that partisanship, personal experience, and COVID-19 reactions are complex. Partisan-motivated reasoning may make sense, but experience can strongly influence worry. However, party identification does not guarantee action or policy support. Similar to climate change, partisanship influences threat perceptions. Future research should examine partisan heterogeneity and how political party in power affects experience perceptions.  


## 5. References   


1. E. U. Weber, “Giving the future a chance: Behavioral economic responses to the dual challenges of covid-19 and the climate crisis” in The Behavioral Economics Guide, A. Samson, Ed. (Behavioral Science Solutions Ltd, 2020), pp. 2–15.   

2. R. L. Gregory, Eye and Brain: The Psychology of Seeing (McGraw-Hill, 1973).  

3. T. A. Myers, E. W. Maibach, C. Roser-Renouf, K. Akerlof, A. A. Leiserowitz, The relationship between personal experience and belief in the reality of global warming. Nat. Clim. Chang. 3, 343–347 (2013).  

4. E. U. Weber, Seeing is believing: Understanding & aiding human responses to global climate change. Daedalus 149, 139–150 (2020).  

5. P. D. Howe, J. R. Marlon, M. Mildenberger, B. S. Shield, How will climate change shape climate opinion? Environ. Res. Lett. 14, 113001 (2019).  


6. P. D. Howe, Extreme weather experience and climate change opinion. Curr. Opin. Behav. Sci. 42, 127–131 (2021).  


7. R. Rescorla, A. Wagner, “A theory of pavlovian conditioning: Variations in the effectiveness of reinforcement and nonreinforcement” in Classical Conditioning II: Current Research and Theory, A. Black, W. Prokasy, Eds. (Appleton Century Crofts, New York, 1972), pp. 64–99.  

8.  H. E. den Ouden, P. Kok, F. P. de Lange, How prediction errors shape perception, attention, and motivation. Front. Psychol. 3, 548 (2012).  

9.  E. U. Weber, P. G. Lindemann, “From intuition to analysis: Making decisions with our head, our heart, or by the book” in Intuition in Judgment and Decision Making, H. Plessner, C. Betsch, T. Betsch, Eds. (Lawrence Erlbaum, Mahwah, NJ, 2007), pp. 191–208.


