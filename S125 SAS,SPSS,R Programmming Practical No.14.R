#14 Extracting date components using lubridate:: functions (R).
# 1. Load Libraries
library(lubridate)
library(dplyr)

# 2. Create Sample Data (Date as text)
dates_df <- data.frame(
  Event_ID = 1:4,
  Date_String = c("2023-01-15", "2023-10-31", "2024-02-29", "2024-12-25")
)

# 3. Parse and Extract Components
processed_data <- dates_df %>%
  mutate(
    Actual_Date = ymd(Date_String),              # convert text to date
    Year_Num = year(Actual_Date),               # extract year
    Month_Num = month(Actual_Date),             # extract month number
    Month_Name = month(Actual_Date, label = TRUE),  # month short name
    Day_Num = day(Actual_Date),                 # day of month
    Weekday_Num = wday(Actual_Date),            # weekday number
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE), # weekday name
    Quarter = quarter(Actual_Date),             # quarter number
    Day_of_Year = yday(Actual_Date)             # day number in year
  )

print("--- Extracted Date Components ---")
print(processed_data)

# 4. System Date-Time (Now)
current_time <- now()
print("--- Current System Time ---")
print(paste("Year:", year(current_time)))
print(paste("Hour:", hour(current_time)))
print(paste("Minute:", minute(current_time)))
