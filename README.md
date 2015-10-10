---
title: "README"
author: "Sagar Kukreja"
date: "September 27, 2015"
output: html_document
---
For details on the original experiment, check out:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Also, download and check out the README.txt,features.txt, features_info.txt here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##A brief overview of run_analysis.R

The ultimate goal of this program is to create a tidy data set containing the averages of the mean and standard deviation measurements of each variable per activity, per subject. To accomplish this the script first reads in the test and train data files (less the inertial signals data) found in the directory "UCI HAR Dataset" (which must be located in your working directory for this script to run). Next, the train and test data are merged to create one dataset and the mean and standard deviation measurements are extracted into a new table. This table will have  columns for the activity names and the subject number. The variable names are then editted so that they follow R's naming rules (this allowd for referencing columns for in further analysis). Lastly, the script creates the targeted tidy data set from the refined data set mentioned above. The dataset can be downloaded from the follwing link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.


##Reading in the data files 

The library "data.table" is loaded in to utilize 'fread' for the data files to be read in quicker. These files are: 'Y_test.txt','X_test.txt', 'subject_test.txt', 'X_train.txt','Y_train.txt' and 'subject_train.txt'. The column named "V1" found in the Y_test and Y_train files are renamed to "activity", and the column named "V1" in subject_test and subject_train is renamed to "subject". This avoids duplicate column names. After merging the columns of the test data together and the columns of the train data together, the two are joined by rows to create one data set. This data set contains 563 columns (subject,activity and 561 variables), and 10299 rows.  So far, the activity names are simply the numbers 1 through 6 (which correspond to activities found in the features file). To be a little more descriptive, the numbers are replaced with the titles of the activities. This is accomplished by reading in the "feature.txt" file 
##Extracting mean and std measurements

So far, the data table's variable columns are named as "V1","V2",...,"V561". This is problematic when trying to extract the mean and standard deviation measurements. One could search up the numbers that correspond to mean and std measurements in 'features.txt', but that would take forever! Instead, run_analysis reads in the "features.txt" file and assigns names to columns 3 to 563 by position (1 and 2 are subject and activity respectively) using column "V2" in the features file. In other words, column "V1" in our data set is renamed with the first element in column V2 of "features.txt", column "V2" is renamed the second element in column "V2", etc. This is a sound method since the features are listed in the same order as our columns. Now, using the "select" function from the "dplyr" library, a data table named "mean_and_stdData"" is created  by selecting columns with names containing the strings "subject", "activity", "mean"  and "std". The ignore.case argument was set to FALSE to avoid adding in columns with names containing "Mean". In particular, the measures of angles between vectors contained the string "Mean".

##Renaming variable columns and activities

Unfortunately, the feature names in 'feature.txt'--which we have used to name our variable columns-- do not follow R's rules for naming. These names contain '-' and '()'. To remedy this, the gsub function was applied to the names(mean_and_stdData) vector to substitute '-' with '_' and remove '()'. As for the activities column, a vector  "activityNames" containing the activity names (in the order found in "activity_labels.txt") was created  to replace the numbers in the activity column with the corresponding activity name using the following subsetting technique:

```{r}
activity <- c(sample(1:6,size=15,replace=TRUE))
activityNames <- c("walking","walking upstairs","walking downstairs","sitting","standing","laying")
activity <- activityNames[activity]
print(activity)
```

##Creating a tidy data set

This is by far the hardest part. Fortunately, the reshape2 library is exists. The first thing the script does for this part is it utilizes the split function to divide the mean_and_stdData by subject. Thus, a list with 30 data frames (one for each subject) with all the same variable columns as mean_and_stdData are created. Next a for loop is used to do two things: 

* Converts each data frame in our list into  long-format data using the melt function (with activity and subject as id's, and the rest as measured variables)

*  Converts each 'melted' data frame back to a wide-format data using dcast with activity and subject as our ids and mean as the aggregating function. Thus, for each activity and subject, the mean of each variable is calculated and stored in a data frame. For example, the data frame for subject 1 will be melted, and then converted back to wide-format data  with 6 rows (1 for each activity) and a column containing the mean of each variable for each activity.

Finally, 30 tables of averages are merged by rows to create a table with 180 rows (30 subjects each performing 6 activities) and 81 columns (subject,activity and 1 for each  of the 79 variable averages).