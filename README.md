 Code Book
Original Data
The datasets used in this project came from an accelerometer and a gyroscope 3-axial raw signals captured by Samsung Galaxy S Smartphone; data was processed using applicable signal processing technologies and methods to measurement vector consisting of 561 features  (“attributes”) as described by  Reyes-Ortiz, Anguita, Ghio, Oneto and Parra in its project  “Human Activity Recognition Using Smartphones Data Set “
. 
Subject Identification Fields
•	Variable 1: subject Individual information from  the sample of 30 subjects submitted to the study . The "subject" refers to the participant's Identification (ID).
•	Variable 2: activity:  Refers to the label of the activity performed when the corresponding measurements were taken.
There were six types of activities selected for this study:
o	WALKING 
o	WALKING_UPSTAIRS 
o	WALKING_DOWNSTAIRS 
o	SITTING 
o	STANDING
o	LAYING
•	Variable 3: Features.  Measurements of activity were selected from the original data using the “Select”  function for the  "mean” and   “std”  that also  excludes columns  “freq”  and  “angle”. The names of these referred variables are the same as in features.txt but the values are the averages for  each variable of each activity and of each subject.
A sub set  sample of the studied features is provided below:
•	tBodyAcc-mean()-X (column 1)
•	tBodyAcc-mean()-Y (column 2)
•	tBodyAcc-mean()-Z (column 3)
•	tBodyAcc-std()-X (column 4)
•	tBodyAcc-std()-Y (column 5)
•	tBodyAcc-std()-Z (column 6)
•	tGravityAcc-mean()-X (column 41)
•	tGravityAcc-mean()-Y (column 42)
•	tGravityAcc-mean()-Z (column 43)
A full description of the features in the file features_info.txt,  within the folder UCI HAR Dataset  as part of the  original dataset used for analysis in this Coursera course.
After placing the proper label to the columns, the R program does cleaning of the names as needed including removal of parenthesis and hyphens from  column locations where these are invalid.  
 The mean parameter of the studied features is estimated  once the data is grouped by subject and activity. Once the estimations are completed the file “run_data_summary.txt”  is written.




References/Acknowledgements:
Coursera and  Johns Hopkins  University:  Getting and Cleaning Data Couse Project
 Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2): “Human Activity Recognition Using Smartphones Data Set “
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

