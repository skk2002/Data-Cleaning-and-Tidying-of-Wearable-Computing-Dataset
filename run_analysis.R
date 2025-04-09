
library(dplyr)


features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))


X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")


X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

X_combined <- rbind(X_train, X_test)
y_combined <- rbind(y_train, y_test)
subject_combined <- rbind(subject_train, subject_test)

colnames(X_combined) <- features$feature
colnames(y_combined) <- "activity"
colnames(subject_combined) <- "subject"


mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$feature)
X_mean_std <- X_combined[, mean_std_features]

y_combined$activity <- activity_labels$activity[y_combined$activity]

data_combined <- cbind(subject_combined, y_combined, X_mean_std)

tidy_data <- data_combined %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)