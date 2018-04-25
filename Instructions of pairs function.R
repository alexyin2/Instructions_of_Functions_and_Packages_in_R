#In some cases we would like to see the scatter plot between variables
#For example, before doing multiple regression, we may want to see that if there are collinearity between variables
#pairs is a fuction that produce a matrix of scatterplots
pairs(mtcars[,c(1:4)])
