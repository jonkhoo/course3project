library(dplyr)

# Function to read data from directory and returns a table
# Inputs:
#   dir:    (character) Name of directory containing data
#   labels: (vector of characters) Headers for the columns
#   headers:(vector of integers) Column numbers containing relevant data
# Output:
#   Table containing the relevant data
# Assumptions:
#   Given a directory named "xyz", there must exist the following files:
#   xyz\X_xyz.txt:        data recorded from device
#   xyz\y_xyz.txt:        activity that the data is based on
#   xyz\subject_xyz.txt:  subject that the data is recorded from

# Usage:
# dir <- "test"
# headers <- c(1:3)
# labels <- c("a", "b", "c")
# data <- read_data(dir, labels, headers)
read_data <- function(dir, labels, headers) {
  # Path to dir/X_dir.txt
  file = paste0(dir, "/X_", dir, ".txt")
  # Stop if file cannot be found
  if (!file.exists(file)) {
    msg <- paste(file, "not found!")
    stop(msg)
  }
  # Read the data
  x_data <- read.table(file)
  x_tbl <- tbl_df(x_data)
  x_tbl <- x_tbl %>%
    select(headers) 
  
  # Path to dir/subject_dir.txt
  file = paste0(dir, "/subject_", dir, ".txt")
  # Stop if file cannot be found
  if (!file.exists(file)) {
    msg <- paste(file, "not found!")
    stop(msg)
  }
  # Read the subject data
  subject <- read.table(file)
  
  # Path to dir/y_dir.txt
  file = paste0(dir, "/y_", dir, ".txt")
  # Stop if file cannot be found
  if (!file.exists(file)) {
    msg <- paste(file, "not found!")
    stop(msg)
  }
  # Read the activity data
  activity <- read.table(file)
  
  # Combine the data sets
  # col #1: subject 
  # col #2: activity 
  # col #3-68: data set
  data <- cbind(subject, activity, x_tbl)
  names(data) <- c("subject", "activity", labels)
  data_tbl <- tbl_df(data)
  
  # Return the table 
  return(data_tbl)
}

# Read the data for headers
features <- read.table("features.txt")

# Read the relevant data that has std() or mean()
headers <- grep("mean\\(\\)|std\\(\\)", features[, 2])

# Rename the headers to make it more meaningful
labels <- gsub("\\(\\)", "", features[headers, 2])
labels <- gsub("-", "", labels)
labels <- gsub("mean", "Mean", labels)
labels <- gsub("std", "Std", labels)


# Read the activity label data
# This is not used in this script
# However, we can replace the numbers in activity with
# the actual labels by using the following:
#   activity_labels[activity[,1],2]
# activity_labels <- read.table("activity_labels.txt")

# Get the sub directories
dirs <- list.dirs(".", recursive=FALSE)
dirs <- gsub("\\./", "", dirs)

# 1. Read the data from each of the sub directories into a table 
# 2. Combine each table into a full table
tmp_tbl <- data.frame()
for (dir in dirs) {
  tbl <- read_data(dir, labels, headers)
  # Combine the data sets 
  tmp_tbl <- rbind(tbl, tmp_tbl)
}

# First data set 
# Sort the data by subject then activity
data_tbl <- tmp_tbl %>%
  arrange(subject, activity)

# Second data set 
# Each row contains the average
avg_data_tbl <- data_tbl %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

# Write the tables into files
write.table(data_tbl, file="clean_data.txt", row.names=FALSE)
write.table(avg_data_tbl, file="avg_data.txt", row.names=FALSE)