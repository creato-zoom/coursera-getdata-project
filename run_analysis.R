##Load dply
library(dplyr)

##Load Activity Labels && Features
activity_labels <- read.table("activity_labels.txt",col.names=c("activity_id","activity_label"))
features <- read.table("features.txt")

##Load Train Data 
#Notice that we name columns appropriately. 
#x_train colNames taken from features dataset. This accomplishes step 4 (Appropriately labels the data set with descriptive variable names. )
x_train <-read.table("x_train.txt", col.names = features$V2)
y_train <-read.table("y_train.txt",col.names = c("activity_id"))
subject_train <-read.table("subject_train.txt",col.names = c("subject"))
##Load Test Data (and name columns appropriately. x_train colNames taken from features dataset)
x_test <-read.table("x_test.txt", col.names = features$V2)
y_test <-read.table("y_test.txt",col.names = c("activity_id"))
subject_test <-read.table("subject_test.txt",col.names = c("subject"))

#combine all the train data set by their columns. 
#Notice that we name columns appropriately. 
#x_train colNames taken from features dataset. This accomplishes step 4 (Appropriately labels the data set with descriptive variable names. )
train_data <- cbind(subject_train,y_train,x_train)
train_data$segment <- 'train'

#combine all the tese data set by their columns. 
#Add column called segment with label 'test' so that we know these rows came from test dataset
test_data <- cbind(subject_test,y_test,x_test)
test_data$segment <- 'test'

##add rows from test and train together, 
#This accoplished step 1 (Merges the training and the test sets to create one data set.)
wide_data <- rbind(train_data,test_data)
##Add appropriate activity label 
#merge with activity dataset
#This accomplishes step 3 (Uses descriptive activity names to name the activities in the data set)
wide_data <- merge(wide_data,activity_labels,by='activity_id')

##Choose columns we need.
#This accomplishes step 2 (Extracts only the measurements on the mean and standard deviation for each measurement. )
narrow_data <- select(wide_data,subject, activity_label,matches("mean|std"))

##Group by activity and subject and get average of average of each variable
#This accoplishes step 4 (From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject)
aggregate_data <- narrow_data %>% group_by(subject,activity_label) %>% summarise_each(funs(mean))
write.table(aggregate_data,file="final_data.txt",row.names = FALSE)
