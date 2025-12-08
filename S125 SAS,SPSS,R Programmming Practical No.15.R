# R Script: Generating Basic Summaries
# Functions: str() and summary() 
# Dataset: Retail Product Data (Simulated)
# 1. Create New Sample Data
retail_df <- data.frame(
  ID = 1:6,
  Category = c("Grocery", "Fashion", "Grocery", "Sports", "Fashion", "Sports"),
  Price = c(120.75, 899.00, 45.50, NA, 1599.00, 320.00),
  In_Stock = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE),
  Rating = c(3.9, 4.6, 4.1, 3.5, 4.8, 4.3)
)

print("--- Data Loaded ---")
print(retail_df)

# 2. Structure of Dataset
print("--- OUTPUT OF str() ---")
str(retail_df)

# 3. Summary Statistics
print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(retail_df)

# 4. Convert Category to Factor
retail_df$Category <- as.factor(retail_df$Category)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(retail_df)

# 5. Specific Summary Values
avg_rating <- mean(retail_df$Rating)
max_price <- max(retail_df$Price, na.rm = TRUE)

print(paste("Average Rating:", avg_rating))
print(paste("Highest Price:", max_price))
