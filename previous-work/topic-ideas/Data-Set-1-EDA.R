rm(list=ls())

library(readxl)
library(tidyverse)
library(knitr)
library(ggplot2)
library(dplyr)


file_path = "../Data/Assignment/online_retail_II.xlsx"
online_retail_data = as_tibble(read_excel(file_path))


# Product Analysis

# Explore the number of unique gift-sets and their popularity

# Total count of each item sold

gift_purchase_total_sold = online_retail_data %>% 
  group_by(StockCode) %>%
  summarise(`Total Sold` = sum(Quantity))



top_20_selling_gifts = gift_purchase_total_sold %>%
  arrange(desc(`Total Sold`)) %>%
  head(n = 20)  

invoice_per_wholesaler = online_retail_data %>% 
  group_by(Invoice, `Customer ID`) %>%
  summarise(items_on_invoice = n(), .groups = 'drop')

invoices_without_customerIDs = invoice_per_wholesaler %>%
  filter(is.na(`Customer ID`))

total_customers = unique(online_retail_data$`Customer ID`)


#highest_selling_items_percentage = top_20_selling_gifts$total[1]/count(online_retail_data)*100


# Plot the bar chart
ggplot(top_20_selling_gifts, aes(x = `Total Sold` , y =  reorder(StockCode, `Total Sold`), fill = StockCode)) +
  geom_bar(stat = "identity", fill = "brown") +
  theme_minimal() +
  labs(title = "Top 20 Giftwares Sold", x = "Total Sold", y = "Stock Code") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis labels for readability

top_20_selling_gifts$StockCode[]

top_product_name = online_retail_data %>%
  filter(StockCode == top_20_selling_gifts$StockCode[1]) %>%
  select(Description) %>%
  distinct(Description)

# Customer And Sales Analysis

unique_customers = online_retail_data %>%
  distinct(`Customer ID`)

customer_country_distribution = online_retail_data %>%
  distinct(`Customer ID`, .keep_all = TRUE) %>%
  group_by(Country) %>%
  summarise(`Total Customers` = n()) %>%
  arrange(desc(`Total Customers`)) %>%
  head(n=5)

ggplot(customer_country_distribution, aes(x = `Total Customers` , y =  reorder(`Country`, `Total Customers`), fill = `Country`)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Customer Regions", x = "Total Customers", y = "Country") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis labels for readability                          

customer_stats = online_retail_data %>% 
  group_by(`Customer ID`) %>%
  summarise(
    `Total Invoices` = n_distinct(Invoice),
    `Total Units Purchased` = sum(Quantity),
    `Total Spend` = sum(Quantity * Price),
  ) %>%
  arrange(desc(`Total Spend`)) %>%
  head(n=20)

na_customer_stats = online_retail_data %>% 
  group_by(`Customer ID`) %>%
  summarise(
    `Total Invoices` = n_distinct(Invoice),
    `Total Units Purchased` = sum(Quantity),
    `Total Spend` = sum(Quantity * Price),
  ) %>%
  arrange(desc(`Total Spend`)) %>%
  filter(is.na(`Customer ID`))
# head(n=20)

customer_stats$`Customer ID`[1] = "Unknown"

kable(customer_stats)
top_wholesaler_revenue_contribution = customer_stats$`Total Spend`[1]/sum(customer_stats$`Total Spend`)*100

# Plot the bar chart
ggplot(customer_stats, aes(x = `Total Spend` , y =  reorder(`Customer ID`, `Total Spend`), fill = `Customer ID`)) +
  geom_bar(stat = "identity", fill = "#FF8C00") +
  theme_minimal() +
  labs(title = "Top 20 Revenue Generating Customers", x = "Revenue Generated", y = "Customer Id") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis labels for readability
