#by is a function that applys a function to each level of a factor or factors
#Here we use data warpbreaks as an example

View(warpbreaks)
by(warpbreaks[,1],warpbreaks[,"tension"],summary)
#We can see that it seperates the data by the variable in tension

#It's a little same like the function aggregate as we can see below
aggregate(warpbreaks[,1],by=list(warpbreaks$tension),summary)

#one of the difference is that aggregate function output is a dataframe
