##Course Project

library(data.table)
library(dplyr)
library(reshape2)
##With the  unzipped file "UCI HAR Dataset" in the working directory, the program reads in all required files and
##relabels column 'V1' found in the Y_test,Y_train subject_test, subject_train files to avoid duplicate column names.
##The test data tables are combined by columns using cbind and similarly, the test files are combined
testX <- fread("./UCI HAR Dataset/test/X_test.txt")
testY <- fread("./UCI HAR Dataset/test/Y_test.txt")
testY <- rename(testY,activity = V1)
testSubject <- fread("./UCI HAR Dataset/test/subject_test.txt")
testSubject <- rename(testSubject,subject = V1)

test <- cbind(testSubject,testY,testX)

trainSubject <-fread("./UCI HAR Dataset/train/subject_train.txt")
trainSubject <- rename(trainSubject, subject = V1)
trainY <- fread("./UCI HAR Dataset/train/Y_train.txt")
trainY <- rename(trainY,activity = V1)
trainX <- fread("./UCI HAR Dataset/train/X_train.txt")

train <- cbind(trainSubject,trainY,trainX)

##test and train are combined by rows
data <- rbind(test,train)

##The variable names in the feature file are read in as a 2 column table--with the names in column 'V2'-- and are 
##assigned as the column names in 'data' position wise. Since the first 2 columns of 'data' are the subject numbers and
##activity names, the index for names(data) starts at 3 and goes to position 563. (there are 561 features in total).
features <- fread("./UCI\ HAR\ Dataset/features.txt")
 for(i in 1:length(features$V2)){
   names(data)[i+2] = features$V2[i]
 }

##This line creates a data table who's columns consist of certain columns from 'data'. In particular, the "subject" column,
## 'activity' column and all columns with data regarding mean and standard deviation. ignore.case was set to TRUE
##to exclude columns with 'Mean' (the variables calculating angles). Also, columns with names containing
##'Freq' or 'freq' were removed in order to omit mean frequency data.

mean_and_stdData <- select(data,contains("subject",ignore.case=TRUE),contains("activity",ignore.case=TRUE),
                           contains("mean",ignore.case=FALSE),contains("std",ignore.case=FALSE))
                           # ,-contains("Freq",ignore.case=FALSE))

## To properly name the columns, in accordance with R standards and requirements, "-" were replaced with "_" 
## and "()" were removed. This is extremely important as it allows the user to reference these columns without error
names(mean_and_stdData) <- gsub("-","_",names(mean_and_stdData))
names(mean_and_stdData) <- gsub("[()]","",names(mean_and_stdData))

##The entries under the activity column were given descriptive names (i.e activity 1 being walking, 2 being walking upstairs
## etc.).
activityNames <- c("walking","walking upstairs","walking downstairs","sitting","standing","laying")
mean_and_stdData$activity <- activityNames[mean_and_stdData$activity]
mean_and_stdData <- arrange(mean_and_stdData,subject,activity)

##create a list containing individual tables for each subject, who's columns are identical
##to mean_and_stdData's columns
splitBySubject <- split(mean_and_stdData,mean_and_stdData$subject)

splitBySubjectMelt <- list()
dataList <- list()

for(i in 1:length(splitBySubject)){
  splitBySubjectMelt[[i]] <- melt(splitBySubject[[i]],id = c("subject","activity"))
  dataList[[i]] <- dcast(splitBySubjectMelt[[i]],formula = subject + activity ~ variable,mean)
}

tidyData <- rbindlist(dataList)

write.table(tidyData,file = "tidyData.txt",sep =" ",row.names=FALSE)
df <- read.table("tidyData.txt",header=TRUE)
View(df)
