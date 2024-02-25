## Data Dictionary for Taiwan Credit Dataset

| Variable Name | Type    | Description                                                                                           | Categories/Scale                                          |
|---------------|---------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|
| ID            | Integer | Unique identifier for each client                                                                     |                                                           |
| LIMIT_BAL     | Integer | Amount of the given credit (NT dollar): includes both individual consumer credit and family credit    |                                                           |
| SEX           | Integer | Gender of the client                                                                                  | 1 = Male; 2 = Female                                      |
| EDUCATION     | Integer | Education level of the client                                                                         | 1 = Graduate School; 2 = University; 3 = High School; 4 = Others |
| MARRIAGE      | Integer | Marital status of the client                                                                          | 1 = Married; 2 = Single; 3 = Others                       |
| AGE           | Integer | Age of the client (years)                                                                             |                                                           |
| PAY_0 to PAY_6| Integer | Repayment status from September 2005 to April 2005 (PAY_0 = September, PAY_2 = August, ..., PAY_6 = April) | -1 = Pay duly; 1 = Payment delay for one month; 2 = Payment delay for two months; ...; 8 = Payment delay for eight months; 9 = Payment delay for nine months and above |
| BILL_AMT1 to BILL_AMT6 | Integer | Amount of bill statement (NT dollar) from September 2005 to April 2005 (BILL_AMT1 = September, ..., BILL_AMT6 = April) | |
| PAY_AMT1 to PAY_AMT6 | Integer | Amount of previous payment (NT dollar) from September 2005 to April 2005 (PAY_AMT1 = September, ..., PAY_AMT6 = April) | |
| DEFAULT       | Integer | Default payment (Yes = 1, No = 0)                                                                     | 0 = No Default; 1 = Default                                |

**Note:**
- **LIMIT_BAL**: Represents the credit limit provided to each client.
- **SEX, EDUCATION, MARRIAGE**: Categorical variables encoded as integers.
- **PAY_0 to PAY_6 (Repayment Status)**: Tracks the history of past payments. The scale extends from -1 (pay duly) to 9 (payment delay for nine months and above).
- **BILL_AMT1 to BILL_AMT6**: Represents the bill amount for each month in NT dollars.
- **PAY_AMT1 to PAY_AMT6**: Represents the amount paid in the previous month in NT dollars.
- **DEFAULT**: Indicates whether the client defaulted on their payment in the next month after the study period.
