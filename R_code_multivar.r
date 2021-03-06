@@ -0,0 +1,36 @@
 ### 22/12/21 ####

 # R code for measuring community interactions
 # install.packages("vegan")
 install.packages("vegan")
 setwd("/Users/Zuli/Desktop/lab/")
 library(vegan)

 # load function can load R objects saved in the current or any earlier format
 load("biomes_multivar.RData")
 # ls function is the list of objects
 # it shows all the temporary data in R 
 ls()
 biomes
 biomes_types

 # detrended correspondance analysis (decorana function)
 # decorana is the funcion with the dataset called biomes

 multivar <- decorana(biomes)
 multivar

 # we are going to make a plot
 plot(multivar)
 # we chose the first two axes in the plot as it shows the most variants

 # now plotting the biomes types with ordiellipse function 
 # are the species in the same biomes? let's take a look!
 # the ellipse will include the plots in a single biome
 # we are using also the "attach function" to attach the biomes types to the ellipse function 

 attach(biomes_types)
 ordiellipse(multivar, type, col=c("black","red","green","blue"), kind="ehull", lwd=3)

 # ordispider function 
 ordispider(multivar, type, col=c("black","red","green","blue"), label=T)
