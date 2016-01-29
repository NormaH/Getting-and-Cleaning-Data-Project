## This is the code for the tidy data
## Import the dplyr library to use select 
library(dplyr) 
 
 
# Import the data.table library to use setnames 
library(data.table) 
 
setwd("C:/Users/Norma/Documents/UCI HAR Dataset")
 
# Read in the X test dataset 
 x.test <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/test/X_test.txt", sep="", 
                   header=FALSE) 

# Read in the y test labels 
y.test <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/test/y_test.txt", sep="", 
                    header=FALSE) 
 
 
# Rest in the test subject dataset 
subject.test <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/test/subject_test.txt", 
                         sep="", header=FALSE)  

# Merge the read content per above into a single dataframe 
test <- data.frame(subject.test, y.test, x.test) 
 
 
# Read in the X training dataset 
x.train <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/train/X_train.txt", sep="", 
                     header=FALSE) 

 # Read in the training labels 
y.train <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/train/y_train.txt", sep="", 
                     header=FALSE)  
 
# Read in the training subject dataset 
subject.train <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/train/subject_train.txt", 
                           sep="", header=FALSE)  
 
# Merge test training datasets into a single dataframe 
train <- data.frame(subject.train, y.train, x.train)
  
# Joining the training and test data frames vertically. 
rundata <- rbind(test, train)

##****run.data <- rbind(train, test) 
  
# Read in the measurement labels dataset 
features <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/features.txt", sep="", header=FALSE) 
 
# Convert the 2nd column into a vector 
column.names <- as.vector(features[, 2]) 
 
# Apply the measurement labels as column names to the combined 
# running dataset 
colnames(rundata) <- c("subject_id", "activity_labels", column.names) 
 
# Force valid column names to then use select in the next step, which would otherwise produce an error 
# on duplicated column names 
 
valid_column_names <- make.names(names=names(rundata), unique=TRUE, allow_ = TRUE); 
names(rundata) <- valid_column_names 
colnames(rundata) <- valid_column_names 
 
 
# Select only columns containing the mean or standard deviations parameters. 
# Making sure to have the subject and label columns. 
# Exclude columns having frequency and angle in their name. 
rundata <- select(rundata, contains("subject"), contains("label"), 
                    contains("mean"), contains("std"), -contains("freq"), 
                    -contains("angle")) 
 
 
# Read in the activity labels dataset 
activity.labels <- read.csv("C:/Users/Norma/Documents/UCI HAR Dataset/activity_labels.txt",  
                             sep="", header=FALSE) 

 
# Replace the activity codes in the data set trimmed down  
# with the labels from the activity labels dataset. 
rundata$activity_labels <- as.character(activity.labels[ 
 match(rundata$activity_labels, activity.labels$V1), 'V2']) 
 
 
# Cleaning up the column names. Also, removing parentheses and hyphens 
# from column names where within both are invalid characters 
# column names. In addition, fixing a set of columns repeating the 
# word "Body". 
setnames(rundata, colnames(rundata), gsub("\\(\\)", "", colnames(rundata))) 
setnames(rundata, colnames(rundata), gsub("-", "_", colnames(rundata))) 
setnames(rundata, colnames(rundata), gsub("BodyBody", "Body", colnames(rundata))) 

 
# Grouping  the running data by subject and activity, then 
# calculating the mean parameter of every measurement. 
rundata.summary <- rundata %>% 
group_by(subject_id, activity_labels) %>% 
summarise_each(funs(mean)) 
 
# Write rundata to file 
write.table(rundata.summary, file="run_data_summary.txt", row.name=FALSE) 
 
