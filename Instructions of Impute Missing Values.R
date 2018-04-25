#The choice of method to impute the misssing values largely influences the model's predictive ability
#Though deletion is the default method, but it also leads to information loss
#Reference:https://www.analyticsvidhya.com/blog/2016/03/tutorial-powerful-packages-imputing-missing-values/

#1. Mice package
#Mice assumes that the missing values are missing at random
#It uses other variables to predict the missing value
#If the missing values is numeric, regression is uesd; If categorical, logistic is used

library(mice)
library(missForest)
View(iris)
#Generate 10% of missing value by random
iris.mis=prodNA(iris,noNA = 0.1)
summary(iris.mis)

#Here we focus on numeric variables
iris.mis=iris.mis[,-5]
#Use md.pattern to gain more inforamation on missing values
md.pattern(iris.mis)

#Impute missing values
imputed_Data=mice(iris.mis,m=5,maxit=50,method="pmm",seed=500)
#Use ?mice to gain more information about the paremeters
summary(imputed_Data)

#Check imputed values
imputed_Data$imp$Sepal.Width

#Since there are 5 imputed data sets, we can select any using complete() function
#E.g. Get complete data ( 2nd out of 5)
completeData=complete(imputed_Data,2)
#The above data is one of the data sets which has imputed the missing values


#2. Amelia package
#Amelia has two assumptions: 
#All datas in a data set have Multivariate Normal Distribution
#Missing values are missing at random
#Amelia con only work on numerical datas

library(Amelia)
#Generate 10% of missing value by random
iris.mis=prodNA(iris,noNA = 0.1)
summary(iris.mis)

#specify columns and run amelia
amelia_fit <- amelia(iris.mis, m=5, parallel = "multicore", noms = "Species")
#noms: keep nominal variables here

#access imputed outputs
amelia_fit$imputations[[1]]
amelia_fit$imputations[[2]]
amelia_fit$imputations[[3]]
amelia_fit$imputations[[4]]
amelia_fit$imputations[[5]]

#To check a particular column in a data set, use the following commands
amelia_fit$imputations[[5]]$Sepal.Length


#3. missForest package
#it builds a random forest model for each variable
#Then it uses the model to predict missing values in the variable with the help of observed values

library(missForest)

#Generate 10% of missing value by random
iris.mis=prodNA(iris,noNA = 0.1)
summary(iris.mis)

#Impute missing values, using all parameters as default values
iris.imp <- missForest(iris.mis)

#check imputed values
iris.imp$ximp

#check imputation error
iris.imp$OOBerror

#NRMSE is normalized mean squared error. It is used to represent error derived from imputing continuous values. 
#PFC (proportion of falsely classified) is used to represent error derived from imputing categorical values.

#comparing actual data accuracy
iris.err <- mixError(iris.imp$ximp, iris.mis, iris)
iris.err
#This suggests that categorical variables are imputed with 6% error and continuous variables are imputed with 15% error. 
#This can be improved by tuning the values of mtry and ntree parameter. 
#mtry refers to the number of variables being randomly sampled at each split. 
#ntree refers to number of trees to grow in the forest.


#4. Hmisc package
#It assumes linearity in the variables being predicted
#Fisher’s optimum scoring method is used for predicting categorical variables

library(Hmisc)
#Generate 10% of missing value by random
iris.mis=prodNA(iris,noNA = 0.1)
summary(iris.mis)

# impute with mean value
iris.mis$imputed_age <- with(iris.mis, impute(Sepal.Length, mean))

# impute with random value
iris.mis$imputed_age2 <- with(iris.mis, impute(Sepal.Length, 'random'))


#using argImpute
#argImpute() automatically identifies the variable type and treats them accordingly.
impute_arg <- aregImpute(~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width +
                             Species, data = iris.mis, n.impute = 5)
impute_arg
#The output shows R² values for predicted missing values. Higher the value, better are the values predicted


#5. mi package
#Below are some unique characteristics of this package:
#It allows graphical diagnostics of imputation models and convergence of imputation process.
#It uses bayesian version of regression models to handle issue of separation.
#Imputation model specification is similar to regression output in R
#It automatically detects irregularities in data such as high collinearity among variables.
#Also, it adds noise to imputation process to solve the problem of additive constraints.

library(mi)
#Generate 10% of missing value by random
iris.mis=prodNA(iris,noNA = 0.1)
summary(iris.mis)
#imputing missing value with mi
mi_data <- mi(iris.mis, seed = 335)
summary(mi_data)




