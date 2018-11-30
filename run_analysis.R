################################################
### Project : Getting and Cleaning Data
### Name    : Heonyeong Lim
################################################


## Reading data

test_set <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
test_activity <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
test_subject <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)

train_set <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
train_activity <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
train_subject <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)

features_name <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt", sep = " ", header = FALSE)
activity_labels <- read.table("D:/englishLocal/data_coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE)

## 1. Merging data

all_data <- rbind(test_set, train_set)
all_activity <- rbind(test_activity, train_activity)
matched_activity <- merge(all_activity, activity_labels, by = "V1")
all_subject <- rbind(test_subject, train_subject)


## 2. Mean and sd

means <- apply(all_data, MARGIN = 2, FUN = mean)
standard_errors <- apply(all_data, 2, sd)


## 3. Naming variable

colnames(all_data) <- features_name[ ,2]
colnames(all_activity) <- "activity"
colnames(matched_activity)[2] <- "activity"
colnames(all_subject) <- "subject"


## 4. Attatching labels

all_data_ac_su <- cbind(all_activity, all_subject, all_data)


## 5. spliting with activity and subject

mean_by_ac_su <- data.frame(apply(all_data_ac_su, 2, tapply, list(all_data_ac_su$activity, all_data_ac_su$subject), mean))
mean_by_ac_su <- mean_by_ac_su[order(mean_by_ac_su$activity, mean_by_ac_su$subject), ]
mean_by_ac_su$activity <- activity_labels[mean_by_ac_su$activity, 2]

## saving data

write.table(mean_by_ac_su, "D:/englishLocal/data_coursera/written_data/all_with_mean_by_ac_su.txt", row.names = FALSE)


