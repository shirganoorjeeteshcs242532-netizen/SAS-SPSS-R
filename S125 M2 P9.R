# Practical 9: Chi-Square Test of Independence (Mega Gym Dataset)

# Load dataset
data <- read.csv("megaGymDataset.csv")

# Check columns (optional)
colnames(data)

# Create contingency table between Type and BodyPart
contingency_table <- table(data$Type, data$BodyPart)

# Display the table
print(contingency_table)

# Apply Chi-Square Test
chi_result <- chisq.test(contingency_table)

# Display test result
chi_result

