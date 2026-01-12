# Load library
# Load library
library(ggplot2)

# Read CSV file
data <- read.csv("StudentPerformance.csv")
df <- data[, c("Hours.Studied",
               "Previous.Scores",
               "Extracurricular.Activities",
               "Sleep.Hours",
               "Performance.Index")]
#for Scatter plot
ggplot(df, aes(x = Hours.Studied, y = Performance.Index)) +
  geom_jitter(width = 0.25, color = "blue", size = 0.01) +
  labs(
    title = "Hours Studied vs Performance Index",
    x = "Hours Studied",
    y = "Performance Index"
  ) +
  theme_minimal()
#for pie-chart
# Create summary for pie chart (mean of each column)
pie_data <- data.frame(
  Category = c("Hours Studied",
               "Previous Scores",
               "Extracurricular Activities",
               "Sleep Hours",
               "Performance Index"),
  Value = c(
    mean(df$Hours.Studied),
    mean(df$Previous.Scores),
    mean(df$Extracurricular.Activities),
    mean(df$Sleep.Hours),
    mean(df$Performance.Index)
  )
)
# Pie Chart
ggplot(pie_data, aes(x = "", y = Value, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Pie Chart Using Five Student Performance Factors") +
  theme_void()

#for High-low Chart
ggplot(high_low, aes(x = Category, y = Value, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(
    title = "High-Low Performance Index",
    x = "Category",
    y = "Performance Index"
  ) +
  theme_minimal()
