library(maps)
library(ggplot2)
View(map_data("world"))
table(map_data("world")$region)

mycountry=c("France","Austria","Italy","Switzerland","Germany","Spain","Czech Republic")
map1=map_data("world",region=mycountry)

p=ggplot(map1,aes(x=long,y=lat,group=group,fill=region))+
  geom_polygon(colour="black")+
  scale_fill_brewer(palette="Set2")

#Point out capital cities in the map
data("world.cities")
mycity <- subset(world.cities, (world.cities$capital == 1 | world.cities$pop > 1000000) & world.cities$country.etc %in% mycountry)
mycity$region <- mycity$country.etc
mycity$group <- 1

p+geom_point(aes(x = long, y = lat, size = pop), data = mycity, alpha = .7) 

p+geom_point(aes(x = long, y = lat, size = pop), data = mycity, alpha = .7)+
  geom_text(aes(x = long, y = lat - 0.5, label = name), data = mycity, colour = "black", fontface = "bold")
