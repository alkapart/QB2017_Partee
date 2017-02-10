# author: alison partee
# name: ordination of diversity data

#clear r envir
rm(list = ls())

#print and set working dir
getwd() 
setwd("/Users/flopsei/GitHub/QB2017_Partee/Week3-Beta/")
# setwd("/Users/localadmin/Downloads/")

#load vegan r package
package.list <- c('vegan', 'ade4', 'viridis', 'gplots', 'indicspecies') 
for (package in package.list) {
  if (!require(package, character.only=T, quietly=T)) {
    install.packages(package)
    library(package, character.only=T)
  }
}

#load and transform data
speciesdata <- read.table("/Users/flopsei/GitHub/QB2017_Partee/speciesdata_clean.csv", sep = ",", header = TRUE)
envdata <- read.table("/Users/flopsei/GitHub/QB2017_Partee/environmentaldata.csv", sep = ",", header = TRUE)
envdata <- envdata[1:153,]

speciesdatafr <- speciesdata[,5:dim(speciesdata)[2]]
row.names(speciesdatafr) <- speciesdata$Site.number
speciesdatafr <- speciesdatafr[order(speciesdata$Site.number),]

envdatafr <- envdata[,8:24]
row.names(envdatafr) <- envdata$Site.no.
envdatafr <- envdatafr[order(envdata$Site.no.),]

#as matrix
speciesdatamat <- as.matrix(speciesdatafr)
envdatamat <- as.matrix(envdatafr)