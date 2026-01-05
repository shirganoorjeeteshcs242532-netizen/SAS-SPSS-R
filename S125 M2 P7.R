# Load data
d <- read.csv("Heart_Disease_Prediction.csv")
d$Sex <- as.factor(d$Sex)

# Means
GM <- mean(d$Cholesterol)
m  <- tapply(d$Cholesterol, d$Sex, mean)
n  <- table(d$Sex)

# Sum of Squares
SS_between <- sum(n * (m - GM)^2)
SS_total   <- sum((d$Cholesterol - GM)^2)
SS_within  <- SS_total - SS_between

# Mean Squares (FORMULA)
MS_between <- SS_between / (length(m) - 1)
MS_within  <- SS_within / (nrow(d) - length(m))

# F statistic (EXACT IMAGE FORMULA)
F <- MS_between / MS_within
F
