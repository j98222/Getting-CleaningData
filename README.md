### Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data that 
can be used for later analysis. 

### Data source

The data source is from the course website and it represents data collected 
from the accelerometers from the Samsung Galaxy S smartphone. A full 
description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Contents

* run_analysis.R -- The script performs the analysis.
* tidy_data.txt -- The tidy data set outcome.
* CodeBook.md --  The code book that describes the variables, the data, and any transformations.

### How To Run

Once you installed both "dplyr" and "reshape2" library, you are ready to run 
run_analysis.R scrip by using source function. This script will download and 
extract all data files in you working directory first,and then perform the analysis. 
At the end tidy_data.txt will be written to your working directory as the results.