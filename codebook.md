---
title: "Codebook"
author: "Sagar Kukreja"
date: "September 27, 2015"
output: html_document
---
The original code book was copied and pasted below the "Updates" section.

##Updates
The measurements found in this tidy data set are the average values, per subject, per activity, of the mean and standard deviation measurements variables of the experiment. See the original codebook below for more details.
The variable names are slighltly different from the names below. "-" was replaced by "_" and "()" was removed to adhere to R naming standards. 

Altogether, there are 79 measurements for each of the 6 activities, per subject. These are:

tBodyAcc_mean_X   
tBodyAcc_mean_Y  
tBodyAcc_mean_Z  
tGravityAcc_mean_X    
tGravityAcc_mean_Y  
tGravityAcc_mean_Z  
tBodyAccJerk_mean_X  
tBodyAccJerk_mean_Y  
tBodyAccJerk_mean_Z  
tBodyGyro_mean_X  
tBodyGyro_mean_Y  
tBodyGyro_mean_Z  
tBodyGyroJerk_mean_X  
tBodyGyroJerk_mean_Y  
tBodyGyroJerk_mean_Z  
tBodyAccMag_mean  
tGravityAccMag_mean  
tBodyAccJerkMag_mean  
tBodyGyroMag_mean  
tBodyGyroJerkMag_mean  
fBodyAcc_mean_X  
fBodyAcc_mean_Y  
fBodyAcc_mean_Z  
fBodyAcc_meanFreq_X  
fBodyAcc_meanFreq_Y  
fBodyAcc_meanFreq_Z  
fBodyAccJerk_mean_X  
fBodyAccJerk_mean_Y  
fBodyAccJerk_mean_Z  
fBodyAccJerk_meanFreq_X  
fBodyAccJerk_meanFreq_Y  
fBodyAccJerk_meanFreq_Z  
fBodyGyro_mean_X  
fBodyGyro_mean_Y  
fBodyGyro_mean_Z  
fBodyGyro_meanFreq_X  
fBodyGyro_meanFreq_Y  
fBodyGyro_meanFreq_Z  
fBodyAccMag_mean  
fBodyAccMag_meanFreq  
fBodyBodyAccJerkMag_mean  
fBodyBodyAccJerkMag_meanFreq  
fBodyBodyGyroMag_mean  
fBodyBodyGyroMag_meanFreq  
fBodyBodyGyroJerkMag_mean  
fBodyBodyGyroJerkMag_meanFreq  
tBodyAcc_std_X  
tBodyAcc_std_Y  
tBodyAcc_std_Z  
tGravityAcc_std_X  
tGravityAcc_std_Y  
tGravityAcc_std_Z  
tBodyAccJerk_std_X  
tBodyAccJerk_std_Y  
tBodyAccJerk_std_Z  
tBodyGyro_std_X  
tBodyGyro_std_Y  
tBodyGyro_std_Z  
tBodyGyroJerk_std_X  
tBodyGyroJerk_std_Y  
tBodyGyroJerk_std_Z  
tBodyAccMag_std  
tGravityAccMag_std  
tBodyAccJerkMag_std  
tBodyGyroMag_std  
tBodyGyroJerkMag_std  
fBodyAcc_std_X  
fBodyAcc_std_Y  
fBodyAcc_std_Z  
fBodyAccJerk_std_X  
fBodyAccJerk_std_Y  
fBodyAccJerk_std_Z  
fBodyGyro_std_X  
fBodyGyro_std_Y  
fBodyGyro_std_Z  
fBodyAccMag_std  
fBodyBodyAccJerkMag_std  
fBodyBodyGyroMag_std  
fBodyBodyGyroJerkMag_std  

To reiterate, the tidy data set contains the average of each of these measurements. Units remain the same as described in the codebook below.

##Original Codebook

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'."

The above original codebook is from the features_info.txt file found in "UCI HAR Dataset" which can be downloaded at the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Full credit goes to:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

