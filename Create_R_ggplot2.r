FRIDAY 21.10.2022

# using ggplot2 with library 
# virus - covid19

# creating a folder in which we save our datasets, in a short path, from outside R 

setwd("/Users/Zuli/Desktop/lab22")

# now we want to importa our dat ain folder inside R 

read.table(covid_agg.csv, header= TRUE, sep = "", quote= "/")

# we can rename the file more simply "covid" with the function covid <- read.table("covid_agg.csv")
# header= TRUE,  because we have title for our dataframes 
# head(covid) for seing just few raws and column of our data 

summary(covid) --> information about our data in a statistical term 

# now we plot our data!

ggplot(covid, aes(x= lon, y=lat)) + geom_point(col="red")
ggplot(covid, aes(x= lon, y=lat, size= cases)) + geom_point(col="red")

#ERRORE
Errore in FUN(X[[i]], ...) : oggetto 'lon' non trovato
