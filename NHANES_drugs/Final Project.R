# Load NHANES Dataset
#install.packages(NHANES)
library(NHANES)
data("NHANES")
ls(NHANES)
NHANES<-NHANES[!duplicated(NHANES$ID),]

#install.packages(NHANES)
library(nhanesA)
#https://cran.r-project.org/web/packages/nhanesA/vignettes/Introducing_nhanesA.html
nhanesTables('DEMOGRAPHICS', 2010)
nhanesTables('DIETARY', 2010)
nhanesTables('EXAMINATION', 2010)
nhanesTables('LABORATORY', 2010)
nhanesTables('QUESTIONNAIRE', 2010)

# Data
df <- NHANES[c("DaysMentHlthBad", "AlcoholYear", "SmokeNow", "Marijuana", "HardDrugs", "Age", "Gender", "Race1", "DaysPhysHlthBad", "Depressed")]
df <- na.omit(df)

df$DaysMentHlthBad[df$SmokeNow=='Yes']

df$AlcoholYearFactor <- cut(
  df$AlcoholYear,
  breaks = c(0, 1, 100000), # Define range boundaries
  labels = c(0, 1), # Assign labels
  right = FALSE # Include the lower bound, exclude the upper bound
)
df$AlcoholYearFactor <- as.numeric(df$AlcoholYearFactor)

df$MentHlthFactor <- cut(
  df$DaysMentHlthBad,
  breaks = c(0, 1, 5, 14, 100), # Define range boundaries
  labels = c(0, 1, 2, 3), # Assign labels (None, Below Avg, Above Avg, Frequent)
  right = FALSE # Include the lower bound, exclude the upper bound
)
df$MentHlthFactor <- as.numeric(df$MentHlthFactor)

summary(df$AlcoholYear)
hist(df$AlcoholYear)
hist(df$AlcoholYearFactor)

summary(df$DaysMentHlthBad)
hist(df$DaysMentHlthBad, breaks=30)
hist(df$DaysMentHlthBad[df$MentHlthFactor==4])

summary(as.numeric(df$SmokeNow)-1)
summary(as.numeric(df$Marijuana)-1)
summary(as.numeric(df$HardDrugs)-1)

# Stratify -> Analyze
# Correlation Analysis
# Spearman p Test
# Logistic Regression

# Mental Health -> Drugs
mentalAlcohol <- t.test(df$AlcoholYear[df$DaysMentHlthBad >= 14], df$AlcoholYear[df$DaysMentHlthBad < 14], alternative = "two.sided", var.equal = TRUE) # Stratify
mentalSmoke <- t.test(as.numeric(df$SmokeNow[df$DaysMentHlthBad >= 14])-1, as.numeric(df$SmokeNow[df$DaysMentHlthBad < 14])-1, alternative = "two.sided", var.equal = TRUE)
mentalWeed <- t.test(as.numeric(df$Marijuana[df$DaysMentHlthBad >= 14])-1, as.numeric(df$Marijuana[df$DaysMentHlthBad < 14])-1, alternative = "two.sided", var.equal = TRUE)
mentalHard <- t.test(as.numeric(df$HardDrugs[df$DaysMentHlthBad >= 14])-1, as.numeric(df$HardDrugs[df$DaysMentHlthBad < 14])-1, alternative = "two.sided", var.equal = TRUE)

mentalAlcohol <- cor.test(df$DaysMentHlthBad, df$AlcoholYear, method = "spearman", exact=FALSE) # Analysis
mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad, data = df, family = binomial()) # summary(mentalSmoke)
mentalWeed <- glm(Marijuana ~ DaysMentHlthBad, data = df, family = binomial()) # summary(mentalWeed)
mentalHard <- glm(HardDrugs ~ DaysMentHlthBad, data = df, family = binomial()) # summary(mentalHard)

par(mfrow = c(2, 2))
plot(mentalSmoke)

# Drugs -> Mental Health
alcoholMental <- t.test(df$DaysMentHlthBad[df$AlcoholYear >= 1], df$DaysMentHlthBad[df$AlcoholYear < 1], alternative = "two.sided", var.equal = TRUE) # Stratify
smokeMental <- t.test(df$DaysMentHlthBad[as.numeric(df$SmokeNow)==1], df$DaysMentHlthBad[as.numeric(df$SmokeNow)==2], alternative = "two.sided", var.equal = TRUE)
weedMental <- t.test(df$DaysMentHlthBad[as.numeric(df$Marijuana)==1], df$DaysMentHlthBad[as.numeric(df$Marijuana)==2], alternative = "two.sided", var.equal = TRUE)
hardMental <- t.test(df$DaysMentHlthBad[as.numeric(df$HardDrugs)==1], df$DaysMentHlthBad[as.numeric(df$HardDrugs)==2], alternative = "two.sided", var.equal = TRUE)

