run_analysis<-function(directory)
{
  directory<-"D:/Data Science/Courses/3- Getting and Cleaning Data/Course Project"
  #Set the working directory
  tempdir<-getwd()
  setwd(directory)
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
  
  
  #Read the features
  Features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
  names(Features)<-c("FeatureID","Name")
  
  names(DataSet)<-c(c("Subject","Label"),Features[,"Name"])
  
  meanFeatures<-Features[grep("mean",Features$Name,ignore.case = TRUE,fixed = TRUE),]
  stdFeatures<-Features[grep("std",Features$Name,ignore.case = TRUE,fixed = TRUE),]
  
  #create an integer verctor to hold the required variables index 
  #and intilized by the first two variables(subject,activiy)
  targetVariables<-c(c("Subject","Label"),meanFeatures[,"Name"],stdFeatures[,"Name"])
  
  DataSet<-DataSet[,targetVariables]
  
  #Read the activities
  Activities<-read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)
  
  names(Activities)=c("Label","Activity")
  
  DataSet<-merge(x = Activities,y =DataSet )
  
  library(reshape2)
  
  Molten<-melt(data=DataSet,id.vars = c("Subject","Activity"),measure.vars = c(meanFeatures[,"Name"],stdFeatures[,"Name"]))
  
  finalDS<-dcast(data=Molten,fun=mean,Subject + Activity ~ variable)
  
  head(finalDS)
  setwd(tempdir)
  
  targetVariables
  
}
