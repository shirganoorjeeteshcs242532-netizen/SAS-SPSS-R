# Practical 3: Cross Tabulation

# Load dataset
df <- read.csv("Superstore.csv")

# Cross table: Category vs Region
cross_tab <- table(df$Category, df$Region)
print(cross_tab)
