# INTRODUCTION

This document describes the code and transformations inside "run_analysis.R". It contains:

*  descritption of "varable names of output"
*  list of "test subjects"
*  list of "train subjects"
*  list 0f "activities"
*  the transformations performed.

#  VARIABLE NAMES

*	subjects
*	activity 
*	tbodyAcc-meanX
*	tbodyAcc-meanY
*	tbodyAcc-meanZ
*	tbodyAcc-stdevX
*	tbodyAcc-stdevY
*	tbodyAcc-stdevZ
*	tgravityAcc-meanX
*	gravityAcc-meanY
*	tgravityAcc-meanZ
*	tgravityAcc-stdevX
*	tgravityAcc-stdevY
*	tgravityAcc-stdevZ
*	tbodyAccJerk-meanX
*	tbodyAccJerk-meanY
*	tbodyAccJerk-meanZ
*	tbodyAccJerk-stdevX
*	tbodyAccJerk-stdevY
*	tbodyAccJerk-stdevZ
*	tbodyGyro-meanX
*	tbodyGyro-meanY
*	tbodyGyro-meanZ
*	tbodyGyro-stdevX
*	tbodyGyro-stdevY
*	tbodyGyro-stdevZ
*	tbodyGyroJerk-meanX
*	tbodyGyroJerk-meanY
*	tbodyGyroJerk-meanZ
*	tbodyGyroJerk-stdevX
*	tbodyGyroJerk-stdevY
*	tbodyGyrojerk-stdevZ
*	tbodyAccMag-mean
*	tbodyAccMag-stdev
*	tgravityAccMag-mean
*	tgravityAccMag-stdev
*	tbodyAccJerkMag-mean
*	tbodyAccJerkMag-stdev
*	tbodyGyroMag-mean
*	tbodyGyroMag-stdev
*	tbodyGyroJerkMag-mean
*	tbodyGyroJerkMag-stdev
*	fbodyAcc-meanX
*	fbodyAcc-meanY
*	fbodyAcc-meanZ
*	fbodyAcc-stdevX
*	fbodyAcc-stdevY
*	fbodyAcc-stdevZ
*	fbodyAccJerk-meanX
*	fbodyAccJerk-meanY
*	fbodyAccJerk-meanZ
*	fbodyAccJerk-stdevX
*	fbodyAccJerk-stdevY
*	fbodyAccJerk-stdevZ
*	fbodyGyro-meanX
*	fbodyGyro-meanY
*	fbodyGyro-meanZ
*	fbodyGyro-stdevX
*	fbodyGyro-stdevY
*	fbodyGyro-stdevZ
*	fbodyAccMag-mean
*	fbodyAccMag-stdev
*	fbodyAccJerkMag-mean
*	fbodyAccJerkMag-stdev
*	fbodyBodyGyroMag-mean
*	fbodyBodyGyroMag-stdev
*	fbodyBodyGyroJerkMag-mean
*	fbodyBodyGyroJerkMag-stdev


#  TEST SUBJECTS  { View(unique(subject_test)) }

subjects: 2, 4, 9, 10, 12, 13, 18, 20 and 24


#  TRAIN SUBJECTS { View(unique(subject_train)) }

subjects:1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29 and 30


# ACTIVITIES

*	standing
*	sitting
*	laying
*	walking
*	walking_downstairs
*	walking_upstairs


#  TRANSFORMATIONS

* I loaded the package "downloader" to download the zip file
* I loaded all other necessary packages for the subsequent transformations
* I read the data sets into Rstudio using "read.table()"
* I labelled the "subject_test" and the "y_test" then converted "y_test" into labelled factors
* Next I joined the "y_test", "subject_test" and "X_test" using "bind-cols()"
* I repeated the same steps for the "train" data sets
* Then i merged the joined train and test data sets using "bind_rows()"
* Next I extracted the specified columns and  then name those columns using the "names()"
* I ordered the data according to "subjects" variable
* Finally melting and dcasting the data setting the argument margins = "subject" gives the desired output.