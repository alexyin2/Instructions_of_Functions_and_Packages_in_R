#Instructions of merge function
id1 <- c(2, 3, 4, 5, 7)
heights <- c(62, 65, 71, 71, 67)
df1 <- data.frame(id = id1, heights)

id2 <- c(1, 2, 6:10)
weights <- c(147, 113, 168, 135, 142, 159, 160)
df2 <- data.frame(id = id2, weights)

df1;df2
merge(df1,df2,all=T)
merge(df1,df2,all=F)
merge(df1,df2,by='id')

merge(df1,df2,by='id',all.x=T)
#all.x代表將x也就是df1中全部的資料輸入
merge(df1,df2,by='id',all.y=T)

df1$sex <- c("f", "m", "f", "f", "m")
df2$sex <- c("f", "m", "m", "m", "f", "f", "f")
merge(df1,df2)
merge(df1, df2, by = c("id", "sex"))
merge(df1, df2, by = 'id')
#如果用by='id',代表將兩筆資料'id'中一樣的資料進行合併，但他們在其他變數間的數值可能不一樣，所以sex.x代表在x也就是df1中的sex值
#如果只用merge(df1,df2)，R會去找兩筆資料共同有的變數名稱中完全一樣的row進行輸出。