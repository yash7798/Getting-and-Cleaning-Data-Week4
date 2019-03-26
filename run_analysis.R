# load library dplyr 
library(dplyr)

# read train data
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read data description
feature_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
X_total <- rbind(Xtrain, Xtest)
Y_total <- rbind(Ytrain, Ytest)
Subject_total <- rbind(Subject_train, Subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_features <- feature_names[grep("mean\\(\\)|std\\(\\)",feature_names[,2]),]
X_total <- X_total[,selected_features[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activitynumber"
Y_total$activitylabel <- factor(Y_total$activitynumber, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- feature_names[selected_features[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Subject_total) <- "subject"
total <- cbind(X_total, activitylabel, Subject_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)