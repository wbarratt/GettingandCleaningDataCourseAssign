##CodeBook
Assignment : Getting and Cleaning Data Course Project

###Applied transformations 
1. Download the zip file from the location provided to a directory download just of the current working directory.
2. Unzip the file in a working directory called data just off the R working directory.
3. Load the files feature.txt, activity_labels.txt from main zip directory
4. Load the training data file X_train.txt of all 561 variables with 7352 rows and the related activity file y_train.txt with the related subject file subject_train.txt.
5. Load the test data file X_test.txt of all 561 variables with 2947 rows and the related activity file y_test.txt with the related subject file subject_test.txt.
6. Set the column values for the loaded data tables.
7. Append to the training and test data tables to related values to identify the subject and the activity code for each row extending the columns to 563.
8. Merge the training and the test sets to create a single data set.
9. Extracts from the primary data set only the measurements related to the mean and standard deviation for all measurements taken reduce down to 88 columns.
10. Set the activity variable name to provide more descriptive from the activity labels details provided and remove the linking id value.  Set the variable as factor.
11. Refine the variable labels by providing more detail descriptions and removing any special characters making up the variable names. All variable names are lower case.
12. From the refined data set created in step 11 creates a second, independent tidy data set with the average of each variable for each subject and the related activity resulting in 180 rows of 88 variables.

