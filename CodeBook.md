##Code Book (modified from features_info.txt file included with the raw data)

subject: a number identifying the study participant (1-30)

activity: one of six activities studied: Laying, Sitting, Standing, Walking, Walking_Down(stairs), Walking_Up(stairs)

79 total variables measuring various outputs of the smartphone accelerometer

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

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
