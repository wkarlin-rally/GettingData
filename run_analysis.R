##Class Project for Getting and Cleaning Data, Coursera, August 2014
## load files from working directory and merge them into one data set

##load test files
X_test <- read.table("X_test.txt", quote="\"")
subject_test <- read.table("subject_test.txt", quote="\"")
y_test <- read.table("y_test.txt", quote="\"")

##load training files
X_train <- read.table("X_train.txt", quote="\"")
subject_train <- read.table("subject_train.txt", quote="\"")
y_train <- read.table("y_train.txt", quote="\"")

##load features file - will be used to give variables appropriate names
##coerce variable names to character strings
features <- read.table("features.txt", quote="\"")
features$V2 <- as.character(features$V2)

##find mean and standard deviation variables
features$V3 <- grepl("mean|std",features$V2)

##loop through variable names and remove all variables other than "mean" and "std"
##loop runs in descending order to prevent column index errors as columns are removed
##loop also assigns variable names from the features file to the remaining mean and std variables
##and fixes variable names by removing "-" and "()"
for (i in 561:1) {
  if (features[i,3] == "FALSE") {
    X_test <- X_test[,-i]
    X_train <- X_train[,-i]
  } else{
    features[i,2] <- gsub("()","",features[i,2], fixed=TRUE)
    features[i,2] <- gsub("-","",features[i,2], fixed=TRUE)
    colnames(X_test)[i] <- features[i,2]
    colnames(X_train)[i] <- features[i,2]
  }
}

trainfile <- cbind(subject_train,y_train) ##merge all training files together
trainfile <- cbind(trainfile,X_train)
testfile <- cbind(subject_test,y_test) ## merge all test files together
testfile <- cbind(testfile,X_test)

combfile <- rbind(trainfile,testfile) ##merge training and test files together, and name remaining columns
colnames(combfile)[1] <- "subject"
colnames(combfile)[2] <- "activity"

## remove original files
rm(subject_test)
rm(subject_train)
rm(testfile)
rm(trainfile)
rm(X_test)
rm(X_train)
rm(y_test)
rm(y_train)

##the above code completes the following steps in the assignment
## step 1: merges training and test sets into one data set
## step 2: extracts only the mean and standard deviation measures from the data sets
## step 4: appropriately labels the variables in the data set

## now to complete step 3: use descriptive labels to name the activities in the data set
for (i in 1:10299){
    if (combfile$activity[i] == 1) {
      combfile$activity[i] <- "Walking"
    } else if (combfile$activity[i] == 2) {
      combfile$activity[i] <- "Walking_Up"
    } else if (combfile$activity[i] == 3) {
      combfile$activity[i] <- "Walking_Down"
    } else if (combfile$activity[i] == 4) {
      combfile$activity[i] <- "Sitting"
    } else if (combfile$activity[i] == 5) {
      combfile$activity[i] <- "Standing"
    } else if (combfile$activity[i] == 6) {
      combfile$activity[i] <- "Laying"
    }
}

## coerce subject and activity variables to factors
combfile$subject <- as.factor(combfile$subject)
combfile$activity <- as.factor(combfile$activity)

## final summary of data: first column contains the subject (1-30) 
## the second column contains the activity names 
## remaining columns are 79 variables showing average of each variable
attach(combfile)
finalfile <- aggregate(combfile,by = list(subject,activity), FUN="mean") ## produce tidy data file
detach(combfile)
##fix columns and column names
finalfile <- finalfile[,-c(3,4)]
finalfile <- data.frame(finalfile)
colnames(finalfile)[1] <- "subject"
colnames(finalfile)[2] <- "activity"


##output clean file
write.table(finalfile, file = "finalfile.txt", row.names = FALSE)
