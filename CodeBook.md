# coursera_assignment3
assignment of coursera  


## 1-line summary
1. run_analysis.R is the R code that read data of SAMSUNG data and labels, and summary with average and standard deviation on each variables.  


##  Reading data

This code read 7 data.
- X values of train set
- Y labels of train set
- Subject labels of train set
- X values of test set
- Y labels of test set
- Subject labels of test set
- Variable names of X values  


## 1. Merging data

This part pastes train and test set of data and labels with rbind()  


## 2. Mean and sd

This part solves mean and standard deviation of each variables with apply()  


## 3. Naming variable

This part names the variables and labels with the read names  


## 4. Attatching labels

This part pastes variables and labels with cbind()  


## 5. spliting with activity and subject

This part solves mean of each variable for each activity and each subject
And pastes it on all_data  


## Saving data

This part saves the combined data with txt fils