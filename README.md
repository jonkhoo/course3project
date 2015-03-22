# Getting and Cleaning Data Course Project

Overview
========
This repository contains the work done for Getting and Cleaning Data Course Project. 

How to run the script
=====================
1. Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a directory.
2. Copy run_analysis.R into the directory and run the file. 
	setwd(<directory>)
	source("run_analysis.R")
3. The script will create avg_data.txt (180x68) and clean_data.txt (10299x68).
4. Read the data into table inside R Studio using the following code:
	data <- read.table("avg_data.txt", header=TRUE) 
5. There are 6 activities and 30 subjects in total, hence we have 180 rows of data and 66 columns that contain the selected features. The additional 2 columns contain the data for subjects and activities.



