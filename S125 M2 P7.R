# Practical 7: One-Way ANOVA (Heart Disease Dataset)

# Load dataset
data <- read.csv("Heart_Disease_Prediction.csv")

# Check column names
colnames(data)

# Convert categorical variable to factor
data$Sex <- as.factor(data$Sex)

# Apply One-Way ANOVA
anova_result <- aov(Cholesterol ~ Sex, data = data)

# Display ANOVA table
summary(anova_result)

