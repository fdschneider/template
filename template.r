# random scatter plot

x <- runif(30, 0.2, 0.9 )
y <- 0.5 + x*3.1 + rnorm(30, 0, 0.2)

plot(y ~ x)



# template function
## for now just returning an object of class "template". 

template <- function(... ) {
 out <- list(...)
  class(out) <- "template"
 return(out)
}



# application

own <- template(  pch = 20, 
           las = 1, 
           bty = "l",
           family = "serif",
           cex.lab = 2,
           mar = c(5,5,2,2)+0.1
           )
  

par(own)


plot(y ~ x)
