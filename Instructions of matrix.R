#Matrix
a=matrix(c(1:6),nrow=3,ncol=2)
a
b=matrix(c(4:9),nrow=2,ncol=3)
b

#We use %*% for matrix multiply
c=a%*%b
c
#We use t() for matrix transpose
t(a)

#We use diag() to return the diagnols of a matrix
diag(c)

#We use det() to return the determinants of a matrix
d=matrix(c(1,0,3,2,1,5,3,3,7),nrow=3,ncol=3)
det(d)

#We use solve() to return the inverse matrix of a matrix
solve(d)

#We use eigen() to return the eigenvalues and eigenvectors of matrix
eigen(d)


