library(ggplot2)
#First try
BabyGrowth=data.frame(month=c(1:7),
                      height=c(57,61,67,71,74,76,79))
ggplot(BabyGrowth,aes(month,height))
ggplot(BabyGrowth,aes(month,height))+geom_line()
ggplot(BabyGrowth,aes(month,height))+geom_line()+geom_point()
ggplot(BabyGrowth,aes(month,height))+geom_line()+geom_point()+ylim(50,max(BabyGrowth$height))
ggplot(BabyGrowth,aes(month,height))+geom_line()+
  geom_point(size=6,shape=22,colour="darkred",fill="pink")+
  ylim(50,max(BabyGrowth$height))

#Second try
str(ToothGrowth)
View(ToothGrowth)
TG=aggregate(ToothGrowth[1],by=list(ToothGrowth$supp,ToothGrowth$dose),FUN=mean)
TG
TG=TG[order(TG[,1]),]
colnames(TG)[c(1,2)]=c("supp","dose")
ggplot(TG,aes(x=dose,y=len,colour=supp))+geom_line()+geom_point()
ggplot(TG,aes(x=dose,y=len,colour=supp))+
  geom_line(linetype="dashed",size=3)+
  geom_point(shape=22,size=3,fill="white")

#Third try
AoeStatistics <- data.frame( 
  Ethnic = c("France", "Huns", "Turkey", "China", "France", "Huns", "Turkey", "China", "France", "Huns", "Turkey", "China", "France", "Huns", "Turkey", "China"), 
  Score = c(25, 25, 25, 25, 30, 20, 20, 30, 40, 10, 40, 10, 30, 0, 20, 50), 
  Era = c(-3000, -3000, -3000, -3000, -1000, -1000, -1000, -1000, 0, 0, 0, 0, 500, 500, 500, 500)) 

ggplot(AoeStatistics, aes(x = Era, y = Score, fill = Ethnic)) + 
  geom_area(colour = "black", size = .2, alpha = .4) + 
  scale_fill_brewer(palette = "Blues", breaks = rev(levels(AoeStatistics$Ethnic))) 

#Forth try: Distribution
df<- data.frame(x = seq(1:100) , y = rnorm(100)*10) 
df$pos <- df$y >= 0 
ggplot(df, aes(x = x, y = y, fill = pos)) + 
  geom_bar(stat = "identity", position = "identity") 

#Fifth try: Boxplot
ggplot(ToothGrowth, aes(x = supp, y = len)) + geom_boxplot(width = .5) 

#adding mean dot
ggplot(ToothGrowth, aes(x = supp, y = len)) + geom_boxplot(width = .5, notch = TRUE) + 
  stat_summary(fun.y = "mean", geom = "point", shape = 23, size = 3, fill = "blue") 

#X add (DotPlot) 
ggplot(ToothGrowth, aes(x = supp, y = len)) + geom_boxplot(width = .5) + 
  geom_dotplot(binaxis = "y", binwidth = .5, stackdir = "center") 

#Text Annotations
ggplot(ToothGrowth, aes(x = supp, y = len)) + geom_boxplot(width = .5) + 
  geom_dotplot(binaxis = "y", binwidth = .5, stackdir = "center") + 
  annotate("text", x = 1, y = 36, label = "Drinking lemonade") + 
  annotate("text", x = 2, y = 36, label = "Eating vitamin C") 

#boxplot adding color (default color)  
ggplot(ToothGrowth, aes(x = supp, y = len, fill = supp)) + geom_boxplot(width = .5) + 
  geom_dotplot(binaxis = "y", binwidth = .5, stackdir = "center") +  
  annotate("text", x = 1, y = 36, label = "Drinking lemonade") + 
  annotate("text", x = 2, y = 36, label = "Eating vitamin C") 

#Sixth try: Scatter plot
View(diamonds)
ggplot(diamonds,aes(x=carat,y=price))+geom_point()

#Density plot
ggplot(diamonds)+geom_density(aes(x=carat))
ggplot(diamonds)+geom_density(aes(x=carat),fill="darkred")

#3 variables in Scatter plot: carat, price, and clarity
ggplot(diamonds,aes(x=carat,y=price))+geom_point(aes(colour=clarity))

#4 variables in Scatter plot: carat, price, color, and cut
ggplot(diamonds,aes(x=carat,y=price))+geom_point(aes(colour=color),size=0.5)+facet_grid(cut~color) 

#4 variables in Scatter plot: Sepal.Length, Petal.Length, Petal,Width, and Species
View(iris)
ggplot(iris,aes(x=Sepal.Length,y=Petal.Length))+geom_point(aes(colour=Species,size=Petal.Width))

#Scatter plot combining with density
ggplot(iris,aes(x=Petal.Length,y=Petal.Width))+geom_point(aes(colour=Species),size=0.5)+stat_density2d(aes(colour=Species)) 

