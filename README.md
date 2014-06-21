
---------------------------------------------------------------------------
#Wearable computing - data cleaning
---------------------------------------------------------------------------

The script provided in this repository aggregates the data obtained in the experiment titled [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  "Human Activity Recognition Using Smartphones"). 
 

#How to use this script?
In order to use the script, the R file ***run_analysis.R** has to be edited. In this section, the description of the main components is presented.


##Set the working directory
The working directory (wd) is the folder which stores the R script, the input data, and the script's output data. Likewise, the wd folder must contain the following folder:

 - **UCI HAR Dataset**: Contains all the experiment data to be processed.



##Load required libraries
Starting at line 9, the lines load all the required libraries. Those libraries must be installed before running the code; otherwise, an error message will be printed on Console. 

    Error in library("Hmisc") : there is no package called ‘Hmisc’

The reader may refer back to *Requiered libraries* section for more information.

##Load functions
From line 15 until 213, all the functions are declared. Those function must be loaded in the *Workspace* to run the main routine.

##Set global parameters
Before the main routine, a set of global parameters must be fixed.

- **inputdir**: Input data folder directory.
- **outputdir**: Output folder directory.
- **outputfile**: Output .csv file name.

##Load and run the main function
In the main function, you should fix the values for the functions parameters.

The main function is composed of six blocks:

###1. Read data form the .agd files (SQLite databases)

The following block reads the database (.agd file) using the file directory `dbDir` and save the accelerometry data on the variable `data` and all the settings parameters on the variable `settings`.

    db <- readDatabase(dbDir)


For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
