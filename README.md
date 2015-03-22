# course3project
Getting and Cleaning Data Course Project

Overview
========
1. Read the labels from features.txt.
2. Select labels based on "std" or "mean" while ignoring the case. This gave 86 labels.
3. Rename the labels to make it more meaningful.
4. List the sub-directories under the current working directory. This assumes that each sub-directory contains the required data.
5. For each of the sub directory, read the subject, activity and collected data.
6. Join subject, activity and collected data into a table of 88 columns.
7. Join the table from each sub-directory into a final table.
8. Arrange the final table in order of subject and activity.
9. Create a second data set by summarizing the value of each column grouping by subject and activity.
10. Write the second data set into data.txt

run_analysis.R
==============
This script can be ran in any directory containing the test and train data.
It assumes that any of the sub directories found in the current directory
to contain the necessary data.

data.txt
========
This is the second data set created by run_analysis.R

Codebook.md
===========
This contains the Codebook for the data created above by run_analysis.R


