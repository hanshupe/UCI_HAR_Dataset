#install.packages("plyr")
#install.packages("dplyr")
library(dplyr)
library(plyr)

## ACTIVITY
dataLabelDesc <- read.csv("activity_labels.txt", sep="", header=FALSE, stringsAsFactors=FALSE)
names(dataLabelDesc)[1] <- "Act_ID"
names(dataLabelDesc)[2] <- "Activity"

## FEATURES
dataFeatures  <- read.csv("features.txt", sep="", header=FALSE, stringsAsFactors = FALSE) 

## TRAININGSET
dataTrain <- read.csv("./train/X_train.txt", sep="", header=FALSE)
dataTrainLabels <- read.csv("./train/y_train.txt", sep="", header=FALSE, stringsAsFactors=FALSE)
dataTrain<-cbind(dataTrain, dataTrainLabels)

## TESTSET
dataTest <- read.csv("./test/X_test.txt", sep="", header=FALSE)
dataTestLabels <- read.csv("./test/y_test.txt", sep="", header=FALSE, stringsAsFactors=FALSE)
dataTest<-cbind(dataTest, dataTestLabels)

## MERGE
data<-rbind(dataTrain, dataTest)

## COLUMN NAMES
colnames(data) <- as.vector(t(dataFeatures[2]))

## LOOKUP ACTIVITY NAME
names(data)[562] <- "Act_ID"
data <- join(data, dataLabelDesc, by="Act_ID")

## SELECT MEAN AND STD
data<-data[subset(as.vector(t(colnames(data))), grepl("mean\\(|std\\(|Activity", as.vector(t(colnames(data)))))]

#COLUMN NAMES
names(data)<-gsub("-","_",gsub("-std","Std",gsub("-mean","Mean",gsub("^t","Time",gsub("^f","Frequency",gsub("\\()","",names(data)))))))

## GET SUBJECTS OF DATASETS
dataTestSubject <- read.csv("./test/subject_test.txt", sep="", header=FALSE)
dataTrainSubject <- read.csv("./train/subject_train.txt", sep="", header=FALSE)

## ADD SUBJECT ID TO DATASET
dataSubject<-rbind(dataTrainSubject, dataTestSubject)
data<-cbind(data, dataSubject)
names(data)[68] <- "Subject_ID"

## CALCULATE MEAN VALUES
dataMean<-data %>% group_by(Subject_ID, Activity) %>% summarise_each(funs(mean))

## RENAME COLUMNS
names(dataMean)[3:ncol(dataMean)]<-gsub("Std","StdMean",gsub("Mean","MeanMean",names(dataMean)[3:ncol(dataMean)]))
dataMean

## WRITE FILE                                   
write.table(dataMean, file = "tidy_dataset_mean.txt", row.names=FALSE)
