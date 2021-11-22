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

# to recall our satellite file in R 
l2011<- brick("p224r63_2011.grd")

# B1 is the reflectance in the blue band 
# B2 is the reflectance in the green band 
# B3 is the reflectance in the red band 

# $ is used for linking our model to a specific data inside that data folder


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
# mfrow = multiframe raw

> plot(l2011$B1_sre, col=clb)
> plot(l2011$B2_sre, col=clg)
> # one raw and two column
> 
> par(mfrow=c(2,1))
> plot(l2011$B1_sre, col=clb)
> plot(l2011$B2_sre, col=clg)
> # two raws and one column 
> 
# for having the reverse colors in the image we juct can change the position of "col=clg and col=clb" 

# everytime we use raster we have to recall it in R system
# always open the users and lab folder in R 


# plot the first 4 bands with two raws and 2 columns
# we need 2 raws and 2 columns 
par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100)  
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100)  
plot(p224r63_2011$B3_sre, col=clr)
# searching the color's namein R with the help of Google "deeppink1" and so on is the right name for pink. 
clp <- colorRampPalette(c("deeppink1","deeppink2","deeppink3"))(100)
plot(p224r63_2011$B4_sre, col=clp)

# we want to see the band and raws as human see. With natural colors 
# first we have to clean the window with 
dev.off() # --> it closes the device

# first the satelite brick and the layers with infrared light. 
# recognizing which color is where in the folder data + using stretch= "Lin"-> Natural colors 
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") 

# lets move the infrared visual just shifting the numbers in the function -> FALSE colors

plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")

# lets chenge the channel of near infrared in the green band instead on the red -> super green color

plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")

# near infrared in the Blue component -> Yello Ground color-> where we have tdestroied the forest. No tree coverage 
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")

#lets make  multiframe of these coverage 
par(mfrow=c(2,2))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")

# these is called ... amalysis and we can see than with other data the changes in term of ground coverage, water, and ground presence.
# the next lesson we will observe the changing during these 30 years with the file p224r63_1988.gri


# seeing how a landscape changes through time.
# final day on this tropical forest reserve
# brick function for import the file

library(raster)
 setwd(/Users/Zuli/Desktop/lab/)
l2011 <- brick("p224r63_2011.grd")
l2011

# now we plot in red green blue color 
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
# now we create an histogramm function always with RGB function 
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")

# now we observe how the forest was in 1988 and we should see the differences.
# import past data 
l1988<- brick("p224r63_1988.grd")
l1988
# we recieve the brick function with all the values and data, 7 bands of landcsapes (30x30m) 
# 2 images in 1 row
par(mfrow=c(2,1))
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")

# put the NIR in the blue channel 
plotRGB(l1988, r=2, g=3, b=4, stretch="Lin")


# installing library(rgdal) and downloadig images from virtuale folder 
# always recall the library(raster)
library(rgdal)
#setwd("/Users/Zuli/Desktop/lab/") for opening the connectiond in the computer directory 
setwd("/Users/Zuli/Desktop/lab/")

# brick function of l1992 image 
l1992<-brick("defor1_.jpg")
l1992

# having the tbale with all the carachteristics of the images and the file
#names      : defor1_.1, defor1_.2, defor1_.3 
# plot the image of the colors of our .jpg images
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
# image will created and modify -> we have the near infrared in the near component. we should recognize which are the bands. 

# defor1_.1=NIR  (near infrared is the 1 jp)
# defor1_.2 = red
# defor1_.3= green
# putting the first band in green
plotRGB(l1992, r=2, g=1, b=3, stretch="Lin")

# first band in blue 
plotRGB(l1992, r=2, g=3, b=1, stretch="Lin") 
# so there is no beare soil, we can see also river 
# the river is not "black coloured" because there is some coverage given from soil or algae or plants. -> eutrophization in 1992

# in monday we will upload the image from 2006 and will calculate the NPP (Net primary production)

# recall the libraries
library(raster)
library(rgdal)
setwd("/Users/Zuli/Desktop/lab/")
l1992 <- brick("defor1_.jpg")
l1992
# we have again all the data

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

# import the image defor_2.jpg
l2006<- brick("defor2_.jpg")
l2006 # this used for calling in R our image previously saved in the lab folder 
# plotting the image with the color wavelenght which we are interested in. 

plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# let's plot together 2 images with para function of frow
par(mfrow=c(1,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

#lets plot the same but in a columnar view 
> par(mfrow=c(2,1))
> plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
> plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# now we have to calculate the energy amount of the landpatch

# we use the NIR - the reflactant of the plant 
# high reflectance in NIR and low in Red.--> if vegetation will be cut, low reflectance in NIR and higher in Red 
# in tropical forest we have high NIR and low Red (cuz there is a lot of vegetation)
# example NIR - RED = DVI (100-20=80)
dvi1992 <- NIR-RED 
# let's calculate energy in 1992 with the names of layers with $ symbol, which is been used to connect the data. 
# and than we change colors with the colorRampPalette function
# before plotting we have to close the previously functions and datasets 

dev.off
dvil1992 <- l1992$defor1_.1 - l1992$defor1_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvil1992, col=cl)

# calculate energy in 2006 without deleting the previous functions

dvil2006 <- l2006$defor2_.1 - l2006$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvil2006, col=cl)

# let's organise te calculation of the 2 years!

# we are going to make the differences between one time to the other 

dvidif <- dvil1992 - dvil2006 
# plot the results 
cld <- colorRampPalette(c('blue','yellow','white','red'))(100)
plot(dvidif, col=cld)

# final plot of energy loss of all images: original images, dvis, final dvi differences 
# we use the para function (paragone), with 3 rows and 2 columns

par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvil1992, col=cl)
plot(dvil2006, col=cl)
plot(dvidif, col=cld)

# let's make a pdf of it 
pdf("energy.pdf")
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvil1992, col=cl)
plot(dvil2006, col=cl)
plot(dvidif, col=cld)
dev.off

# other one with 1 row and 3 columns

pdf("dvi.pdf")
par(mfrow=c(1,3))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvil1992, col=cl)
plot(dvil2006, col=cl)
plot(dvidif, col=cld)
dev.off
