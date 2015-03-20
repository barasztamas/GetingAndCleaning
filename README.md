## Project submission for Coursera Geting And Cleaning Data course

## Structure of the *run_analysis.R* file

### Lines 1-5 - loading the packages needed

### Lines 6-10 - downloading and unzipping raw data

### Lines 11-37 - column names

#### Lines 11-13

The code loads the column names and numbers from features.txt to the columns data frame, structured as nr and name columns

#### Lines 14-19

The code creates a new column called needed in the columns data frame, indicating which of the raw data columns will be needed in the final analysis
needed is assigned true where data column name includes "mean()" or "std()", false for all other column names
needed will be used later to load only the needed columns of the raw data  

#### Lines 20-37


