# Dataset load
retail <- read.csv("Retail Product.csv")

# Sirf first 10 data
retail <- retail[1:10, ]

# Binary column
retail$Purchased <- ifelse(retail$Stock == "In Stock", 1, 0)

# Logistic model
model <- glm(Purchased ~ Price,
             data = retail,
             family = binomial)

# Probability
retail$prob <- predict(model, type = "response")

# GRAPH (exact image jaisa)
plot(retail$Price,
     retail$Purchased,
     pch = 19,
     col = "blue",
     xlab = "Price",
     ylab = "Purchased (0/1)",
     main = "Logistic Regression")

lines(sort(retail$Price),
      retail$prob[order(retail$Price)],
      col = "red",
      lwd = 2)


# CSV file export
write.csv(retail,"retail_product_output.csv",row.names = FALSE)

# Excel file export
library(writexl)
write_xlsx(retail,
           "retail_product_output.xlsx")

# Logistic regression results to PDF
model_summary <- summary(model)
results <- as.data.frame(model_summary$coefficients)

pdf("logistic_regression_results.pdf")
plot.new()
text(0, 1,
     paste(capture.output(print(results)), collapse = "\n"),
     adj = c(0, 1))
dev.off()
