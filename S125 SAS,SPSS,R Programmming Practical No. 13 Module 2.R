# Load dataset
sales <- read.csv("sales_data.csv")

sales10 <- sales[1:10, ]

model_lm <- lm(Sales_Amount ~ Quantity_Sold, data = sales10)

# Summary
summary(model_lm)

# Graph
plot(sales10$Quantity_Sold,
     sales10$Sales_Amount,
     main = "Linear Regression",
     xlab = "Quantity Sold",
     ylab = "Sales Amount",
     pch = 19,
     col = "blue")

# Regression line
abline(model_lm, col = "red", lwd = 2)
