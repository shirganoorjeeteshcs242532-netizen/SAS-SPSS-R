# Create dataset
data <- data.frame(
  Hours_Studied = c(2, 4, 6, 8, 10),
  Previous_Scores = c(45, 55, 65, 75, 85),
  Sleep_Hours = c(6, 7, 8, 7, 6),
  Practice_Test_Score = c(40, 50, 60, 70, 80),
  Performance_Index = c(50, 60, 70, 80, 90)
)

# View dataset
data
# Generate correlation matrix
cor_matrix <- cor(data)

# Display correlation matrix
cor_matrix
round(cor_matrix, 2)
