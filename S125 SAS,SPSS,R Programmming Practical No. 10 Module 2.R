# Load library
library(ggplot2)

# Read CSV file
data <- read.csv("StudentPerformance.csv")

df <- data[, c("Hours.Studied",
               "Previous.Scores",
               "Extracurricular.Activities",
               "Sleep.Hours",
               "Performance.Index")]

ggplot(df, aes(x = Hours.Studied, y = Performance.Index)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Effect of Hours Studied on Performance Index",
    x = "Hours Studied",
    y = "Performance Index"
  )

