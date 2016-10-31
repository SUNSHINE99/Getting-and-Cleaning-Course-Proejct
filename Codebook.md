# Code Book

Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
xTrain           | Contains the data read from the X_train.txt using read.table()
xTest            | Contains the data read from the X_test.txt using read.table()
xOverall         | Contains the data after merging xTrain and xTest using rbind()
yTrain           | Contains the data read from the Y_train.txt using read.table()
yTest            | Contains the data read from the Y_test.txt using read.table()
yOverall         | Contains the data after merging yTrain and yTest using rbind()
subjectTest      | Contains the data read from the subject_test.txt using read.table()
subjectTrain     | Contains the data read from the subject_train.txt using read.table()
subjectOverall   | Contains the data after mering subjectTrain and subjectTest using rbind()
features         | This variable contains all the features
meanSDFeatures   | Storeas the index of the rows containg mean/std features in the feature dataset
activityLables   | Stores all the activity that subject can perform
reauiredField    | Extract only that conlumns which corresponds to the field which is related to mean/sd
out              | Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        
Some Transformation
-------------------
Transformation   | Description
-----------------|------------
rbind            | Horizontally bind the data in one data frame to other data fram
cbind            | Vertically bind the data in one data frame to other data fram
names()          | Used to change the name of the variables
read.table       | Read a file and return the data frame
write.table      | writes the data frame to the file
