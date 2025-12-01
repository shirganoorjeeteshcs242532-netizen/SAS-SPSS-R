library(dplyr) 


# Dataset 1: Sales in January
data_jan <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Jeetesh", "Vikas", "Abhishek"),
  Jan_Sales = c(160, 190, 200)
)

# Dataset 2: Sales in February
data_feb <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Jeetesh", "Vikas", "Abhishek"),
  Feb_Sales = c(120, 160, 210)
)

# Dataset 3: New Employees (For appending example)
data_new_hires <- data.frame(
  ID = c(4, 5),
  Name = c("Daniyal", "Aquib"),
  Jan_Sales = c(50, 60)
)

print("--- Data January ---")
print(data_jan)
print("--- Data February ---")
print(data_feb)

# 2. MERGE (Joining Columns)
# Scenario: You want to compare Jan and Feb sales for the same people.
# We match them by "ID" and "Name".

merged_data <- merge(data_jan, data_feb, by = c("ID", "Name"))

print("--- Merged Data (Columns Added) ---")
print(merged_data)


# 3. APPEND (Stacking Rows)
# Scenario: You want to add the new hires to the January list.
# We use bind_rows to stack them.

# Note: bind_rows automatically matches column names.
final_list <- bind_rows(data_jan, data_new_hires)

print("--- Appended Data (Rows Added) ---")
print(final_list)

