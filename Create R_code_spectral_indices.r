# Calculating vegetation indices from remote sensing

library(raster)
library(RStoolbox) # for classification

setwd("~/lab/") # Linux

l1992 <- brick("defor1.png")

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
