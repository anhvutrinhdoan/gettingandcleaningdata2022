Getting And Cleaning Data 
Coursera Course
2022.06.01

Anh Vu Doan

This is the final course project for the "Getting and Cleaning Data" coursera course. The purpose of the R script included in this repository is to perform data cleaning on the "Human Activity Using Smartphones" Data Set, available from the UCI site here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The parameters of this project were to create an R script that:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3)Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For step 1, I extracted the training and test data in the file directory and loaded them into the test_data and train_data dataframes respectively. Since the data have the same number of columns (561) as the labels in "features.txt" I was able to deduce that the labels in "features.txt" were the column names to be used in the dataframes. I therefore extracted them from features.txt and named the columns of the two respective data frames. 

For step 2, I used grep to extract only the measurements on the mean and standard deviation for each measurement. These were placed in new dataframes titled "onlymeans_stds_test" and "onlymeans_stds_train". 

For step 3, I examined the contents of y_test.txt and y_train.txt and found that these were number codes (1-6) with a number of entries equal to the number of measurements taken in X_test and X_train respectively. Looking at the "activity_labels.txt" I deduced that the numbers corresponded to the activity types associated with the context of each measurement. Therefore, I created a new dataframe for each, loading the "y_train"/"y_test" text files respectively, labeling the dataframe column "ACTIVITY". I used column binding to attach these activity label codes to their respective dataframes.

For step 4, I used a for loop to rename the numerical activity numerical codes to a human-friendly word label, according to the key in "activity_labels.txt". 

Finally, for step 5, I created the tidy data set by aggregating the measurements according to the activity and applying the mean for each measurement. The script ends by exporting the finished dataframe to "finished_df.csv".

