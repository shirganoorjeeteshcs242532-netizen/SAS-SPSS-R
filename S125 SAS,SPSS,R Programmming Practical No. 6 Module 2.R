# Practical 6: Paired t-test

#  Load dataset
df <- read.csv("Prostate Cancer.csv")
str(df)
colnames(df)

df$area_before <- df$area
df$area_after  <- df$area + rnorm(nrow(df), mean = -50, sd = 20)

t_test_paired <- t.test(df$area_before,
                        df$area_after,
                        paired = TRUE)
print(t_test_paired)
