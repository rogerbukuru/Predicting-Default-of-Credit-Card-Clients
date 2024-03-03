rm(list = ls())
library(readxl)
library(tidyverse)
library(knitr)
library(ggplot2)
library(dplyr)

file_path = "../Data/Assignment/default of credit card clients.xls"

# Credit Limit Analysis

credit_default_data = as_tibble(read_xls(file_path))
head(credit_default_data)

colnames(credit_default_data) = as.character(credit_default_data[1, ])

credit_default_data = credit_default_data[-1,]


limit_balances  = credit_default_data |>
  drop_na(LIMIT_BAL) |>
  select(LIMIT_BAL) |>
  as.matrix() |>
  as.vector() |>
  as.numeric()

colnames(credit_default_data)
average_limit_balance = mean(limit_balances)
range(limit_balances)

male_average_credit_limit = credit_default_data |>
  filter(SEX == 1) |>
  select(LIMIT_BAL) |>
  as.matrix() |>
  as.vector() |>
  as.numeric() |>
  mean()

female_average_credit_limit = credit_default_data |>
  filter(SEX == 2) |>
  select(LIMIT_BAL) |>
  as.matrix() |>
  as.vector() |>
  as.numeric() |>
  mean()

minimum = min(limit_balances)
first_quantile = quantile(limit_balances, 0.25)
median_point = quantile(limit_balances, 0.50)
third_quantile = quantile(limit_balances, 0.75)
maximum = max(limit_balances)

ggplot(credit_default_data, aes(x="", y=limit_balances)) +
  geom_boxplot(fill="lightblue", color="black") +
  labs(title="Credit Limit Five Number Summary", x="", y="Credit Limit") +
  theme_minimal()

# Credit Utilization Patterns

credit_spending = credit_default_data %>%
  select(LIMIT_BAL, BILL_AMT1) %>%
  mutate(across(everything(), as.numeric)) %>%
  mutate(`Credit Utilization` = BILL_AMT1) %>%
  ungroup()
credit_spending = credit_spending %>%
  mutate(`Percentage Utilized`= round((`Credit Utilization`/LIMIT_BAL)*100,2))


ggplot(credit_spending, aes(x = `Percentage Utilized`)) +
  geom_histogram(aes(y=..density..),binwidth = 5, # Adjust binwidth based on your data's distribution and scale
                 fill = "steelblue", color = "black") +
  xlim(0, 200)+
  labs(title = "Distribution of Credit Utilization",
       x = "Credit Utilization (%)",
       y = "# of Customers") +
  theme_minimal() 

age_range = range()
mean(as.numeric(credit_default_data$AGE))
