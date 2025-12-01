# ============================================================================== 
# R Script: Handling Missing Values (scanner_data.csv) 
# ==============================================================================

library(dplyr)
library(tidyr)

# 1. IMPORT DATASET
scanner <- read.csv("Walmart_sales.csv", na.strings = c("", "NA"))
print("--- Original (first 6 rows) ---")
print(head(scanner, 6))
print("--- Missing count per column ---")
print(colSums(is.na(scanner)))

# 2. METHOD A: REMOVE ROWS WITH ANY NA
clean_omit <- na.omit(scanner)
print("--- After na.omit() ---")
print(paste("Original rows:", nrow(scanner)))
print(paste("Rows remaining:", nrow(clean_omit)))

# 3. METHOD B: REPLACE MISSING VALUES
avg_sales <- mean(scanner$Sales_Amount, na.rm = TRUE)

clean_replace <- scanner %>%
  replace_na(list(
    Date = "Unknown",
    Customer_ID = 0,
    Transaction_ID = 0,
    SKU_Category = "Unknown",
    SKU = "Unknown",
    Quantity = 0,
    Sales_Amount = avg_sales
  ))

print("--- After replace_na() (check first 6 rows) ---")
print(head(clean_replace, 6))
print("--- Remaining NAs ---")
print(colSums(is.na(clean_replace)))

# 4. METHOD C: DROP UNNEEDED FIRST COLUMN IF PRESENT
if ("...1" %in% names(clean_replace)) {
  clean_final <- clean_replace %>% select(-...1)
} else {
  clean_final <- clean_replace
}
print("--- Final columns ---")
print(names(clean_final))

# 5. SAVE CLEANED FILES
write.csv(clean_omit, "Walmart_clean_omit.csv", row.names = FALSE)
write.csv(clean_final, "Walmart_clean_replace.csv", row.names = FALSE)
print("--- Saved cleaned files ---")
