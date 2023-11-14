getwd()
setwd('C:/Users/318si/OneDrive/바탕 화면/기상청공모전/데이터/지면온도')

# install.packages('mice')
library(mice)

# install.packages('rms')
library(rms)

# install.packages('finalfit)
library(finalfit)
library(dplyr)

df_train <- read.csv("surface_tp_train.csv")
df_test <- read.csv("surface_tp_test.csv")
df_train %>% head()
df_train %>% str()
df_train %>% dim() # 438240     15
# -99, -99.9, -999를 NA로 대체
df_train1 <- df_train %>%
  mutate(across(everything(), ~ifelse(. %in% c(-99, -99.9, -999), NA, .)))

# Description of data
df_train1 %>% describe()
df_train1 %>% is.na %>% apply(2, sum)


df_train2 <- df_train1 %>%
  select(-X,-surface_tp_train.si, -surface_tp_train.ss, -surface_tp_train.sn)

# check missing pattern
md.pattern(df_train2)
md.pairs(df_train2)
missing.clus = naclus(df_train2,method='average')
missing.clus
plot(missing.clus)


fit = glm(is.na(surface_tp_train.ts) ~ ., data=df_train2, family=binomial )
summary(fit)
