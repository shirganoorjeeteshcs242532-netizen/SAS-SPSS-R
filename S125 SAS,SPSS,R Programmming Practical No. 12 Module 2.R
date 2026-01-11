# Read CSV file
data <- read.csv("Prostate Cancer.csv", check.names = TRUE)

df <- data[, c("radius",
               "texture",
               "perimeter",
               "area",
               "smoothness")]

# Generate correlation matrix
cor_matrix <- cor(df)

# Display correlation matrix
print(cor_matrix)
