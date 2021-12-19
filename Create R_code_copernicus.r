# R code for uploading and visualizing Copernicus data in R

 # install.packages("ncdf4")
 library(ncdf4)
 library(raster)

 # Set the working directory 
 setwd("/Users/account2/Desktop/lab/copernicus/")
# copy paste the compelite name of the dowloaded file and create a function with raster

 snow20211214 <- raster("c_gls_SCE_202112150000_NHEMI_VIIRS_V1.0.1.nc")
 # name of the file : Snow.Cover.Extent 

 plot(snow20211214)
 
 # 15 dec #
 
# changing colors of our image (snow20211214)
cl<- colorRampPalette(c("darkblue", "blue", "red"))(100)
plot(snow20211214, col=cl)
####
# the fill is the name of the plot "name"-> inside the object ,function for using "viridis" packages for colorblind people is "scale_fill_viridis"
#ggplot function 

ggplot()+
geoom_raster(snow20211214, mapping= aes(x=x, y=y, fill= Snow.Cover.Extent)) 

#ggplot() with viridis
ggplot()+
geom_raster(snow20211214, mapping= aes(x=x, y=y, fill= Snow.Cover.Extent)) 

# viridis colors


#####
library(raster)
library(RStoolbox)
library(ggplot2)
library(viridis)
library(ncdf4)

### list the file and apply the raster function to the lista an we will make a stack

rlist <- list.files(pattern="SCE")
rlist

rlist_rast<- lapply(rlist, raster)

# lets make a stack -> will call it snowstack
snowstack <- stack(rlist_rast)
snowstack

# lets give a name to our images linked to the stack (firstwinter= 15.12/ secondwinter=17.12)
firstwinter <- snowstack$Snow.Cover.Extent.1
secondwinter<- snowstack$Snow.Cover.Extent.2 

# in general there are hundred of images during the studies and it will be difficult to list all them together, so we will like to know which is what. To choos than which file we want to use in the studies

# ggplot
ggplot()+
geom_raster(firstsnow, mapping= aes(x=x, y=y, fill= Snow.Cover.Extent.1)) + scale_fill_viridis(option="viridis") + ggtitle("Snow Cover Winter 2021")

ggplot()+
geom_raster(secondwinter, mapping= aes(x=x, y=y, fill= Snow.Cover.Extent.2)) + scale_fill_viridis(option="viridis") + ggtitle("Snow Cover Winter 2021")
### lets patchwork them together! ###
# first launch the library(patchwork)
library(patchwork)
p1 <- ggplot()+
geom_raster(firstwinter, mapping= aes(x=x, y=y, fill= Snow.Cover.Extent.1)) + scale_fill_viridis(option="viridis") + ggtitle("Snow Cover Winter 2021")

p2 <- ggplot()+
geom_raster(secondwinter, mapping= aes(x=x, y=y, fill= Snow.Cover.Extent.2)) + scale_fill_viridis(option="viridis") + ggtitle("Snow Cover Winter 2021")

# you can crop the image into a certain area
# longitude from 0° to 20°
# latitude from 40° to 50°
# lets use the crop function 

ext <- c(0, 20, 30, 50)
firstwinter_cropped <- (firstwinter,ext)
secondwinter_cropped <- (secondwinter, ext)

plot(firstwinter_cropped <- (firstwinter,ext))
