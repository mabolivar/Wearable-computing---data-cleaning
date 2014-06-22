#===============================================
# Working directory
#===============================================
setwd("C:/Users/Manuel/Dropbox/3. DSS/Wearable-computing---data-cleaning")
#===============================================

#===============================================
# Libraries
#===============================================
library(reshape2)
#===============================================

#===============================================
# Script
#===============================================


#0. Buld directories
testdir <- "./UCI HAR Dataset/test"
traindir <- "./UCI HAR Dataset/train"

## 1 Read id, activity & features files
idtest <- read.table(paste(testdir,"/subject_test.txt", sep=""))
idtrain <- read.table(paste(traindir,"/subject_train.txt", sep=""))
activitytest <- read.table(paste(testdir,"/y_test.txt", sep=""))
activitytrain <-  read.table(paste(traindir,"/y_train.txt", sep=""))
featurestest <- read.table(paste(testdir,"/X_test.txt", sep=""))
featurestrain <-  read.table(paste(traindir,"/X_train.txt", sep=""))

#2. Build features data set
features <- rbind(cbind(idtest,activitytest,featurestest),cbind(idtrain,activitytrain,featurestrain))

con <- file("./UCI HAR Dataset/features.txt")
featurenames <- readLines(con)
close(con)

#3. Extract the mean and stdv measurements
featurenames <- unlist(strsplit(featurenames," "))[seq(2,length(featurenames)*2,2)]
names(features) <- c("ParticipantID","Activity", featurenames)
features <- features[order(features$ParticipantID,features$Activity),]
features <- features[,c(T,T,(grepl("mean",tolower(featurenames))) | grepl("std",tolower(featurenames)))]

#4. Add activity labels
acdata <- features
con <- file("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- readLines(con)
close(con)

activity_labels <- data.frame(Activity = seq(1:length(activity_labels)), ActivityLabel = unlist(strsplit(activity_labels," "))[seq(2,length(activity_labels)*2,2)])

acdata <- merge(acdata,activity_labels)
acdata <- acdata[order(acdata$ParticipantID,acdata$Activity),]
acdata$Activity <- acdata$ActivityLabel
acdata$ActivityLabel <- NULL

#5. Export data file
write.table(acdata,"tidy_accelerometry_data.txt",row.names=F)

#Second data file
melted <- melt(acdata,id.vars=c("ParticipantID","Activity"))
str(melted)

summaryData <- dcast(melted,ParticipantID + Activity  ~  variable,mean)
write.table(summaryData,"summary_data_mean_stdv.txt",row.names=F)

#===============================================