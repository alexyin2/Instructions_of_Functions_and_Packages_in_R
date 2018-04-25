#"aggregate" is a quite useful function when doing data cleaning
#It helps to look more detail on the data by grouping some variables
View(mtcars)
attach(mtcars)
aggregate(mtcars,list(cyl,gear),FUN = mean)
