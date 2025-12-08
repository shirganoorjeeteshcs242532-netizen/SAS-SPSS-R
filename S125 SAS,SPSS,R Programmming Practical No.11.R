#11 Reshaping data using pivot_longer()/pivot_wider() (R).

# 1. SETUP: Create and Import Data
library(dplyr)
library(tidyr)

df <- read.csv("Superstore.csv", na.strings = c("", "NA")) %>%
  mutate(ProductID = row_number()) %>%
  rename(Price = Sales) %>%
  select(ProductID, Category, Price, Discount)
print("--- 1. Original Wide Data ---")
print(head(df))



# 2. PIVOT_LONGER (Wide to Long)
long_df <- df %>%
  pivot_longer(
    cols = c(Price, Discount),
    names_to = "Metric",
    values_to = "Value"
  )
print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 6))



# 3. PIVOT_WIDER (Long to Wide)
wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )
print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))



# 4. ADVANCED EXAMPLE (Reshaping for Reporting)
df_clean <- df %>%
  mutate(Category = ifelse(is.na(Category), "Unknown", Category))
category_pivot <- df_clean %>%
  select(ProductID, Category, Price) %>%
  pivot_wider(
    names_from = Category,
    values_from = Price
  )
print("--- 4. Category Pivot (Spreading Categories) ---")
print(head(category_pivot))
