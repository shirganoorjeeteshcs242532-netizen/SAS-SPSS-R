# Practical 8: Two-Way ANOVA (Indian Weather Dataset)

# Load dataset
data <- read.csv("indian_weather_data.csv")

# Convert categorical variables to factors
data$city <- as.factor(data$city)
data$weather_code <- as.factor(data$weather_code)

# Apply Two-Way ANOVA with interaction
anova_result <- aov(temperature ~ city * weather_code, data = data)

# Display ANOVA summary
summary(anova_result)
