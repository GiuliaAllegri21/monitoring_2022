# Calculating vegetation indices from remote sensing

library(raster)
library(RStoolbox) # for classification

setwd("/Users/Zauli/Desktop/lab22/") # Mac

l2006 <- brick("defor1.png")

# bands: 1 NIR, 2 red, 3 green

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- brick("defor2.png")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

dvi1992 <- l1992[[1]] - l1992[[2]]

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

dvi2006 <- l2006[[1]] - l2006[[2]]

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2006, col=cl)

# threshold for trees

d1c <- unsuperClass(l1992, nClasses=2)
plot(d1c$map)

# 1992
# class 1: forest - 0.8976859
# class 2: human impact - 0.1023141

freq(d1c$map)
 value  count
[1,]     1 306373
[2,]     2  34919

#forest
f1992 <- 306373 / (306373+34919)
#human impact
h1992 <- 34919 / (306373+34919)

# classificaton of 2006
d2c <- unsuperClass(l2006, nClasses=2)
plot(d2c$map)

# 2006
# class 2: forest - 0.5199343
# class 1: human impact - 0.4800657

freq(d2c$map)
# value  count
# [1,]     1 164531
# [2,]     2 178195

# forest proprotion in 2006
f2006 <- 178195 / (164531+178195)
h2006 <- 164531 / (164531+178195)

#install package "patchwork"
install.packages("patchwork")


# NIR 1, RED 2, GREEN 3

defor1 <- brick("defor1.png")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
p1 + p2

# unsupervised classification
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
# class 1: forest
# class 2: agriculture

# set.seed() would allow you to attain the same results ...

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
# class 1: agriculture
# class 2: forest

d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

# frequencies
freq(d1c$map)
#   value  count
# [1,]     1 306583
# [2,]     2  34709

s1 <- 306583 + 34709

prop1 <- freq(d1c$map) / s1
# prop forest: 0.8983012
# prop agriculture: 0.1016988

s2 <- 342726
prop2 <- freq(d2c$map) / s2
# prop forest: 0.5206958
# prop agriculture: 0.4793042

# build a dataframe
cover <- c("Forest","Agriculture")
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)

percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

# let's plot them! Histogram
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)


# 25.11 ggplot2

ggplot()+
geom_raster(dvi1992, mapping=aes(x=x,y=y, fill=layer))
# everyone can see these colors --> viridis package for colorblind people


# 2. ggplot for single layers
ggplot()+
geom_raster(dvi1992, mapping=aes(x=x,y=y, fill=layer))+
scale_fill_viridis(option="viridis")

# magma another palette for colorblind people 

ggplot()+
geom_raster(dvi1992, mapping=aes(x=x,y=y, fill=layer))+
scale_fill_viridis(option="magma")

# exercise: with the patchwork package
# put 2 different graphs one beside the other
# with 2 different viridis color ramps 

par(mfrow=c(2,2))
p1<- ggplot()+
geom_raster(dvi1992, mapping=aes(x=x,y=y, fill=layer))+
scale_fill_viridis(option="cividis")
p2<- ggplot()+
geom_raster(dvi2006, mapping=aes(x=x,y=y, fill=layer))+
scale_fill_viridis(option="magma")
p1+p2

# for inserting a TITLE  use= "ggtitle"
par(mfrow=c(2,2))
p1<- ggplot()+
geom_raster(dvi1992, mapping=aes(x=x,y=y, fill=layer))+
scale_fill_viridis(option="cividis")+
ggtitle("Multispectral cividis")

p2<- ggplot()+
geom_raster(dvi2006, mapping=aes(x=x,y=y, fill=layer))+
scale_fill_viridis(option="magma")+
ggtitle("Multispectral magma")
p1+p2
