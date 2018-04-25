x <- seq(0, 5, length=100)
hx <- dexp(x,1)

rate <- c(0.5, 1, 1.5, 2)
colors <- c("black","red","green","blue")
labels <- c("0.5","1","1.5","2")
labletype=c(1,2,2,2)
plot(x, hx, type="l",lty=2,xlab="x",
     ylab="p(X)", main=c("Exponential Distribution",
     "Probablity Density Fuction","rate=c(0.5, 1.0, 1.5, 2.0)"),ylim = c(0,2))

for (i in 1:4){
  lines(x, dexp(x,rate[i]), type = "l",lty=labletype[i], col=colors[i])
}

legend("center", cex=1.1,title="Rate",
       labels, lwd=2, lty=c(1,2,2,2), col=colors)