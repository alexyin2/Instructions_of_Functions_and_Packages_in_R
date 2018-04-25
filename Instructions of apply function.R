library(dplyr)
#1. apply()

#apply() Returns a vector or list of values obtained by applying a function to margins of an array or matrix
#Arrays are the R data objects which can store data in more than two dimensions. 
#For example: If we create an array of dimension (2, 3, 4) then it creates 4 rectangular matrices each with 2 rows and 3 columns. 
#Arrays can store only data type

#E.g.
x=matrix(1:12,ncol=3,byrow=F)
x
apply(x,MARGIN = 1,FUN=sum)
#MARGIN=1 means that the function sum is applied to x row by row
apply(x,MARGIN = 2,FUN=sum)
#MARGIN=1 means that the function sum is applied to x column by column

#E.g.
x=data.frame(x1=3,x2=c(4:1,2:5))
x
#We would like to add 1 to the first column and calculate the mean for each row
myFun=function(x,c1,c2){
  c(sum(x[c1],1),mean(x[c2]))
}
apply(x,MARGIN=1,FUN=myFun,c1="x1",c2=c("x1","x2")) %>% t

#2. sapply()

#The difference between apply() and sapply() is that apply() returns a list, and sapply() returns a vector or a matrix,
#and in sapply(), the function calculates on the columns of x 
data("airquality")
sapply(airquality, function(df){sum(is.na(df)==TRUE)/length(df) })



