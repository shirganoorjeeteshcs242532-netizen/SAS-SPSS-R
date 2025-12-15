# Practical 4: One Sample t-test

# Load dataset
df <- read.csv("Walmart_Sales.csv")

str(df)
colnames(df)


t_test_one <- t.test(df$Weekly_Sales, mu = 50000)

print(t_test_one)
