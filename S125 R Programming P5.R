library(dplyr)

brain <- read.csv("Brain Tumor.csv")

brain_sorted_mean <- brain |>
  arrange(Mean)
head(brain_sorted_mean, 5)

brain_sorted_contrast_desc <- brain |>
  arrange(desc(Contrast))
head(brain_sorted_contrast_desc, 5)

brain_multi_sort <- brain |>
  arrange(Class, desc(Entropy))
head(brain_multi_sort, 10)

high_mean_low_entropy <- brain |>
  filter(Mean > 7) |>
  arrange(Entropy)
cat("Top 5 rows:\n")
print(high_mean_low_entropy |> select(Mean, Entropy, Contrast) |> head(5))
