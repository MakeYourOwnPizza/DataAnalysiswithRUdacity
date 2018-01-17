getwd()
setwd('C:/Users/haoli/Dropbox/Mengnan/SMU/MOOC/R2')
statesInfo <- read.csv('stateData.csv')

stateSubset <- subset(statesInfo,state.region == 1)
head(stateSubset, 2)
dim(stateSubset)

stateSubsetBracket <- statesInfo[statesInfo$state.region == 1,]
head(stateSubsetBracket, 2)
dim(stateSubsetBracket)

hsgover50 <- subset(statesInfo,highSchoolGrad >= 50)
illiteracy50 <- statesInfo[statesInfo$illiteracy >= 0.5,]
