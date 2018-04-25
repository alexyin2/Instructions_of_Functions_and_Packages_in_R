#Here we use iris data as an example
View(iris)

#One way anova
#H0: μ(Setosa)=μ(Versicolor)=μ(Virginica)
#H1: at least one μ is different than the others 
a.lm=lm(Petal.Width~Species,data=iris)
anova(a.lm)

