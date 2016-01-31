##Getting and Cleaning Data Course

## Set parameters needed to obtain the file and download to the local machine
  datafileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  setwd(".")

  downloadfolder <-"./download"
  downloadfilename <- "UCI HAR Dataset.zip"
  
##Include the required Libraries
  LibCheck <- c("data.table", "dplyr")

  for (i in (1:length(LibCheck))) {
     if (!LibCheck[i] %in% rownames(installed.packages())){ 
              warning(paste("Required dependant libaries not installed:", libraries , ";"))
      } 
  }
  
  library(data.table)
  library(dplyr)
  

##Create working directories and download the data file then unzip
  
  #Create down directory
  if(!file.exists(downloadfolder)) {dir.create("download")}
  downloadfile <- file.path(downloadfolder, downloadfilename, fsep = "/")
  
  #Create working data directory
  if(!file.exists("data")) {dir.create("data")}
  workingdir <- file.path(getwd(), "data", fsep = "/")
  
 
  #Download file
  download.file(datafileUrl, destfile = downloadfile, mode = "wb")
  
  #Unzip
  unzip(zipfile = downloadfile, overwrite = TRUE, exdir = workingdir)  
  
  
##Access the required files to extract the data set and load data in R
  
  #Set the paths to the directory structure of the zipped file
  mainpath <- file.path(workingdir, "UCI HAR Dataset", fsep = "/") 
  testpath <- file.path(mainpath, "test", fsep = "/") 
  trainpath <- file.path(mainpath, "train", fsep = "/") 
  
  # Load the files from main and test and train directories
  activitylabels <-fread(file.path(mainpath, "activity_labels.txt", fsep = "/") ) 
  features <- fread(file.path(mainpath, "features.txt", fsep = "/") ) 
  
  traindata <- fread(file.path(trainpath, "X_train.txt", fsep = "/") )
  trainactivity <- fread(file.path(trainpath, "y_train.txt", fsep = "/") )
  trainsubjects <- fread(file.path(trainpath, "subject_train.txt", fsep = "/") )
  
  testdata <- fread(file.path(testpath, "X_test.txt", fsep = "/") )
  testactivity <- fread(file.path(testpath, "y_test.txt", fsep = "/") )
  testsubjects <- fread(file.path(testpath, "subject_test.txt", fsep = "/") )
  
  unlink(downloadfolder)
  
## Set variable column names on all data sets
  
  activitylabels <- rename(activitylabels, activityid = V1,  activity = V2)
  features <- rename(features, featureid = V1, feature = V2)
  trainactivity <- rename(trainactivity, activityid = V1)
  trainsubjects <- rename(trainsubjects, subject = V1)
  testactivity <- rename(testactivity, activityid = V1)
  testsubjects <- rename(testsubjects, subject = V1)
  
  #Set the data column names based on the features list provided
  colnames(traindata) <- features$feature
  colnames(testdata) <- features$feature
  
## Set the subject to the correct data records and include the activity id
  ##traindata <- merge(traindata, trainactivity, all = TRUE)
  traindata$activityid <- trainactivity$activityid
  traindata$subject <- trainsubjects$subject
  testdata$activityid <- testactivity$activityid
  testdata$subject <- testsubjects$subject

##Objective 1 : Combine the test data and the training data 
  l = list(traindata, testdata)
  traintestdata <- rbindlist(l, use.names = TRUE)


##Objective 2 : Extract only the measures on the mean and standard deviation of the combined dataset
  
  traintestdata <- select(traintestdata, one_of(c(grep("std()|mean()|Mean", names(traintestdata), value = TRUE),
                                         "activityid", "subject")))
  

##Objective 3: Use descriptive names to name the activities on the combined data set
  
  traintestdata <- merge(traintestdata, activitylabels, by.x = "activityid", by.y = "activityid", all = TRUE)
  
  #remove activityid not needed any more
  traintestdata <- select(traintestdata, -activityid)

  #factor the character value variables
  traintestdata$activity <- as.factor(traintestdata$activity)
  
  
##Objective 4: Rename the data variables with appropriate descriptive variable name

  #Remove characters not to be kept
  colnames(traintestdata) <- gsub(",", "", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("-", "", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub(")", "", colnames(traintestdata), fixed = TRUE) 
  
  #expound abbreviations
  colnames(traintestdata) <- gsub("Freq()", "frequency", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("mean()", "mean", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("std()", "standarddeviation", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("Mag", "magnitude", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("Acc", "accelerate", colnames(traintestdata), fixed = TRUE) 
  
  #expound axis entries
  colnames(traintestdata) <- gsub("-X", "xaxis", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("(X", "xaxis", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("-Y", "yaxis", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("(Y", "yaxis", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("(t", "time", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("-Z", "zaxis", colnames(traintestdata), fixed = TRUE) 
  colnames(traintestdata) <- gsub("(Z", "zaxis", colnames(traintestdata), fixed = TRUE) 

  #expound the starting abbreviations
  colnames(traintestdata) <- gsub("^[t]", "time", colnames(traintestdata), fixed = FALSE) 
  colnames(traintestdata) <- gsub("^[f]", "rate", colnames(traintestdata), fixed = FALSE) 
  colnames(traintestdata) <- gsub("([Bb]ody[Bb]ody|[Bb]ody)", "body", colnames(traintestdata), fixed = FALSE) 
  colnames(traintestdata) <- gsub("[Gg]yro", "gyro", colnames(traintestdata), fixed = FALSE) 
  colnames(traintestdata) <- gsub("[Jj]erk", "jerk", colnames(traintestdata), fixed = FALSE) 
  colnames(traintestdata) <- gsub("[Gg]rav", "grav", colnames(traintestdata), fixed = FALSE) 
  colnames(traintestdata) <- gsub("[M]ean", "mean", colnames(traintestdata), fixed = FALSE) 
  
  
  
##Objective 5: summaries the data by subject and activity using a mean function on values
  
  finaldata = as.data.table(traintestdata %>% group_by(subject, activity) %>% 
                                              arrange(subject, activity) %>% 
                                              summarise_each(funs( mean ))) 
  write.table(finaldata, file = "TidyDataSet.txt", row.names = FALSE) 
  
  
## Cleanup directory activity and files 
  unlink(workingdir, recursive = TRUE) 
  
  
  
  
  
  