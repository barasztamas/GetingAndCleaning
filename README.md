# Project submission for Coursera Geting And Cleaning Data course

## Structure of the [run_analysis.R](https://github.com/barasztamas/GetingAndCleaning/blob/master/run_analysis.R) file

### Summary

After downloading and unziping raw data this code does following steps:
* reads and processes data column names to
  + create human-readible column names
  + help reading only the colmns needed from the raw data
* reads columns needed from training data and adds subject and activity numbers
* reads columns needed from test data and adds subject and activity numbers
* summarizes the two datasets and adds human readable activity names
* calculates average of each variable for each activity and each subject by melting and recasting
* writes data into a text file

### Lines 1-5 - load the packages needed

### Lines 6-10 - download and unzip raw data

### Lines 11-37 - read and pocess column names

#### Lines 11-13

The code loads the column names and numbers from features.txt to the columns data frame, structured as "nr" and "name" columns

#### Lines 14-19

The code creates a new column called needed in the columns data frame, indicating which of the raw data columns will be needed in the final analysis  
needed is assigned TRUE where data column name includes "mean()" or "std()", FALSE for all other column names  
this column will be used later to load only the needed columns of the raw data  

#### Lines 20-37

The code creates human readible column names for future use  
A tidyname column is created in the columns dataframe  
It is populated with the names column first, then abbreviations are expanded, and column-name-incompatible caracters are removed  

### Lines 38-47 - read training data

#### Lines 38-41

The code reads X_train.txt containing training data into a data frame, using columns$tidyname to give names to the data columns and columns$needed to read only the data needed for later analysis  

#### Lines 42-47

The code reads Y_train.txt containing activity numbers for each line of training data and subject_train.txt containing subject numbers for each line of training data and attaches them as new columns to the data frame containing training data

### Lines 48-57 - read test data

#### Lines 48-51

The code reads X_test.txt containing test data into a data frame, using columns$tidyname to give names to the data columns and columns$needed to read only the data needed for later analysis  

#### Lines 52-57

The code reads Y_test.txt containing activity numbers for each line of test data and subject_test.txt containing subject numbers for each line of test data and attaches them as new columns to the data frame containing test data

### Lines 58-69 - prepare data for analysis

#### Lines 58-59

The code summarizes the two datasets in one data range

#### Lines 60-63

The code reads activity labels and labels the data according to the activity numbers already present

#### Lines 64-69

The code removes the activitynr column and variables used earlier as they won't be needed any more

### Lines 70-75 - calculate average for each measure, grouped by activity label and subject number

data is first melt keeping activity labels and subject nrs as id columns  
in the next step data is recast using the mean function, to produce the average of every variable grouped by activity labels and subject nrs

### Lines 76-78 - write data into a text file
