GettingData
===========

repo for Coursera Getting Data class project

##Basic description of how my run_analysis script works - there are detailed comments in the code as well

The script loads the "test" and "train" files and ignores the files in the "inertial" folders. Files loaded are:
X_test, subject_test, y_test, X_train, subject_train, y_train.  
The "features" file is also loaded and is used to create the variable names for the mean and standard deviation data -- 
the mean and standard deviation variables are determined using the grepl command on "mean|std" (this effectively grabs all variables containing "mean()" and "std()" and ignores some variables containing "Mean" which I have considered not relevant. If I wanted to include them, it would merely require the grepl command to use "mean|Mean|std".  

Now that I have identified all the variables I want, I need to remove all the unwanted variables from the X_test and X_train files. Since there are 561 variables, I use a FOR loop that counts down from 561 to 1. The loop therefore starts on the far right side of the data tables and removes columns corresponding to variables I don't want. I start from the right to avoid having the columns be renumbered as columns are deleted. While this loop runs, the text values "-" and "()" are removed from the variable names.

Next, I use cbind() to attach the three train files together, and then the three test files together. Following that, I use rbind() to attach the train and test files together in one combined file "combfile". Another FOR loop runs over the combined file and changes the activity code number to a descriptive text value. For example: 1 becomes "Walking"

To make the tidy data file I use the AGGREGATE function to apply the function MEAN across the entire data set, grouping by subject and activity. After a little reformating, I export the results as a space-separated .txt file (finalfile.txt)

To check the results, it can be read into R using the following command:
check <- read.table(file = "finalfile.txt", header = TRUE)
