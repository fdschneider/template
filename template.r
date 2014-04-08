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

# I had a different way in mind to include the journal styles. If we keep that function rather neutral,
# it would be possible to call it later with a particular function par.template(). 

template <- function(..., author = NULL, journal = NULL, date = NULL) {
  
  out <- list()
  out$par <- list(...)
  if(!is.null(author)) out$author <- author
  if(!is.null(journal)) out$journal <- journal
  if(!is.null(date)) {out$date <- as.POSIXct(date)} else { out$date <- as.POSIXlt(Sys.time(), "") }
  
  class(out) <- c("template")

  return(out)
}

par.template <- function(x, journal = NULL) {
  x.names <- names(x$par)
  j.names <- names(journal$par)
  m.names <- sort(unique(c(x.names, j.names)))
  
  parms <- sapply(m.names, function(i) {
    if (i %in% j.names) journal$par[[i]]
    else x$par[[i]]
  }, simplify = FALSE)
  
  par(parms)
}

# application

science <- template(
  family = "sans", 
  tck = 0.02,
  journal = "Science", 
  author = "Florian Schneider"
  )

own <- template(
  pch = 20, 
  las = 1, 
  bty = "l",
  tck = -0.02,
  family = "serif",
  cex.lab = 2,
  mar = c(5,5,2,2)+0.1,
  author = "Flo Schneider"
)
  

par.template(own)

plot(y ~ x)

par.template(own, journal = science)

plot(y ~ x)
