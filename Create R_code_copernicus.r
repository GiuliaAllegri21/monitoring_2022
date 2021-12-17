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
geoom_raster(snow20211214, mapping= aes(x=x, y=y, fill= Snow.Cover.Extent)) 
