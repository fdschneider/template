## template function
## for now just returning an object of class "template". 

# I had a different way in mind to include the journal styles. If we keep that function rather neutral,
# it would be possible to call it later with a particular function par.template(). 

template <- function(..., author = NULL, journal = NULL, date = NULL) {
  
  	out <- list()
  	## I propose we stock all the par argments, the object will then be readily settable !
  	out$par <- par(no.readonly=T)[] 
  	args <- list(...)
  	## arguments we change
  	ext <- charmatch(names(args), names(out$par))
	out$par[ext] <- args
  
  	if(!is.null(author)) out$author <- author
  	if(!is.null(journal)) out$journal <- journal
  	if(!is.null(date)) {out$date <- as.POSIXct(date)} else { out$date <- as.POSIXlt(Sys.time(), "") }
  
  	class(out) <- c("template")
  	return(out)
}

# collection of templates 
collection.template <- function(){
	
	science <- template(
  		family = "sans", 
  		tck = 0.02,
  		bty = "n",
  		journal = "Science", 
  		author = "Florian Schneider"
  	)
  	
  	nature <- template(
  		family = "sans", 
  		tck = 0.018,
  		bty = "o",
  		journal = "Nature", 
  		author = "Kévin Cazellesr"
  	)
  	
	return(list(science, nature))
	
}

# convertor 
as.template <- function(...){
  
}

# getter functions
gjournal <- function(x) {return(x$journal)}
gauthor <- function(x) {return(x$authors)}


#
par.template <- function(x, journal = NULL, verbose=TRUE) {

	# We must find a way to easily stock templates
	if (!is.null(journal)){
		Template <- collection.template()
 		journals <- unlist(lapply(Template, gjournal))
		w <- charmatch(journal,journals)
		if (is.na(w)) stop(" --> The journal style that you specified does not exist.")
		journal <- Template[[w]]
		print(journal)
	}

 	x.names <- names(x$par)
 	j.names <- names(journal$par)
 	m.names <- sort(unique(c(x.names, j.names)))
  
  	parms <- sapply(m.names, function(i) {
   		 if (i %in% j.names) journal$par[[i]]
    	else x$par[[i]]
  	}, simplify = FALSE)
  
    if (verbose==TRUE){
		#cat(paste(" --> Journal's template selected:", journals[w],"\n"))
		cat(" --> Plot is ready")	
	}
  
  	par(parms)

}


# application
example.template <- function(){
	# random scatter plot
	x <- runif(30, 0.2, 0.9)
	y <- 0.5 + x*3.1 + rnorm(30, 0, 0.2)
	plot(y ~ x)
	
	# Unsing template nature and extra arguments
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

	par.template(own, journal = "Science")
	plot(y ~ x)

}

