template
========

**A templating scheme for R**


This is supposed to develop into an R package. But for now it is just a collection of code and ideas. 


## Structure

The function `template()` is designed to create a list of parameters that will be used to overwrite the default settings in R. The returned objects have the class `template`. 

The call `par(template)` will replace the default settings with the parameters stored in the `template` object for this session of R. The call also takes an argument `journal` which is a template object that is treated with higher priority and overwrites all set parameters. A database of journal objects will be distributed with the package.  

a call of `par(default)` will restore all initial settings of R. There are some discussion threats on the internet about that [1](https://stackoverflow.com/questions/5789982/reset-par-to-the-default-values-at-startup), [2](http://r.789695.n4.nabble.com/any-way-to-set-defaults-for-par-td859108.html)

All high-level and low-level plotting functions should therefore adopt the parameters that were set. 

Additional low-level functions might be provided as well, such as a `label()` function that allows adding text including TeX equations. 


## Aims 

The **lattice** package and the **ggplot2** package both seem to provide *themes*, standardised styles for the graphics. However Lattice is made for complex layout arrangements of multivariate, stacked data plots. ggplot2 follows this tradition. The packages both provide help for arranging data and plotting them in a visually attractive and comprehensible way. 
Similar is true for the package [**grid**](https://www.stat.auckland.ac.nz/~paul/grid/grid.html), which seems to be basic but provides some quite powerful functions for arrangement and modification of plots.

To complement those established packages, our package should be really minimalistic and only support the default plotting functions. We do not meddle with the scatterplot or barplot. We just teach them how to have a consistent look and feel. 


## How plotting works in R



## References

The package needs to make changes in the following places to reach all plotting devices:

### `par()` 
The problem I encountered is that the par is reset to default each time a new window/plotting device is called. How to change the default? 

### `pdf.options()` & `ps.options()`

### `windows.options()`

### `pretty()`


## Links


[Rgraphics.pdf](http://faculty.ucr.edu/~tgirke/HTML_Presentations/Manuals/Rgraphics/Rgraphics.pdf) by Thomas Girke

[grid](https://www.stat.auckland.ac.nz/~paul/grid/grid.html) by Paul Murell



