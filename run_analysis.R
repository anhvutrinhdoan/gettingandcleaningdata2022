library(dplyr)
test_data <- read.table("X_test.txt")
data_labels <- read.table("features.txt")
data_labels <- data_labels$V2
colnames(test_data)<- data_labels
onlymeans_stds_test<-test_data[,c(grep("mean|std",colnames(test_data)))]
y_test_activity <- read.table("y_test.txt")
colnames(y_test_activity) <- "ACTIVITY"
onlymeans_stds_test <- cbind(onlymeans_stds_test,y_test_activity)
train_data <- read.table("X_train.txt")
colnames(train_data) <- data_labels
onlymeans_stds_train<-train_data[,c(grep("mean|std",colnames(train_data)))]
y_train_activity <- read.table("y_train.txt")
colnames(y_train_activity) <- "ACTIVITY"
onlymeans_stds_train <- cbind(onlymeans_stds_train,y_train_activity)

combined <- rbind(onlymeans_stds_test,onlymeans_stds_train)
activity_labels <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

for (index in c(1:6)){combined[combined$ACTIVITY==index,"ACTIVITY"] <- activity_labels[index]}
df<-aggregate(combined[1:79],by=list(combined$ACTIVITY),mean)
names(df)[names(df)=="Group.1"] <- "Activity"
colnames(df) <- paste(colnames(df), "Average", sep=" ")
write.csv(df,"finished_df.csv", row.names = FALSE)
write.table(df,"finished_df.txt", sep = "\t", row.names = FALSE)
