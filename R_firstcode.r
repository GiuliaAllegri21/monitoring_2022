# this is my first code in github
# here are the inputs data 
# Costanza data on streams 
water <- c(100,200,300,400,500)

# here are the outputs 
# Marta data on fishes genomes 
fish <- c(10,50,60,100,200)

# plot the diversity of fishes (y), vs the amount of water (x)
plot(water,fish)
setwd("/Users/Zuli/Desktop/lab")
streams <- data.frame(water, fish)
streams
#Let's export our table! https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/write.table
write.table(streams,file="my_firsttable.txt")
#some collegues didi sent us a table, how to import it in R? 
read.table("my_firsttable.txt")
#let's assign it to an object inside R 
giuliatable <- read.table("my_firsttable.txt")

#the first statistics for lazy beautiful people
summary(giuliatable)

# Marta does not like water
# Marta wants to get info on fish
summary(giuliatable$fish)

#histogram
hist(giuliatable$fish)

# water histogram
hist(giuliatable$water)
