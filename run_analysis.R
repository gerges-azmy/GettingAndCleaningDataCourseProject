run_analysis<-function()
{
  #need to load reshape2 package to achieve requirement #5
  library(reshape2)
  
  ##Requirement #1-Merges the training and the test sets to create one data set.
  #Read the traing dataset
  Train.DataSet<-read.table("./UCI HAR Dataset/train/X_train.txt")
  Train.Labels<-read.table("./UCI HAR Dataset/train/y_train.txt")
  Train.Subjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  #Merge the taining labels and subjects to the taining dataset using cbind
  Train.DataSet<-cbind(Train.Subjects,Train.Labels,Train.DataSet)
  
  #Read the testing dataset
  Test.DataSet<-read.table("./UCI HAR Dataset/test/X_test.txt")
  Test.Labels<-read.table("./UCI HAR Dataset/test/y_test.txt")
  Test.Subjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  #Merge the taining labels and subjects to the taining dataset using cbind
  Test.DataSet<-cbind(Test.Subjects,Test.Labels,Test.DataSet)
  
  #combine the testing and training datasets into one dataset
  DataSet<-rbind(Train.DataSet,Test.DataSet) 
  
  
  ##Requirement #2-Extracts only the measurements on the mean and standard deviation for each measurement.
  
  #Read the features and enhance thier names
  Features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
  names(Features)<-c("FeatureID","Name")
 
  #Add columns names to the dataset
  #first two coulmns is the subject and activity label
  #the remaining columns are the features
  names(DataSet)<-c(c("Subject","Label"),Features[,"Name"])
  
  #search for the mean and std features
  meanAndstdFeatures<-grep("*mean*|*std*", Features[,2],ignore.case = TRUE)

  #create a verctor to hold the required variables 
  #and intilized by the first two variables\features(subject,activiy)
  targetVariables<-c(c("Subject","Label"),Features[meanAndstdFeatures,2])
  
  #Clean all of the non-desired variables\features
  DataSet<-DataSet[,targetVariables]
  
  ##Requirement #3-Uses descriptive activity names to name the activities in the data set
  #Read the activities
  Activities<-read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)
  #give column names
  names(Activities)=c("Label","Activity")
  
  #Join between the dataset and the activities 
  DataSet<-merge(x = Activities,y =DataSet )
  
  ##Requirement #4-Appropriately labels the data set with descriptive variable names.
  names(DataSet) = gsub('-mean', 'Mean', names(DataSet))
  names(DataSet) = gsub('-std', 'Std', names(DataSet))
  names(DataSet) = gsub('[-()]', '', names(DataSet))
  names(DataSet) = gsub('[-,]', '', names(DataSet))
  
  ##Requirement #5-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  Molten<-melt(data=DataSet,id.vars = c("Subject","Activity"),measure.vars = grep(".*mean.*|.*std.*", names(DataSet),ignore.case = TRUE))
  
  tidyData<-dcast(data=Molten,fun=mean,Subject + Activity ~ variable)
  
  write.table(tidyData,"tidyData.txt",row.names=FALSE)
}