| Description | Value |
| :-- | :-- |
| Tidy Dataset file name | TidyDataSet.txt |
| Estimated dataset memory size | 286 kB |
| Data Source web site | ["http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#"]("http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#"") |
| Downloaded Data Source URL | ["https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"]("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"") |

--- 

### Data Structure


|Description                                          | Data Class | Description                                                            |
|:----------------------------------------------------|:-----------|:-----------------------------------------------------------------------|
|subject                                              |Integer     |An identifier of the 30 subjects who participated in the experiment     |
|activity                                             |Character   |Activity performed - (see detail list below)                            |
|timebodyacceleratemeanxaxis                          |Numeric     |Measurement                                                             |
|timebodyacceleratemeanyaxis                          |Numeric     |Measurement                                                             |
|timebodyacceleratemeanzaxis                          |Numeric     |Measurement                                                             |
|timebodyacceleratestandarddeviationxaxis             |Numeric     |Measurement                                                             |
|timebodyacceleratestandarddeviationyaxis             |Numeric     |Measurement                                                             |
|timebodyacceleratestandarddeviationzaxis             |Numeric     |Measurement                                                             |
|timegravityacceleratemeanxaxis                       |Numeric     |Measurement                                                             |
|timegravityacceleratemeanyaxis                       |Numeric     |Measurement                                                             |
|timegravityacceleratemeanzaxis                       |Numeric     |Measurement                                                             |
|timegravityacceleratestandarddeviationxaxis          |Numeric     |Measurement                                                             |
|timegravityacceleratestandarddeviationyaxis          |Numeric     |Measurement                                                             |
|timegravityacceleratestandarddeviationzaxis          |Numeric     |Measurement                                                             |
|timebodyacceleratejerkmeanxaxis                      |Numeric     |Measurement                                                             |
|timebodyacceleratejerkmeanyaxis                      |Numeric     |Measurement                                                             |
|timebodyacceleratejerkmeanzaxis                      |Numeric     |Measurement                                                             |
|timebodyacceleratejerkstandarddeviationxaxis         |Numeric     |Measurement                                                             |
|timebodyacceleratejerkstandarddeviationyaxis         |Numeric     |Measurement                                                             |
|timebodyacceleratejerkstandarddeviationzaxis         |Numeric     |Measurement                                                             |
|timebodygyromeanxaxis                                |Numeric     |Measurement                                                             |
|timebodygyromeanyaxis                                |Numeric     |Measurement                                                             |
|timebodygyromeanzaxis                                |Numeric     |Measurement                                                             |
|timebodygyrostandarddeviationxaxis                   |Numeric     |Measurement                                                             |
|timebodygyrostandarddeviationyaxis                   |Numeric     |Measurement                                                             |
|timebodygyrostandarddeviationzaxis                   |Numeric     |Measurement                                                             |
|timebodygyrojerkmeanxaxis                            |Numeric     |Measurement                                                             |
|timebodygyrojerkmeanyaxis                            |Numeric     |Measurement                                                             |
|timebodygyrojerkmeanzaxis                            |Numeric     |Measurement                                                             |
|timebodygyrojerkstandarddeviationxaxis               |Numeric     |Measurement                                                             |
|timebodygyrojerkstandarddeviationyaxis               |Numeric     |Measurement                                                             |
|timebodygyrojerkstandarddeviationzaxis               |Numeric     |Measurement                                                             |
|timebodyacceleratemagnitudemean                      |Numeric     |Measurement                                                             |
|timebodyacceleratemagnitudestandarddeviation         |Numeric     |Measurement                                                             |
|timegravityacceleratemagnitudemean                   |Numeric     |Measurement                                                             |
|timegravityacceleratemagnitudestandarddeviation      |Numeric     |Measurement                                                             |
|timebodyacceleratejerkmagnitudemean                  |Numeric     |Measurement                                                             |
|timebodyacceleratejerkmagnitudestandarddeviation     |Numeric     |Measurement                                                             |
|timebodygyromagnitudemean                            |Numeric     |Measurement                                                             |
|timebodygyromagnitudestandarddeviation               |Numeric     |Measurement                                                             |
|timebodygyrojerkmagnitudemean                        |Numeric     |Measurement                                                             |
|timebodygyrojerkmagnitudestandarddeviation           |Numeric     |Measurement                                                             |
|ratebodyacceleratemeanxaxis                          |Numeric     |Measurement                                                             |
|ratebodyacceleratemeanyaxis                          |Numeric     |Measurement                                                             |
|ratebodyacceleratemeanzaxis                          |Numeric     |Measurement                                                             |
|ratebodyacceleratestandarddeviationxaxis             |Numeric     |Measurement                                                             |
|ratebodyacceleratestandarddeviationyaxis             |Numeric     |Measurement                                                             |
|ratebodyacceleratestandarddeviationzaxis             |Numeric     |Measurement                                                             |
|ratebodyacceleratemeanfrequencyxaxis                 |Numeric     |Measurement                                                             |
|ratebodyacceleratemeanfrequencyyaxis                 |Numeric     |Measurement                                                             |
|ratebodyacceleratemeanfrequencyzaxis                 |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmeanxaxis                      |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmeanyaxis                      |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmeanzaxis                      |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkstandarddeviationxaxis         |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkstandarddeviationyaxis         |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkstandarddeviationzaxis         |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmeanfrequencyxaxis             |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmeanfrequencyyaxis             |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmeanfrequencyzaxis             |Numeric     |Measurement                                                             |
|ratebodygyromeanxaxis                                |Numeric     |Measurement                                                             |
|ratebodygyromeanyaxis                                |Numeric     |Measurement                                                             |
|ratebodygyromeanzaxis                                |Numeric     |Measurement                                                             |
|ratebodygyrostandarddeviationxaxis                   |Numeric     |Measurement                                                             |
|ratebodygyrostandarddeviationyaxis                   |Numeric     |Measurement                                                             |
|ratebodygyrostandarddeviationzaxis                   |Numeric     |Measurement                                                             |
|ratebodygyromeanfrequencyxaxis                       |Numeric     |Measurement                                                             |
|ratebodygyromeanfrequencyyaxis                       |Numeric     |Measurement                                                             |
|ratebodygyromeanfrequencyzaxis                       |Numeric     |Measurement                                                             |
|ratebodyacceleratemagnitudemean                      |Numeric     |Measurement                                                             |
|ratebodyacceleratemagnitudestandarddeviation         |Numeric     |Measurement                                                             |
|ratebodyacceleratemagnitudemeanfrequency             |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmagnitudemean                  |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmagnitudestandarddeviation     |Numeric     |Measurement                                                             |
|ratebodyacceleratejerkmagnitudemeanfrequency         |Numeric     |Measurement                                                             |
|ratebodygyromagnitudemean                            |Numeric     |Measurement                                                             |
|ratebodygyromagnitudestandarddeviation               |Numeric     |Measurement                                                             |
|ratebodygyromagnitudemeanfrequency                   |Numeric     |Measurement                                                             |
|ratebodygyrojerkmagnitudemean                        |Numeric     |Measurement                                                             |
|ratebodygyrojerkmagnitudestandarddeviation           |Numeric     |Measurement                                                             |
|ratebodygyrojerkmagnitudemeanfrequency               |Numeric     |Measurement                                                             |
|angletimebodyacceleratemeangravity                   |Numeric     |Measurement                                                             |
|angletimebodyacceleratejerkmeangravitymean           |Numeric     |Measurement                                                             |
|angletimebodygyromeangravitymean                     |Numeric     |Measurement                                                             |
|angletimebodygyrojerkmeangravitymean                 |Numeric     |Measurement                                                             |
|anglexaxisgravitymean                                |Numeric     |Measurement                                                             |
|angleyaxisgravitymean                                |Numeric     |Measurement                                                             |
|anglezaxisgravitymean                                |Numeric     |Measurement                                                             |

| Activity List |
| :-- |
| WALKING |
| WALKING_UPSTAIRS |
| WALKING_DOWNSTAIRS |
| SITTING |
| STANDING |
| LAYING |
