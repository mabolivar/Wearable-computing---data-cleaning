
---------------------------------------------------------------------------
#Wearable computing - data cleaning
---------------------------------------------------------------------------

The script provided in this repository aggregates the data obtained in the experiment titled [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  "Human Activity Recognition Using Smartphones"). 
 

#How to use this script?
In order to use the script, the R file ***run_analysis.R** has to be edited (working directory). In this section, the description of the main components is presented.


##Set the working directory
The working directory (wd) is the folder which stores the R script, the input data folder, and the script's output data. Likewise, the wd folder must contain the following folder:

 - **UCI HAR Dataset**: Contains all the experiment data to be processed.

##Load required libraries
To run this script it is required to install the *reshape2 package*. If the package is not installed, an error message will be printed on Console. 

##Run the script

###1. Read files (id, activity & features files)

This code block reads into memory all the files corresponding to the participant IDs, the activity performed (it's ID) and all the measures for both the training and test data sets.

###2. Build features data set
This section aggregates all the data into one single data frame and updates all the measures' names.  

##3. Extract the mean and stdv measurements
Due to the large size of the data set, we decide to work only with the mean and standard deviation measurements. Then, all the others measurements are removed from the data frame.

###4. Add activity labels
In order to make the tidy data more useful, the ActivityID (contained in the raw data) were replaced by their corresponding activity label. 

###5. Export data file and build a summary data set
Finally, the tidy data frame is exported in a file called *tidy_accelerometry_data.txt*. And a summary data frame is built and exported in the *summary_data_mean_stdv.txt* file.

## For each record it is provided:


- The participant ID.
- The activity label of the activity performed within time window 
- 86-feature measurement variables (for more information, the reader may remit to the *codebook.txt* file).


## The dataset includes the following files:


- 'README.txt'

- 'run_analysis.R': Script to generate the tidy data set.

- 'codebook.txt': Code book of the tidy data set.


