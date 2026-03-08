colnames(bmd)

library(ggplot2)
library(dplyr)

# Load Dataset
bmd <- read.csv("bmd.csv", stringsAsFactors = FALSE)

# Convert sex & fracture to factor
bmd$sex <- as.factor(bmd$sex)
bmd$fracture <- as.factor(bmd$fracture)

# BMD Distribution Histogram
ggplot(bmd, aes(x = bmd)) +
  geom_histogram(binwidth = 0.02, fill = "skyblue", color = "black") +
  labs(title = "BMD Distribution",
       x = "BMD",
       y = "Frequency")

# BMD vs Fracture Box Plot
ggplot(bmd, aes(x = fracture, y = bmd, fill = fracture)) +
  geom_boxplot() +
  labs(title = "BMD vs Fracture Status",
       x = "Fracture",
       y = "BMD")

#  Age vs BMD Scatter Plot
ggplot(bmd, aes(x = age, y = bmd)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Age vs BMD",
       x = "Age",
       y = "BMD")

#  Average BMD Across Age Groups Line Graph
bmd$Age_Group <- cut(bmd$age,
                     breaks = seq(min(bmd$age),
                                  max(bmd$age),
                                  by = 10),
                     include.lowest = TRUE)

avg_bmd <- bmd %>%
  group_by(Age_Group) %>%
  summarise(mean_bmd = mean(bmd, na.rm = TRUE))

ggplot(avg_bmd, aes(x = Age_Group, y = mean_bmd, group = 1)) +
  geom_line(color = "darkgreen") +
  geom_point() +
  labs(title = "Average BMD Across Age Groups",
       x = "Age Group",
       y = "Average BMD") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#  BMD Density by Sex
ggplot(bmd, aes(x = bmd, fill = sex)) +
  geom_density(alpha = 0.4) +
  labs(title = "BMD Density by Sex",
       x = "BMD",
       y = "Density")