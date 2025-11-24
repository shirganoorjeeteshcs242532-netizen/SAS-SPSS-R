install.packages("dplyr")

library(dplyr)
library(readr)

students <- read_csv("student_exam_scores.csv")

head(students)

high_hours <- subset(students, hours_studied > 7)
cat("Students studying > 7 hours:", nrow(high_hours), "\n")
summary(high_hours$hours_studied)

high_attendance_high_score <- subset(students, attendance_percent > 80 & exam_score > 35)
cat("High attendance & high score:", nrow(high_attendance_high_score), "\n")
head(high_attendance_high_score)

special_students <- subset(students, sleep_hours < 6 | previous_scores > 80)
cat("Special filter:", nrow(special_students), "\n")
head(special_students)

low_sleep_filter <- students |> 
  filter(sleep_hours < 6)
cat("Low sleep students:", nrow(low_sleep_filter), "\n")
summary(low_sleep_filter$sleep_hours)

combo_filter <- students |> 
  filter(hours_studied > 5, attendance_percent > 85)
cat("Hours > 5 and attendance > 85:", nrow(combo_filter), "\n")
head(combo_filter)

selected_scores <- students |> 
  filter(previous_scores %in% c(50, 60, 70))
cat("Previous scores 50, 60, 70:", nrow(selected_scores), "\n")
table(selected_scores$previous_scores)
