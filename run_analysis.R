if(!exists("activityIdToLabel", mode="function")) source("activity_id_to_label.R")

packages_list <- c("dplyr")
new_packages <- packages_list[!(packages_list %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

library(dplyr)
options(digits = 15)

column_names <- read.csv("./Data/features.txt", sep = "", col.names = c("Number", "Label"), header = FALSE)
labels <- select(column_names, Label)
labels_as_cols <- t(labels)

# Test data
test_data <- read.fwf("./Data/test/X_test.txt", widths = c(rep(16,561)), col.names = c(labels_as_cols[1,]), colClasses = "numeric")
subjects_test_data <- read.csv("./Data/test/subject_test.txt", col.names = "subject", colClasses = "numeric", header = FALSE)
activity_ids_test_data <- read.csv("./Data/test/y_test.txt", col.names = "activity_id", colClasses = "numeric", header = FALSE)
activity_labels_test_data <- activity_ids_test_data %>% rowwise() %>% mutate(activity = activityIdToLabel(activity_id))
test_data_with_subjects_activities <- bind_cols(test_data, activity_labels_test_data[,2])
test_data_final <- bind_cols(test_data_with_subjects_activities, subjects_test_data)

# Training data
training_data <- read.fwf("./Data/train/X_train.txt", widths = c(rep(16,561)), col.names = c(labels_as_cols[1,]), colClasses = "numeric")
subjects_training_data <- read.csv("./Data/train/subject_train.txt", col.names = "subject", colClasses = "numeric", header = FALSE)
activity_ids_training_data <- read.csv("./Data/train/y_train.txt", col.names = "activity_id", colClasses = "numeric", header = FALSE)
activity_labels_training_data <- activity_ids_training_data %>% rowwise() %>% mutate(activity = activityIdToLabel(activity_id))
training_data_with_subjects_activities <- bind_cols(training_data, activity_labels_training_data[,2])
training_data_final <- bind_cols(training_data_with_subjects_activities, subjects_training_data)

all_data <- bind_rows(test_data_final, training_data_final)

mean_std_data <- all_data[,grep("mean|std|activity|subject", names(all_data), value = TRUE)]

grouped_data <- mean_std_data %>% group_by(subject, activity)

summary <- summarise_each(grouped_data, funs(mean), -contains('activity'), -contains('subject'))

write.table(summary, "./output.txt", row.names = FALSE)
