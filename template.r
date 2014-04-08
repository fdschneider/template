# random scatter plot

x <- runif(30, 0.2, 0.9 )
y <- 0.5 + x*3.1 + rnorm(30, 0, 0.2)

plot(y ~ x)


## template function
## for now just returning an object of class "template". 

template <- function(journal="nature", bty="o", verbose=TRUE) {
	
	# Match with a vector of journal 
 	journals <- c("nature", "science", "ecologyletters")
	w <- charmatch(journal,journals)
	if (is.na(w)) stop("No match for journal found")
	
	# Then we create our object whode class is "template"
	if (w==1){
		out <- par(xaxs="i", yaxs="i", bty=bty, bg=2)
	}
	
	if (w==2){
		out <- par(xaxs="i", yaxs="i", bty=bty)
	}
	
	if (w==3){
		out <- par(xaxs="i", yaxs="i", bty=bty)
	}
 	#out <- list(...)
  	class(out) <- "template"
	
	
	if (verbose==TRUE){
		cat(paste(" --> Journal's template selected:", journals[w],"\n"))
		cat(" --> Plot is ready")	
	}
	
	return(out)
	
}


# convertor 

as.template <- function(...){
	
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
