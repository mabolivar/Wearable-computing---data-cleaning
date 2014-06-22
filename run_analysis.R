#===============================================
# Working directory
#===============================================
setwd("C:\\Users\\manuel\\Dropbox\\Coursera\\Data Science Specialization\\Getdata\\Project")
#===============================================
library(reshape2)

testdir <- "./UCI HAR Dataset/test"
traindir <- "./UCI HAR Dataset/train"

#1. Read files
testfiles <- dir(testdir,pattern = "[:print:][.txt]")
trainfiles <- dir(traindir,pattern = "[:print:][.txt]")

meltdata <- data.frame() #Final data frame

## 1.1 Read id, activity & features files
idtest <- read.table(paste(testdir,"/subject_test.txt", sep=""))
idtrain <- read.table(paste(traindir,"/subject_train.txt", sep=""))
activitytest <- read.table(paste(testdir,"/y_test.txt", sep=""))
activitytrain <-  read.table(paste(traindir,"/y_train.txt", sep=""))
featurestest <- read.table(paste(testdir,"/X_test.txt", sep=""))
featurestrain <-  read.table(paste(traindir,"/X_train.txt", sep=""))

#Build features data set
features <- rbind(cbind(idtest,activitytest,featurestest),cbind(idtrain,activitytrain,featurestrain))

con <- file("./UCI HAR Dataset/features.txt")
featurenames <- readLines(con)
close(con)

#Extract the mean stdv measurements
featurenames <- unlist(strsplit(featurenames," "))[seq(2,length(featurenames)*2,2)]
names(features) <- c("ParticipantID","Activity", featurenames)
features <- features[order(features$ParticipantID,features$Activity),]
features <- features[,c(T,T,(grepl("mean",tolower(featurenames))) | grepl("std",tolower(featurenames)))]

# Add activity labels
acdata <- features
con <- file("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- readLines(con)
close(con)

activity_labels <- data.frame(Activity = seq(1:length(activity_labels)), ActivityLabel = unlist(strsplit(activity_labels," "))[seq(2,length(activity_labels)*2,2)])

acdata <- merge(acdata,activity_labels)
acdata <- acdata[order(acdata$ParticipantID,acdata$Activity),]
acdata$Activity <- acdata$ActivityLabel
acdata$ActivityLabel <- NULL

#Export data file
write.table(acdata,"tidy_accelerometry_data.txt",row.names=F)

#Second data file
melted <- melt(acdata,id.vars=c("ParticipantID","Activity"))
str(melted)

summaryData <- dcast(melted,ParticipantID + Activity  ~  variable,mean)
write.table(summaryData,"summary_data_mean_stdv.txt",row.names=F)
