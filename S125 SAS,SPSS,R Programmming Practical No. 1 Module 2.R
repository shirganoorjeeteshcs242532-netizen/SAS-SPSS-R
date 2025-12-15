# Practical 1: Descriptive Statistics

# Load dataset
df <- read.csv("StudentPerformance.csv")

# View structure
str(df)

# Summary statistics (Base R)
summary(df$Performance.Index)

# Detailed statistics
library(psych)
describe(df$Performance.Index)
