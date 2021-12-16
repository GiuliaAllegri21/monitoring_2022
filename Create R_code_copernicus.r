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
 
