# Getting and Cleaning Data course project    


## Introduction

This is the repository of Getting and Cleaning Data course project.

## Project Goal

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Requirements

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.    
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.   
  3. Uses descriptive activity names to name the activities in the data set.  
  4. Appropriately labels the data set with descriptive variable names.   
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
  
## Testing Project Output

This section should describe how to execute the output script **run_analysis.R** from this project.

### Prerequisites

In order to run **run_analysis.R**, you will need the raw data as provided in the above link. The .zip file should be unzipped in the working directory, giving you a directory "UCI HAR Dataset". However, I have also included the unzipped directory in this repository.  

The only script that is needed is run_analysis.R . The script should be placed under the working directory and be beside the data directory "UCI HAR Dataset". The script has a dependency on the reshape2 package. If you do not have this package it can be installed by: 

*install.package("reshape2")*

### Run the script

To run the script, please do the following:  

*source("run_analysis.R")*

*run_analysis()*


The output file is named tidyData.txt, and should be found in the working directory.

To read and view the file content you can run the following couple of code lines:

*tidyData <- read.table("tidyData.txt", header = TRUE)*   
*View(tidyData)*

##References

Refer to CoodBook.md for more description about the variables, the data, and any transformations or work that performed to clean up the data.

