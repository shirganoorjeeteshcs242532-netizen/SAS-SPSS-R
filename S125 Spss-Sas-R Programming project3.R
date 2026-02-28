library(ggplot2)
library(reshape2)

# 1. Load Data
raw_data <- read.csv("osteoporosis.csv")

# Convert Osteoporosis to factor for plotting
raw_data$Osteoporosis <- as.factor(raw_data$Osteoporosis)

#HISTOGRAM (Age Distribution)
p2 <- ggplot(raw_data, aes(x=Age)) +
  geom_histogram(binwidth=5, fill="skyblue", color="black") +
  theme_minimal() +
  labs(title="Histogram: Age Distribution",
       x="Age",
       y="Count")

# SCATTER PLOT (Age vs Osteoporosis)
p3 <- ggplot(raw_data, aes(x=Age, y=as.numeric(Osteoporosis), color=Osteoporosis)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  theme_light() +
  labs(title="Scatter Plot: Age vs Osteoporosis",
       y="Osteoporosis (0 = No, 1 = Yes)")


print(p2)
print(p3)
