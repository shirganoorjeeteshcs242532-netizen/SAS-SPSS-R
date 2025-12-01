#7. Selecting and dropping variables using select() in R.
# ==============================================================================

library(dplyr)

# 1. IMPORT DATASET
scanner <- read.csv("scanner_data.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(scanner, 3))

# ==============================================================================
# 2. SELECTING VARIABLES (Keeping Columns)
# ==============================================================================

# Method A: Select specific columns
selected_cols <- scanner %>%
  select(Date, Transaction_ID, Sales_Amount)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

# Method B: Select a range of adjacent columns
range_cols <- scanner %>%
  select(Date:SKU)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

# Method C: Select columns starting with 'S'
starts_with_s <- scanner %>%
  select(starts_with("S"))

print("--- Selected columns starting with 'S' ---")
print(head(starts_with_s, 3))

# ==============================================================================
# 3. DROPPING VARIABLES (Removing Columns)
# ==============================================================================

# Method A: Drop the first column (...1)
dropped_one <- scanner %>%
  select(-...1)

print("--- Dataset with ...1 dropped ---")
print(names(dropped_one))

# Method B: Drop multiple columns
dropped_multiple <- scanner %>%
  select(-Customer_ID, -SKU_Category)

print("--- Dataset with Customer_ID and SKU_Category dropped ---")
print(names(dropped_multiple))

# Method C: Drop a range of columns (SKU to Quantity)
dropped_range <- scanner %>%
  select(-(SKU:Quantity))

print("--- Dataset after dropping SKU to Quantity range ---")
print(names(dropped_range))
