# coursera_assignment3
assignment of coursera  


## 1-line summary
1. run_analysis.R is the R code that read data of SAMSUNG data and labels, and summary with average and standard deviation on each variables.  


##  Reading data

This code read 7 data.
- test_set : X values of test set
- test_activity : activity factors of test set
- test_subject : subject factors of test set
- train_set : X values of train set
- train_activity : activity factors of train set
- train_subject : subject factors of train set
- features_name : set of variable names
- activity_labels : labels of activity code numbers


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
and assign it to "mean_by_ac_su"  


## Saving data

This part saves the combined data with txt fils