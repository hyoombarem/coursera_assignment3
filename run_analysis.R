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


## 1. Merging data

all_data <- rbind(test_set, train_set)
all_activity <- rbind(test_activity, train_activity)
all_subject <- rbind(test_subject, train_subject)


## 2. Mean and sd

means <- apply(all_data, MARGIN = 2, FUN = mean)
standard_errors <- apply(all_data, 2, sd)


## 3. Naming variable

colnames(all_data) <- features_name[ ,2]
colnames(all_activity) <- "activity"
colnames(all_subject) <- "subject"


## 4. Attatching labels

all_data_activity <- cbind(all_data, all_activity)
all_data_subject <- cbind(all_data, all_subject)
all_data_ac_su <- cbind(all_data, all_activity, all_subject)

## 5. spliting with activity and subject


mean_by_activity <- data.frame(apply(all_data_activity, 2, tapply, all_activity, mean))
mean_by_activity <- cbind(mean_by_activity, rep(NA, nrow(mean_by_activity)))
names(mean_by_activity) <- names(all_data_ac_su)


mean_by_subject <- data.frame(apply(all_data_subject, 2, tapply, all_subject, mean))
subject <- mean_by_subject$subject
mean_by_subject$subject <- NA
mean_by_subject <- cbind(mean_by_subject, subject)
names(mean_by_subject) <- names(all_data_ac_su)


all_with_mean_by_ac_su <- rbind(all_data_ac_su, mean_by_activity, mean_by_subject)


## saving data

write.table(all_with_mean_by_ac_su, "D:/englishLocal/data_coursera/written_data/all_with_mean_by_ac_su.txt", row.names = FALSE)
