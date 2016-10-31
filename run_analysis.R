setwd("Z:\\Getting and Cleaning Data\\week4")

#---------------------------------------------------------------------------------------
#    PART: 0). Downloading the data sets
#---------------------------------------------------------------------------------------
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl2, destfile = "./data/dataset.zip", method="wininet")
if(!file.exists("UCI HAR Dataset")){
  unzip("./data/dataset.zip")
}
library(reshape2)
library(plyr)

#---------------------------------------------------------------------------------------
#    PART: 1). Merging test and train dataset into one dataset.
#---------------------------------------------------------------------------------------
## First merging all the rows in trian and test of x
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xOverall <- rbind(xTrain, xTest)
colnames(xOverall)
## Merging all the rows in train and test of y
yTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
yOverall <- rbind(yTrain, yTest)
## As there are 561 columns in the dataset so, adding 'V1' as 'V562'
names(yOverall) <- 'activity'
## Merging all the rows in train and test of subject
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjectOverall <- rbind(subjectTrain, subjectTest)
## As there are 561 columns in the dataset so, adding 'V1' as 'V563'
names(subjectOverall) <- 'subject'
## coulumn binding yOverall(variable='V101') and subjectOverall(variable='V102')
finalData <- cbind(xOverall, yOverall, subjectOverall)
colnames(finalData) # For verifying if the columns been added or not
#--------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------
#    PART: 2).  Extracts only the measurements on the mean and standard deviation
#               for each measurement.
#---------------------------------------------------------------------------------------
features <- read.table("UCI HAR Dataset/features.txt")
## Getting the index of the rows containg mean/std features
meanSDFeatures <- grep("(mean\\(\\)|std\\(\\))", features[,2])
## Extracting the columns which corresponds to the feature mean/std
requiredFields <-  finalData[, meanSDFeatures]
#--------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------
#    PART: 3). Uses descriptive activity names to name the activities in the data set
#---------------------------------------------------------------------------------------
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
yOverall[, 1] <- activityLabels[yOverall[, 1],2]
#--------------------------------------------------------------------------------------



#---------------------------------------------------------------------------------------
#    PART: 4). Appropriately label the data set with descriptive variable names.
#---------------------------------------------------------------------------------------
names(finalData) <- c(as.character(features[, 2]), "activity", "subject")
colnames(finalData)
#--------------------------------------------------------------------------------------



#---------------------------------------------------------------------------------------
#    PART: 5)  Create a second, independent tidy data set with the average of
#    each variable for each activity and each subject.
#---------------------------------------------------------------------------------------

?ddply
## Using ddply fucntion to aggregate the data in each columns in the dataset
out <- ddply(finalData, .(activity, subject), function(x) colMeans(x[1:561]))
?write.table
## Writing data frame to the file
write.table(out, "average.txt", row.names = FALSE)
#---------------------------------------------------------------------------------------

################################# END OF PROJECT ##################################