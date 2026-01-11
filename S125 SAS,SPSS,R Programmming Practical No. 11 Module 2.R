# Load ggplot2 library
library(ggplot2)

# Read dataset
data <- read.csv("Superstore.csv")

df <- data[, c("Sales", "Profit", "Quantity", "Discount", "Category")]

# Histogram to show distribution of Sales
ggplot(df, aes(x = Sales)) +
  geom_histogram(bins = 15, fill = "steelblue", color = "black") +
  labs(
    title = "Histogram of Sales",
    x = "Sales",
    y = "Frequency"
  )

# Box plot to compare Sales across Categories
ggplot(df, aes(x = Category, y = Sales)) +
  geom_boxplot(fill = "orange") +
  labs(
    title = "Box Plot of Sales by Category",
    x = "Category",
    y = "Sales"
  )
