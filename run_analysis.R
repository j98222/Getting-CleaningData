library("dplyr")
library("reshape2")
##Download files and extract to the working directory.
if (!file.exists("FUCI_HAR_Dataset.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "FUCI_HAR_Dataset.zip")
}
unzip("FUCI_HAR_Dataset.zip")

##Read data
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

training_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
training_activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
training_data <- read.table("./UCI HAR Dataset/train/X_train.txt")

##Merges the training and the test sets to create one data set
merged_data <- rbind(cbind(test_subject,test_activity,test_data),cbind(training_subject,training_activity,training_data))

##Add new column names and give data set with descriptive variable names.
col_names <- c("subject","activity",as.character(features$V2))
col_names <- gsub("[^a-zA-Z\\d-]", "", col_names)
names(merged_data)<-col_names

##Uses descriptive activity names to name the activities in the data set
merged_data$activity <- factor(merged_data$activity, levels = activity_labels$V1, labels = activity_labels$V2)

##Extracts only the measurements on the mean and standard deviation for each measurement
cols <- grep("mean|std", names(merged_data),value=TRUE)
cols <- c("subject","activity",cols)
merged_data <- merged_data[,cols]

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject
iden_cols <- c("subject","activity")
results <- melt(merged_data, id = iden_cols,measure.var=setdiff(colnames(merged_data),iden_cols))
results <- dcast(results,subject+activity ~ variable,mean)

##Write the tidy data out
write.table(results, file = "tidy_data.txt", sep = ",", row.names = FALSE)