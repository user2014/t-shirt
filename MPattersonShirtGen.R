# Script by Mark T Patterson
# May 17, 2014
# twitter: @M_T_Patterson

# General Notes:

# This script creates an image of the R logo 
# represented by n points, 
# where n is the current number of packages on CRAN


# note: this script requries the EBImage package
# available from bioconductor:
# http://bioconductor.wustl.edu/bioc/html/EBImage.html

# approximate run time: 2 mins

#### initialize ####

# clear workspace
rm(list = ls())


# load libraries
library(EBImage) 

# coordinate the version of the program:
set.seed(2014)

#### gather web data: reference image and CRAN package count ####

# load the R logo, save the rgb values:
img = readImage("http://www.thinkr.spatialfiltering.com/images/Rlogo.png")
img.2 = img[,,1:3]

cran.site = "http://cran.r-project.org/web/packages/"
lns = readLines(cran.site)
ref.line = grep(lns, pattern = "CRAN package repository features")
package.count = as.numeric(strsplit(lns[ref.line],split = "\\s")[[1]][7])


#### helper functions ####

# functions for color simplification:
num.to.let = function(x1){
  ref.dat = data.frame(num = 10:15, let = LETTERS[1:6])
  out = as.character(x1)
  if(x1 %in% 10:15){out = as.character(ref.dat$let[which(ref.dat$num == x1)])}
  return(out)
}

rgb.func = function(vec){
  #note: vec is a triple of color intensities
  r1 = floor(255*vec[1])
  g1 = floor(255*vec[2])
  b1 = floor(255*vec[3])
  
  x1 = r1 %/% 16
  x2 = r1 %% 16
  x3 = g1 %/% 16
  x4 = g1 %% 16
  x5 = b1 %/% 16
  x6 = b1 %% 16
  
  x1 = num.to.let(x1)
  x2 = num.to.let(x2)
  x3 = num.to.let(x3)
  x4 = num.to.let(x4)
  x5 = num.to.let(x5)
  x6 = num.to.let(x6)
  
  out = paste("#",x1,x2,x3,x4,x5,x6, sep = "")
  return(out)
  
}


im.func.1 = function(image, k.cols = 5, samp.val = 3000){
  # creating a dataframe:
  test.mat = matrix(image,ncol = 3)
  df = data.frame(test.mat)
  colnames(df) = c("r","g","b")
  df$y = rep(1:dim(image)[1],dim(image)[2])
  df$x = rep(1:dim(image)[2], each = dim(image)[1])
  
  samp.indx = sample(1:nrow(df),samp.val)
  work.sub = df[samp.indx,]
  
  # extracting colors:
  k2 = kmeans(work.sub[,1:3],k.cols)
  
  # adding centers back:
  fit.test = fitted(k2)
  
  work.sub$r.pred = fit.test[,1]
  work.sub$g.pred = fit.test[,2]
  work.sub$b.pred = fit.test[,3]
  
  return(work.sub)
  
}

add.cols = function(dat){
  apply(dat,1,rgb.func)
}

# general plotting function
plot.func = function(dat){
  # assumes dat has colums x, ym cols
  plot(dat$y,max(dat$x) - dat$x, col = dat$cols, 
       main = "A point for each CRAN package",
       xaxt='n',
       yaxt="n",
       xlab = "useR!",
       ylab = "2014",
       cex.lab=1.5, 
       cex.axis=1.5, 
       cex.main=1.5, 
       cex.sub=1.5)
}

#### simplify colors; sample n points ###

temp = im.func.1(img.2, samp.val = 25000, k = 12)
temp$cols = add.cols(temp[,6:8])

final = temp[sample(1:nrow(temp), package.count),]


#### generate plot ####

plot.func(final)



