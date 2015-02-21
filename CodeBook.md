#Project CodeBook

In this codebook, I'm going to describe the variables, the data, and any transformations or work that I performed to clean up the data.


##The DataSet

This data is from the Human Activity Recognition Using Smartphones Dataset (version 1.0). This can be obtained directly from the source at:   

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Data Description

*(According to the data provider)*

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####For each record it is provided:


* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

####The dataset includes the following files:

* README.txt

* features_info.txt: Shows information about the variables used on the feature vector.

* features.txt: List of all features.

* activity_labels.txt: Links the class labels with their activity name.

* train/X_train.txt: Training set.

* train/y_train.txt: Training labels.

* test/X_test.txt: Test set.

* test/y_test.txt: Test labels.

#####The following files are available for the train and test data. Their descriptions are equivalent. 

* train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* train/Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* train/Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* train/Inertial Signals/body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

###Vaiables
*(as per the data source , they called features)*

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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


##Transformations
The following are the transformation steps that performed on the above dataset.

***First,*** reading the traing and testing data and merge them together using cbind() and rbind() R functions:

* Training Data (data, subject,activity label)   
    + train/X_train.txt : observations data.  
    + train/y_train.txt : activity label. 
    + train/subject_train.txt: subjects data.
* Testing Data
    + test/X_test.txt : observations data.
    + test/y_test.txt : activity label.
    + test/subject_test.txt: subjects data.
    
***Second,*** the following have been performed to achieve requirement #2:

    1- Read the features (sometimes called, measurements or varibales) from 'features.txt' file.
    2- Give names to the dataset columns using the features names combined with "Subject" and "Label" for the first two columns.
    3- Extracts the measurements (dataset columns) that has "mean" and "std" phrases in thier name.
    4- Clean the dataset to have the extracted measurements combined with "Subject" and "Label" columns.

***Third,*** the following have been performed to achieve requirement #3:

    1- Read the activities from "activity_labels.txt" file.
    2- Join (merge) the dataset with the activities in order to have a new column in the dataser to hold the activity name.
    
***Fourth,*** perform some cleaning on the dataset column names to have some where descriptive variable names.

***Finally,*** I have summarized the data by subject and activity by finding the means and generated a tidy output file "tidyData.txt".

##Output File

The output file contains one row for each subject-activity pair. There were a total of 30 subject with 6 activity categories for each. Thus, the output file contains 180 observations. We have included the means of all 86 variables that contained identifiers that they held mean or standard deviation identifiers (std or mean) in the column names.

*Please refer to the readme.md file to know how to run the project script and get the output result.*
