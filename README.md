GettingData
===========

repo for Coursera Getting Data class project

##Basic description of how my run_analysis script works - there are detailed comments in the code as well

The script loads the "test" and "train" files and ignores the files in the "inertial" folders. Files loaded are:
X_test, subject_test, y_test, X_train, subject_train, y_train.  
The "features" file is also loaded and is used to create the variable names for the mean and standard deviation data -- 
the mean and standard deviation variables are determined using the GREPL command on "mean|std" (this effectively grabs all variables containing "mean()" and "std()" and ignores some variables containing "Mean" which I have considered not relevant. If I wanted to include them, it would merely require the grepl command to use "mean|Mean|std".  

Now that I have identified all the variables I want, I need to remove all the unwanted variables from the X_test and X_train files. Since there are 561 variables, I use a FOR loop that counts down from 561 to 1. The loop therefore starts on the far right side of the data tables and removes columns corresponding to variables I don't want. I start from the right to avoid having the columns be renumbered as columns are deleted. While this loop runs, the text values "-" and "()" are removed from the variable names.

Next, I use CBIND() to attach the three train files together, and then the three test files together. Following that, I use RBIND() to attach the train and test files together in one combined file "combfile". Another FOR loop runs over the combined file and changes the activity code number to a descriptive text value. For example: 1 becomes "Walking"

To make the tidy data file I use the AGGREGATE function to apply the MEAN function across the entire data set, grouping by subject and activity. After a little reformating, I export the results as a space-separated .txt file (finalfile.txt)

To check the results, it can be read into R using the following command:
check <- read.table(file = "finalfile.txt", header = TRUE)

##Code Book (modified from features_info.txt file included with the raw data)
79 total variables -- 
variables starting with a "t" are time-domain signals, and if starting with a "f", frequency-domain signals
variables ending with "XYZ" are actually three separate variables, one each for X, Y, and Z.
"mean" within the variable name refers to the average of that variable 
"std" within the variable name refers to the standard deviation of the observations of that variable

1-6: tBodyAccmeanXYZ & tBodyAccstdXYZ

7-12: tGravityAccmeanXYZ & tGravityAccstdXYZ

13-18: tBodyAccJerkmeanXYZ & tBodyAccJerkstdXYZ

19-24: tBodyGyromeanXYZ & tBodyGyrostdXYZ

25-30: tBodyGyroJerkmeanXYZ & tBodyGyroJerkstdXYZ

31-32: tBodyAccMagmean & tBodyAccMagstd 

33-34: tGravityAccMagmean & tGravityAccMagstd

35-36: tBodyAccJerkMagmean & tBodyAccJerkMagstd

37-38: tBodyGyroMagmean & tBodyGyroMagstd

39-40: tBodyGyroJerkMagmean & tBodyGyroJerkMagstd

41-46: fBodyAccmeanXYZ & fBodyAccstdXYZ

47-49: fBodyAccmeanFreqXYZ

50-55: fBodyAccJerkmeanXYZ & fBodyAccJerkstdXYZ

56-58: fBodyAccJerkmeanFreqXYZ

59-64: fBodyGyromeanXYZ & fBodyGyrostdXYZ

65-67: fBodyGyromeanFreqXYZ

68-70: fBodyAccMagmean & fBodyAccMagstd & fBodyAccMagmeanFreq

71-73: fBodyBodyAccJerkMagmean & fBodyBodyAccJerkMagstd & fBodyBodyAccJerkMagmeanFreq

74-76: fBodyBodyGyroMagmean & fBodyBodyGyroMagstd & fBodyBodyGyroMagmeanFreq

77-79: fBodyBodyGyroJerkMagmean & fBodyBodyGyroJerkMagstd & fBodyBodyGyroJerkMagmeanFreq
