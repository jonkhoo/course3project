# Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

Site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

What run_analyis.R does
=======================
1. Read the labels from features.txt into a variable called features.
2. Select from features based on "std()" or "mean()" and stored it into a variable called headers.
3. Perform cleaning on the headers by removing "()" and "-" and translating "mean" to "Mean" and "std" to "Std". This gives us 66 headers.
4. Read the list of directories in the current working directory. This assumes that each of the sub directory contains the required files. For the given zip file, you should have "test" and "train" sub directories. 
5. For each of the sub directory <dir>, the script performs the following:
## Read the collected data (X_dir.txt) into x_tbl
## Read the subject data (subject_dir.txt) into subject
## Read the activity data (y_dir.txt) into activity
## Combine the 3 data into a table in the following order: subject, activity, x_tbl
## Return the table
6. Combine the table returns from each sub directory into tmp_tbl
7. Sort the data by subject then activity and store it into data_tbl
8. From data_tbl, we group by subject and activity and calculates the average using mean(). The data is stored in avg_data_tbl
9. Write data_tbl into clean_data.txt
10. Write avg_data_tbl into avg_data.txt

Data Dictionary
===============
subject
		1-30	

activity
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING

The following columns are extracted from the original data:
	"tBodyAccMeanX"            "tBodyAccMeanY"            "tBodyAccMeanZ"           
	"tBodyAccStdX"             "tBodyAccStdY"             "tBodyAccStdZ"            
	"tGravityAccMeanX"         "tGravityAccMeanY"         "tGravityAccMeanZ"        
	"tGravityAccStdX"          "tGravityAccStdY"          "tGravityAccStdZ"         
	"tBodyAccJerkMeanX"        "tBodyAccJerkMeanY"        "tBodyAccJerkMeanZ"       
	"tBodyAccJerkStdX"         "tBodyAccJerkStdY"         "tBodyAccJerkStdZ"        
	"tBodyGyroMeanX"           "tBodyGyroMeanY"           "tBodyGyroMeanZ"          
	"tBodyGyroStdX"            "tBodyGyroStdY"            "tBodyGyroStdZ"           
	"tBodyGyroJerkMeanX"       "tBodyGyroJerkMeanY"       "tBodyGyroJerkMeanZ"      
	"tBodyGyroJerkStdX"        "tBodyGyroJerkStdY"        "tBodyGyroJerkStdZ"       
	"tBodyAccMagMean"          "tBodyAccMagStd"           "tGravityAccMagMean"      
	"tGravityAccMagStd"        "tBodyAccJerkMagMean"      "tBodyAccJerkMagStd"      
	"tBodyGyroMagMean"         "tBodyGyroMagStd"          "tBodyGyroJerkMagMean"    
	"tBodyGyroJerkMagStd"      "fBodyAccMeanX"            "fBodyAccMeanY"           
	"fBodyAccMeanZ"            "fBodyAccStdX"             "fBodyAccStdY"            
	"fBodyAccStdZ"             "fBodyAccJerkMeanX"        "fBodyAccJerkMeanY"       
	"fBodyAccJerkMeanZ"        "fBodyAccJerkStdX"         "fBodyAccJerkStdY"        
	"fBodyAccJerkStdZ"         "fBodyGyroMeanX"           "fBodyGyroMeanY"          
	"fBodyGyroMeanZ"           "fBodyGyroStdX"            "fBodyGyroStdY"           
	"fBodyGyroStdZ"            "fBodyAccMagMean"          "fBodyAccMagStd"          
	"fBodyBodyAccJerkMagMean"  "fBodyBodyAccJerkMagStd"   "fBodyBodyGyroMagMean"    
	"fBodyBodyGyroMagStd"      "fBodyBodyGyroJerkMagMean" "fBodyBodyGyroJerkMagStd" 


