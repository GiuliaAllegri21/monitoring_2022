#### 22/12/21 ####
 # SDM
 ## R code for species distribution modelling, namely the distribution of individuals of a population in space

 install.packages("sdm")

 library(sdm)
 library(raster) #predictors --> all of those data which are able to recognize individual of a secific species in space. --> environmental variables
 library(rgdal) #species --> coordinate data -> vector data (array of coordinates)

 #Set the working directory 
 #setwd("/Users/Zuli/Desktop/lab/")

 # Now use the system file function in R that showing all the files in a certain packages
 #https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/system.file

# species data 
 file <- system.file("external/species.shp", package="sdm")  # "external" is a folder in which all data are presents (in the package: sdm)
 file #path in which you have the data

# how many occurrences are here?
plot(species[species$Occurrence == 1,]
plot(species[species$Occurrence == 0,]
     presences <- species[species$Occurrence == 1,]
     absences <- species[species$Occurrence == 0,]
# plot! plot the dataset "species" choosing the pch (presences or absences)
 plot(species, pch=19)
 plot(presences, pch=19, col="blue")    
 plot(absences, pch=19, col="red")
     
# we want to add the new plot to the old one --> presences + absences
# function called "Points" in r package
    plot(presences, pch=19, col="blue")
    points(absences, pch=19, col="red")
# we want to plot the "probability" od species distribution. --> "species distribution model"     
# predictors: look at the path (is exactly the same for "file" before, but we want only the pah of external 
# let's look at the "predictors"
path <- system.file("external", package="sdm") 
path
# result = [1] "/Library/Frameworks/R.framework/Versions/4.1/Resources/library/sdm/external"     
# ASCII extension --> code for interchange of informations
# list the predictors
lst <- list.files(path=path,pattern='asc',full.names = T) #
lst

# you can use the lapply function with the raster function 
lapply(lst, raster)
     
# let's stack the function
preds <- stack(lst)
preds

# Show:  elevation, precipitation, temperature, vegetation 

# plotting the PREDICTORS with yellow (it marks the changes in the data a lot) 
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

# presences of species with every variable 

# 1. Elevation
plot(preds$elevation, col=cl)
points(presences, pch=19)

# 2. Temperature
plot(preds$temperature, col=cl)
points(presences, pch=19)     

# 3. Precipitation     
plot(preds$precipitation, col=cl)
points(presences, pch=19)   

# 4. Vegetation     
plot(preds$vegetation, col=cl)
points(presences, pch=19)      
     
# let's do the MODEL
# model
# set the data for the sdm (species distribution model)
     
     
 # Let's plot the species data
 # re-creating a shape file in R with the shape file function 
 # https://www.rdocumentation.org/packages/raster/versions/3.5-9/topics/shapefile that read or write a shapefile
 # shapefile = points in space --> coordinates for the species so the presence of absence of species 

 species <- shapefile(file) #exactly as the raster function for raster files

 # plot species

 plot(species, pch=19, col="red")
 #19= is wqual to the "dot" in the plotting suitable shapes
 # pch argument in r
 # points scattered in space