alcoholMental <- cor.test(df$DaysMentHlthBad, df$AlcoholYear, method = "spearman", exact=FALSE) # Analysis
smokeMental <- wilcox.test(df$DaysMentHlthBad[df$SmokeNow=="Yes"], df$DaysMentHlthBad[df$SmokeNow=="No"], alternative = "two.sided")
weedMental <- wilcox.test(df$DaysMentHlthBad[df$Marijuana=="Yes"], df$DaysMentHlthBad[df$Marijuana=="No"], alternative = "two.sided")
hardMental <- wilcox.test(df$DaysMentHlthBad[df$HardDrugs=="Yes"], df$DaysMentHlthBad[df$HardDrugs=="No"], alternative = "two.sided")

# Correlation between Drugs and Mental Health
smokeMental <- cor(as.numeric(df$SmokeNow), df$DaysMentHlthBad, method = "pearson")
weedMental <- cor(as.numeric(df$Marijuana), df$DaysMentHlthBad, method = "pearson")
hardMental <- cor(as.numeric(df$HardDrugs), df$DaysMentHlthBad, method = "pearson")
smokeMental
weedMental
hardMental


# Drugs <-> Drugs
        # Alcohol vs Rest
alcoholSmoke <- glm(SmokeNow ~ AlcoholYear, data = df, family = binomial()) # summary(alcoholSmoke)
alcoholWeed <- glm(Marijuana ~ AlcoholYear, data = df, family = binomial()) # summary(alcoholWeed)
alcoholHard <- glm(HardDrugs ~ AlcoholYear, data = df, family = binomial()) # summary(alcoholHard)

smokeAlcohol <- wilcox.test(df$AlcoholYear[df$SmokeNow=="Yes"], df$AlcoholYear[df$SmokeNow=="No"], alternative = "two.sided")
weedAlcohol <- wilcox.test(df$AlcoholYear[df$Marijuana=="Yes"], df$AlcoholYear[df$Marijuana=="No"], alternative = "two.sided")
hardAlcohol <- wilcox.test(df$AlcoholYear[df$HardDrugs=="Yes"], df$AlcoholYear[df$HardDrugs=="No"], alternative = "two.sided")

smokeAlcohol <- cor(as.numeric(df$SmokeNow), df$AlcoholYear, method = "pearson")
weedAlcohol <- cor(as.numeric(df$Marijuana), df$AlcoholYear, method = "pearson")
hardAlcohol <- cor(as.numeric(df$HardDrugs), df$AlcoholYear, method = "pearson")

        # Drugs vs Drugs
smokeWeed <- chisq.test(table(df[c('SmokeNow', 'Marijuana')])) # A <-> B (Chi-Square Test)
smokeHard <- chisq.test(table(df[c('SmokeNow', 'HardDrugs')]))
weedHard <- chisq.test(table(df[c('Marijuana', 'HardDrugs')]))

smokeWeed <- fisher.test(table(df[c('SmokeNow', 'Marijuana')])) # A <-> B (Fisher Test)
smokeHard <- fisher.test(table(df[c('SmokeNow', 'HardDrugs')]))
weedHard <- fisher.test(table(df[c('Marijuana', 'HardDrugs')]))

library(psych)
smokeWeed <- phi(table(df$SmokeNow, df$Marijuana))
smokeHard <- phi(table(df$SmokeNow, df$HardDrugs))
weedHard <- phi(table(df$Marijuana, df$HardDrugs)) # A <-> B Phi Coefficient


# Subgroup Analysis

# Age
# Mental Health + Age -> Drugs
mentalAlcohol <- lm(AlcoholYear ~ DaysMentHlthBad + Age, data = df) # summary(mentalAlcohol)
mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad + Age, data = df, family = binomial()) # summary(mentalSmoke)
mentalWeed <- glm(Marijuana ~ DaysMentHlthBad + Age, data = df, family = binomial()) # summary(mentalWeed)
mentalHard <- glm(HardDrugs ~ DaysMentHlthBad + Age, data = df, family = binomial()) # summary(mentalHard)

