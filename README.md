# Introduction

Banks are essential to the financial services industry because they provide their clients with credit and loans. These financial tools are essential for empowering customers financially as well as allowing banks to earn interest and generate additional revenue. However, the granting of credit and loans carries with it an inherent default risk, meaning that borrowers might not fulfil their repayment commitments.

With an emphasis on a Taiwanese credit default dataset, this study aims to tackle the problem of credit risk management, specifically as it relates to credit card facilities. Finding the best effective dimensionality reduction method to use with k-means clustering among Principal Component Analysis (PCA), Autoencoders (AE), and Variational Autoencoders (VAE) is the main goal of our work.

There are two questions in the research. Its initial goal is to determine which dimension reduction method best facilitates the creation of an elementary credit default risk segmentation model. This entails investigating the ways in which a customer's payment history, bill statement amounts, prior payment amounts, and demographic and financial behaviour traits—such as age, gender, education, marital status, and marriage status—can affect the probability of a credit default. The second portion of the study topic deals with the viability of creating a trustworthy default prediction model based on the best customer segmentation model that has been determined after a segmentation model has been established. Support Vector Machines (SVMs) will be utilized in order to build the predictive model.

In order to improve customer segmentation, dimensionality reduction techniques such as PCA, AE, and VAE are being used to extract the key characteristics that affect credit default risk. This segmentation then forms the basis for predictive modelling, which allows for a more sophisticated evaluation of credit default risk.

# Data Dictionary for Taiwan Credit Dataset

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
