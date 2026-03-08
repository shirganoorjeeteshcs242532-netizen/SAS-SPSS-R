library(ggplot2)
library(reshape2)

df <- read.csv("UA.csv")
df_numeric <- df[sapply(df, is.numeric)]

corr_matrix <- cor(df_numeric, use = "complete.obs")
corr_matrix[abs(corr_matrix) < 0.3] <- NA
diag(corr_matrix) <- NA

melted_corr <- melt(corr_matrix, na.rm = TRUE)

ggplot(melted_corr, aes(Var2, Var1, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "#6D9EC1", high = "#E46726", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Correlation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  coord_fixed() +
  labs(title = "Network-Based Relationship Among Key Health Variables (UA Dataset)",
       x = "", y = "")