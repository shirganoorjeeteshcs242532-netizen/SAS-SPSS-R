#13 Identifying and handling duplicates using distinct() (R).
# 1. SETUP: Load dplyr
library(dplyr)

# 2. NEW CUSTOM DATASET with Duplicates
orders_df <- data.frame(
  OrderID = c(201, 202, 202, 203, 204, 201, 204),
  Customer = c("Aman", "Sneha", "Sneha", "Faiz", "Nikita", "Aman", "Nikita"),
  Product = c("Keyboard", "Mouse", "Mouse", "Headphones", "Webcam", "Keyboard", "Charger")
)

print("--- 1. Original Dataset ---")
print(orders_df)

# 3. IDENTIFYING DUPLICATES (Full row duplicates)
duplicates_report <- orders_df %>%
  group_by(OrderID, Customer, Product) %>%
  count() %>%
  filter(n > 1)

print("--- 2. Duplicate Rows Found ---")
print(duplicates_report)

# 4. REMOVING EXACT DUPLICATES
clean_exact <- orders_df %>%
  distinct()

print("--- 3. Dataset After Removing Exact Duplicates ---")
print(clean_exact)

# 5. UNIQUE CUSTOMERS ONLY (first appearance kept)
unique_customers <- orders_df %>%
  distinct(Customer, .keep_all = TRUE)

print("--- 4. Unique Customers Only ---")
print(unique_customers)
