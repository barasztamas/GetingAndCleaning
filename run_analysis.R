#packages needed:
library(dplyr)
library(reshape2)


#download and unzip data files
download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip", "Dataset.zip")
unzip("Dataset.zip")


#get data column names from the features.txt file
columns<-read.csv("./UCI HAR Dataset/features.txt", header=F, sep =" ", stringsAsFactors=F)
colnames(columns)<-c("nr", "name")
#create a variable showing whether a certain column will be needed in our analysis
#this will be used to load only the columns needed from the data text files into our variables
#   columns are needed if their name contains either "mean()" or "std()"
#   other column names including mean (e.g. names with "meanFreq" or "gravityMean") are not considered asthey are not the mean for a measurement, but are measurements of their own
columns$needed <- grepl("mean()", columns$name, fixed=T) | grepl("std()", columns$name, fixed=T)

#create human readible column names for future use
columns$tidyname <- columns$name
#replace t and f with time and frequency
columns$tidyname <- sub("^t", "time.", columns$tidyname)
columns$tidyname <- sub("^f", "frequency.", columns$tidyname)
#add spaces and remove other short forms
columns$tidyname <- gsub("Body", "Body.", columns$tidyname, fixed = T)
columns$tidyname <- gsub("Gravity", "Gravity.", columns$tidyname, fixed = T)
columns$tidyname <- gsub("Jerk", "Jerk.", columns$tidyname, fixed = T)
columns$tidyname <- gsub("Mag", "Magnitude.", columns$tidyname, fixed = T)
columns$tidyname <- gsub("Acc", "Accelerometer.", columns$tidyname, fixed = T)
columns$tidyname <- gsub("Gyro", "Gyroscope.", columns$tidyname, fixed = T)
#remove characters incompatible with column names and collapse double dots
columns$tidyname <- gsub("()", "", columns$tidyname, fixed = T)
columns$tidyname <- gsub("-", ".", columns$tidyname, fixed = T)
columns$tidyname <- gsub("..", ".", columns$tidyname, fixed = T)


#get training data
#data loaded into memory is restricted to means and stds (as described above) by '[,columns$needed]'
traindata<-read.table("./UCI HAR Dataset/train/X_train.txt", col.names=columns$tidyname, stringsAsFactors=F)[,columns$needed]

#load activity nrs and subject nrs of training data as factors, and attach them to training data
trainactivitynr <- read.csv("./UCI HAR Dataset/train/Y_train.txt", header=F, col.names=c("activitynr"))
trainsubjectnr <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header=F, col.names=c("subjectnr"))
traindata <- cbind(traindata, trainactivitynr, trainsubjectnr)


#get test data
#data loaded into memory is restricted to means and stds (as described above) by '[,columns$needed]'
testdata<-read.table("./UCI HAR Dataset/test/X_test.txt", col.names=columns$tidyname, stringsAsFactors=F)[,columns$needed]

#load activity nrs and subject nrs of test data as factors, and attach them to test data
testactivitynr <- read.csv("./UCI HAR Dataset/test/Y_test.txt", header=F, col.names=c("activitynr"))
testsubjectnr <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header=F, col.names=c("subjectnr"))
testdata <- cbind(testdata, testactivitynr, testsubjectnr)


#summarize training and test data
data <- rbind(testdata, traindata)
#load Activity Labels and merge data with them
#   this wasn't feasible before data and Activity Nrs were combined as merge changes row order
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activitynr", "activitylabel"))
data <- merge(data, activitylabels)
#remove acivitynr which is not needed any more
data <- data[,2:69]
#remove variables not needed any more (only data remains)
rm("traindata", "testdata", "columns", "trainactivitynr", "trainsubjectnr", "testactivitynr", "testsubjectnr", "activitylabels")


#melt data for easy summarization
data <- melt(data, id.vars=c("subjectnr", "activitylabel"), measure.vars=1:66)
#recast data in original structure, using mean to summarize as needed
data <- dcast(data, activitylabel + subjectnr ~ variable, mean)


#write data to text file
write.table(data, "data.txt", sep="; ", row.names=FALSE)
