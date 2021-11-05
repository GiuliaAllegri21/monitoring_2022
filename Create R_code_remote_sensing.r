# R code for ecosystem monitoring by remote sensing
# First of all we need to install addictional packages 
# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/install.packages 
# https://cran.r-project.org/web/packages/raster/raster.pdf

install.packages("terra")

# we need to use quotes for things there are not in R
install.packages("raster")

# how to use library in r 
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/library
# with the function library we can use packages

library(raster)

setwd("/Users/Zuli/Desktop")
# we are going to importa data from satellite
# objects cannot be numbers

p224r63_2011 <- brick("p224r63_2011_masked.grd")

# We import our satellite in R and we build a plot
p224r63_2011
plot(p224r63_2011)


# B1 is the reflectance in the blue band 
# B2 is the reflectance in the green band 
# B3 is the reflectance in the red band 

# We can change the color palette
# https://www.rdocumentation.org/packages/dichromat/versions/1.1/topics/colorRampPalette
# black correspond to the lowelest value 
# ( black, grey,...) is an array so we write c before the parentesies, 100 means how many tones we use
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(l2011, col=cl) 

# We maching the bands in the RGB components 
# https://www.rdocumentation.org/packages/raster/versions/3.5-2/topics/plotRGB

plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
# the result is a natural color image 

# changing color for column and raws 
> cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
> plot(l2011, col=cl)

# cl + b or g represent the color of the graph
> 
# changing the color in green with "green", "dark green" "light green"
> clg <- colorRampPalette(c("dark green","green","light green"))(100)
> plot(l2011$B2_sre, col=clg)

> # do the same for blue band using "dark blue", "blue" and "light blue"
> 
> clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
> plot(l2011$B1_sre, col=clb)

> # two raws one column =  just one multiframe graph.
> 
> par(mfrow=c(1,2))
> plot(l2011$B1_sre, col=clb)
> plot(l2011$B2_sre, col=clg)
> # one raw and two column
> 
> par(mfrow=c(2,1))
> plot(l2011$B1_sre, col=clb)
> plot(l2011$B2_sre, col=clg)
> # two raws and one column 
> 
