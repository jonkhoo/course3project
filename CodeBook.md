# Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

Site where the data was obtained: 
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project: 
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

What run_analyis.R does
=======================
1. Read the labels from features.txt into a variable called features.
2. Select from features based on "std()" or "mean()" and stored it into a variable called headers.
3. Perform cleaning on the headers by removing "()" and "-" and translating "mean" to "Mean" and "std" to "Std". This gives us 66 headers.
4. Read the list of directories in the current working directory. This assumes that each of the sub directory contains the required files. For the given zip file, you should have "test" and "train" sub directories. 
5. For each of the sub directory <dir>, the script performs the following:
	- Read the collected data (X_dir.txt) into a data frame (x_tbl)
	- Read the subject data (subject_dir.txt) into a data frame (subject)
	- Read the activity data (y_dir.txt) into a data frame (activity)
	- Combine the 3 data into a data frame (data) in the following order: subject, activity, x_tbl
	- Set the header of table data using "subject", "activity" and labels
	- Convert the data frame (data) into table (data_tbl)
	- Return the table (data_tbl)
6. Combine the table returns from each sub directory into tmp_tbl
7. Sort the data by subject then activity and store it into data_tbl
8. From data_tbl, we group by subject and activity and calculates the average using mean(). The data is stored in avg_data_tbl
9. Write data_tbl into clean_data.txt
10. Write avg_data_tbl into avg_data.txt

Data Dictionary
===============
subject 
* 1-30	

activity
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

The following columns are extracted from the original data:
 
 
* "tBodyAccMeanX"				tBodyAcc-mean()-X       
* "tBodyAccMeanY"				tBodyAcc-mean()-Y
* "tBodyAccMeanZ"				tBodyAcc-mean()-Z
* "tBodyAccStdX"      			tBodyAcc-std()-X       
* "tBodyAccStdY"        		tBodyAcc-std()-Y     
* "tBodyAccStdZ"        		tBodyAcc-std()-Z     
* "tGravityAccMeanX"			tGravityAcc-mean()-X    
* "tGravityAccMeanY"    		tGravityAcc-mean()-Y    
* "tGravityAccMeanZ"    		tGravityAcc-mean()-Z    
* "tGravityAccStdX"     		tGravityAcc-std()-X     
* "tGravityAccStdY"     		tGravityAcc-std()-Y     
* "tGravityAccStdZ"     		tGravityAcc-std()-Z    
* "tBodyAccJerkMeanX"   		tBodyAccJerk-mean()-X     
* "tBodyAccJerkMeanY"   		tBodyAccJerk-mean()-Y     
* "tBodyAccJerkMeanZ"   		tBodyAccJerk-mean()-Z     
* "tBodyAccJerkStdX"			tBodyAccJerk-std()-X        
* "tBodyAccJerkStdY"    		tBodyAccJerk-std()-Y     
* "tBodyAccJerkStdZ"    		tBodyAccJerk-std()-Z    
* "tBodyGyroMeanX"      		tBodyGyro-mean()-X     
* "tBodyGyroMeanY"      		tBodyGyro-mean()-Y     
* "tBodyGyroMeanZ"      		tBodyGyro-mean()-Z    
* "tBodyGyroStdX"       		tBodyGyro-std()-X     
* "tBodyGyroStdY"       		tBodyGyro-std()-Y     
* "tBodyGyroStdZ"       		tBodyGyro-std()-Z    
* "tBodyGyroJerkMeanX"  		tBodyGyroJerk-mean()-X     
* "tBodyGyroJerkMeanY"  		tBodyGyroJerk-mean()-Y     
* "tBodyGyroJerkMeanZ"  		tBodyGyroJerk-mean()-Z    
* "tBodyGyroJerkStdX"			tBodyGyroJerk-std()-X       
* "tBodyGyroJerkStdY"   		tBodyGyroJerk-std()-Y     
* "tBodyGyroJerkStdZ"   		tBodyGyroJerk-std()-Z    
* "tBodyAccMagMean"     		tBodyAccMag-mean()     
* "tBodyAccMagStd"      		tBodyAccMag-std()     
* "tGravityAccMagMean"  		tGravityAccMag-mean()    
* "tGravityAccMagStd"   		tGravityAccMag-std()     
* "tBodyAccJerkMagMean" 		tBodyAccJerkMag-mean()     
* "tBodyAccJerkMagStd"  		tBodyAccJerkMag-std()     
* "tBodyGyroMagMean"    		tBodyGyroMag-mean()      
* "tBodyGyroMagStd"     		tBodyGyroMag-std()     
* "tBodyGyroJerkMagMean"		tBodyGyroJerkMag-mean()    
* "tBodyGyroJerkMagStd"			tBodyGyroJerkMag-std()  
* "fBodyAccMeanX"           	fBodyAcc-mean()-X 
* "fBodyAccMeanY"           	fBodyAcc-mean()-Y
* "fBodyAccMeanZ"           	fBodyAcc-mean()-Z 
* "fBodyAccStdX"            	fBodyAcc-std()-X 
* "fBodyAccStdY"            	fBodyAcc-std()-Y
* "fBodyAccStdZ"            	fBodyAcc-std()-Z
* "fBodyAccJerkMeanX"      		fBodyAccJerk-mean()-X  
* "fBodyAccJerkMeanY"       	fBodyAccJerk-mean()-Y
* "fBodyAccJerkMeanZ"       	fBodyAccJerk-mean()-Z
* "fBodyAccJerkStdX"        	fBodyAccJerk-std()-X 
* "fBodyAccJerkStdY"        	fBodyAccJerk-std()-Y
* "fBodyAccJerkStdZ"        	fBodyAccJerk-std()-Z 
* "fBodyGyroMeanX"				fBodyGyro-mean()-X           
* "fBodyGyroMeanY"          	fBodyGyro-mean()-Y
* "fBodyGyroMeanZ"          	fBodyGyro-mean()-Z 
* "fBodyGyroStdX"           	fBodyGyro-std()-X 
* "fBodyGyroStdY"           	fBodyGyro-std()-Y
* "fBodyGyroStdZ"           	fBodyGyro-std()-Z 
* "fBodyAccMagMean"         	fBodyAccMag-mean() 
* "fBodyAccMagStd"          	fBodyAccMag-std()
* "fBodyBodyAccJerkMagMean" 	fBodyBodyAccJerkMag-mean() 
* "fBodyBodyAccJerkMagStd"  	fBodyBodyAccJerkMag-std() 
* "fBodyBodyGyroMagMean"    	fBodyBodyGyroMag-mean() 
* "fBodyBodyGyroMagStd"     	fBodyBodyGyroMag-std() 
* "fBodyBodyGyroJerkMagMean"	fBodyBodyGyroJerkMag-mean() 
* "fBodyBodyGyroJerkMagStd" 	fBodyBodyGyroJerkMag-std()

