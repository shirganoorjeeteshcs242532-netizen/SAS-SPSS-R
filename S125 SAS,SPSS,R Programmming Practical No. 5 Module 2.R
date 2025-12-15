# Practical 5: Independent Two Sample t-test

#  Load dataset
df <- read.csv("Superstore.csv")

str(df)
unique(df$Segment)

df_two <- subset(df, Segment %in% c("Consumer", "Corporate"))

t_test_two <- t.test(Sales ~ Segment, data = df_two)
print(t_test_two)
