# Practical 2: Generating Frequency Tables

#  Load dataset
df <- read.csv("scanner_data.csv")
str(df)
colnames(df)

# Frequency of SKU categories
sku_freq <- table(df$SKU_Category)
print("Frequency Table using table():")
print(sku_freq)

# Load dplyr library
library(dplyr)

# Frequency using count()
sku_count <- df %>% count(SKU_Category)
print("Frequency Table using dplyr count():")
print(sku_count)