# Race
mentalAlcohol <- cor.test(df$DaysMentHlthBad[df$Race1=='White'], df$AlcoholYear[df$Race1=='White'], method = "spearman", exact=FALSE)
mentalAlcohol # S = 80897185, p-value = 0.1013
mentalAlcohol <- cor.test(df$DaysMentHlthBad[df$Race1=='Mexican'], df$AlcoholYear[df$Race1=='Mexican'], method = "spearman", exact=FALSE)
mentalAlcohol # S = 333735, p-value = 0.8028
mentalAlcohol <- cor.test(df$DaysMentHlthBad[df$Race1=='Hispanic'], df$AlcoholYear[df$Race1=='Hispanic'], method = "spearman", exact=FALSE)
mentalAlcohol # S = 76376, p-value = 0.461
mentalAlcohol <- cor.test(df$DaysMentHlthBad[df$Race1=='Black'], df$AlcoholYear[df$Race1=='Black'], method = "spearman", exact=FALSE)
mentalAlcohol # S = 650383, p-value = 0.2989
mentalAlcohol <- cor.test(df$DaysMentHlthBad[df$Race1=='Other'], df$AlcoholYear[df$Race1=='Other'], method = "spearman", exact=FALSE)
mentalAlcohol # S = 75286, p-value = 0.05687

mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad, data = df[df$Race1=='White',], family = binomial()) # summary(mentalSmoke)
summary(mentalSmoke) # p = 0.0056 **
mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad, data = df[df$Race1=='Mexican',], family = binomial()) # summary(mentalSmoke)
summary(mentalSmoke)
mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad, data = df[df$Race1=='Hispanic',], family = binomial()) # summary(mentalSmoke)
summary(mentalSmoke)
mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad, data = df[df$Race1=='Black',], family = binomial()) # summary(mentalSmoke)
summary(mentalSmoke)
mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad, data = df[df$Race1=='Other',], family = binomial()) # summary(mentalSmoke)
summary(mentalSmoke)

mentalWeed <- glm(Marijuana ~ DaysMentHlthBad, data = df[df$Race1=='White',], family = binomial()) # summary(mentalWeed)
summary(mentalWeed)
mentalWeed <- glm(Marijuana ~ DaysMentHlthBad, data = df[df$Race1=='Mexican',], family = binomial()) # summary(mentalWeed)
summary(mentalWeed)
mentalWeed <- glm(Marijuana ~ DaysMentHlthBad, data = df[df$Race1=='Hispanic',], family = binomial()) # summary(mentalWeed)
summary(mentalWeed) # 0.0338
mentalWeed <- glm(Marijuana ~ DaysMentHlthBad, data = df[df$Race1=='Black',], family = binomial()) # summary(mentalWeed)
summary(mentalWeed)
mentalWeed <- glm(Marijuana ~ DaysMentHlthBad, data = df[df$Race1=='Other',], family = binomial()) # summary(mentalWeed)
summary(mentalWeed) # 0.0258

mentalHard <- glm(HardDrugs ~ DaysMentHlthBad, data = df[df$Race1=='White',], family = binomial()) # summary(mentalHard)
summary(mentalHard)
mentalHard <- glm(HardDrugs ~ DaysMentHlthBad, data = df[df$Race1=='Mexican',], family = binomial()) # summary(mentalHard)
summary(mentalHard)
mentalHard <- glm(HardDrugs ~ DaysMentHlthBad, data = df[df$Race1=='Hispanic',], family = binomial()) # summary(mentalHard)
summary(mentalHard)
mentalHard <- glm(HardDrugs ~ DaysMentHlthBad, data = df[df$Race1=='Black',], family = binomial()) # summary(mentalHard)
summary(mentalHard)
mentalHard <- glm(HardDrugs ~ DaysMentHlthBad, data = df[df$Race1=='Other',], family = binomial()) # summary(mentalHard)
summary(mentalHard) # 0.0363

# Physical Health
# Mental Health + Physical Health -> Drugs
mentalAlcohol <- lm(AlcoholYear ~ DaysMentHlthBad + DaysPhysHlthBad, data = df) # summary(mentalAlcohol)
mentalSmoke <- glm(SmokeNow ~ DaysMentHlthBad + DaysPhysHlthBad, data = df, family = binomial()) # summary(mentalSmoke)
mentalWeed <- glm(Marijuana ~ DaysMentHlthBad + DaysPhysHlthBad, data = df, family = binomial()) # summary(mentalWeed)
mentalHard <- glm(HardDrugs ~ DaysMentHlthBad + DaysPhysHlthBad, data = df, family = binomial()) # summary(mentalHard)

par(mfrow = c(2, 2))
plot(mentalSmoke)


