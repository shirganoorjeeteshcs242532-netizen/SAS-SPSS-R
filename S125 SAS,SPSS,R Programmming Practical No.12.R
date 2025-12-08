# 1. SETUP: Load Datasets
mental <- read.csv("Student Mental health.csv")
scores <- read.csv("student_exam_scores.csv")

print("--- Column Names ---")
print(names(mental))
print(names(scores))

# 2. DATA PREPARATION: Find common columns
common_cols <- intersect(names(mental), names(scores))
print("--- Common Columns Used ---")
print(common_cols)

# Select only common columns
mental_clean <- mental[, common_cols]
scores_clean <- scores[, common_cols]

# 3. VERTICAL CONCATENATION
combined <- rbind(mental_clean, scores_clean)

print("--- Combined Data Summary ---")
print(paste("Mental rows:", nrow(mental_clean)))
print(paste("Scores rows:", nrow(scores_clean)))
print(paste("Total Expected:", nrow(mental_clean) + nrow(scores_clean)))
print(paste("Total Actual:", nrow(combined)))

print("--- Preview (Top & Bottom) ---")
print(head(combined))
print(tail(combined))
