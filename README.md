# Coursera Course Project for Getting and Cleaning Data

This repository contains the solution to the course project for couresera's Getting and Cleaning Data class.  

The file run_analysis.R contains the code.  The code assumes all raw data is contained in the working directory.  The script reads in all the data, and writes a file called final_data.txt with the resultant data set as per the project. The script has comments in it expaining the reason for each step.

The script performs the following tasks
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* saves resultant data from step 5 in file called final_data.

The file code_book.txt contains the codebook for the variables in final_data.txt

