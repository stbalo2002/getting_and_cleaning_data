## set the working directory to the file containing the unzipped data sets.
## now i load the required packages that i will be using for the project
library("plyr")
library("dplyr")
library("reshape2")
library("tidyr")
## then i load the X_test and the subject_test data sets
X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")
subject_test <- read.table("./test/subject_test.txt")
## the subject_test contains the subjects for the experiments so i re-label it 
## "subject"
names(subject_test) <- "subject"
## finally for the test, i load the "y_test" which contains the  code for activities 
## for the test subjects
y_test <- read.table("./test/y_test.txt")
## i prefer to label the activity factors here
y_test <- factor(y_test$V1, levels = c(1, 2, 3, 4, 5, 6), labels = 
                   c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))
## labeling the "y_test" converts to lists so i re-convert it to dataframe and change the column name  
y_test <- as.data.frame(y_test)
names(y_test) <- "activity"
## finally, i bind all the three different tables for "test" together
test_binded <- bind_cols(subject_test, y_test, X_test)
## i repeat the same procedure for the "train" data sets
X_train <- read.table("./train/X_train.txt")
subject_train <- read.table("./train/subject_train.txt")
names(subject_train) <- "subject"
y_train <- read.table("./train/y_train.txt")
y_train <- factor(y_train$V1, levels = c(1, 2, 3, 4, 5, 6), labels = 
                    c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))
y_train <- as.data.frame(y_train)
names(y_train) <- "activity"
train_binded <- bind_cols(subject_train, y_train, X_train)
## now, i merge the "test_binded" and "train_binded" data sets together using bind_rows()
data_merged <- bind_rows(test_binded, train_binded)
features <- read.table("./features.txt")
features <- select(features, V2)
features <- unclass(features)
 features <- unlist(features)
features <- as.character(features)
names(data_merged) <- c("subject", "activity", features)
extract <- data_merged[, c(1, 2, 3:8, 43:48, 83:88, 123:128, 163:168, 203, 204, 216, 217,
           229, 230, 242, 243, 255, 256, 268:273, 347:352, 426:431,  505, 506, 518,
           519, 531, 532, 544, 545)]
## i want to arrange the subjects in ascending order
data_ord <- arrange(extract, subject)
## to find the average of each variable for each activity and each subject,
## i am going to melt the data, then dcast it with the arguments "mean"
## and "margins = subject"
data_melt <- melt(data_ord, id.vars = c("subject", "activity"))
data_cast <- dcast(data_melt, subject + activity ~ ..., mean, margins = "subject")
data_cast <- arrange(data_cast, subject, activity)




