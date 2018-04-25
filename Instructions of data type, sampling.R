#Note

#1.Data type 
array(c('black',"white"),dim=c(3,2,2))
#array can be more than one dimension

data.frame(gender=c("female","male","female"),
           height=c(180,170,165),
           weight=c(60,55,70))

matrix(c(0,1,0,180,170,165,60,55,75),nrow=3,ncol=3,byrow=F)
#The difference between matrix and data.frame is that the data in data.frame can be different classes,
#but data in matrix can only be the same class

list(gender=c("female","male","female"),
     height=c(180,170,165),
     weight=c(60,55,70))



#2.How to split a data into training and testing data?
#We would like to take 70~80% from the original data as training data, and the less as testing data
Original_data= data.frame(gender=c(0,1,0,1,0,0,0,1,1,1),
                          height=c(seq(165,185,length.out = 10)),
                          weight=c(seq(55,80,length.out = 10)))
n = nrow(Original_data) 
#抽樣選出index 
t_idx = sample(seq_len(n), size = round(0.8 * n), replace = F) 
#訓練組樣本 
traindata = Original_data[t_idx,] 
#測試組樣本 
testdata = Original_data[ - t_idx,] 




