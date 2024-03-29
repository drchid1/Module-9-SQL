# Module-9-SQL-Assignment

## Introduction
The SQL Challenge Assignment is detailed in this README.md file. The assignment is completed in three parts:
1. Data Modelling
2. Data Engineering
3. Data Analysis

### Files
The SQL code used for this assignment is stored in the 'code' folder. The **'Employees Schema.sql'** file contains the code to create and relate the tables with primary and foreign keys. The **'Quries.sql'** file holds the code for the eight questions asked in the data analysis section. The 'data' folder contains the six CSV files used to populate the respective tables. The 'images' folder includes the diagrams and output tables from pgAdmin, which will be referenced in this document.

## Data Modelling
An Entity Relationship Diagram (ERD) was created using the online diagramming tool [Lucid Charts](https://www.lucidchart.com/pages/). The .CSV files from the 'data' folder were used to make the ERD entities, attributes and keys. There are six tables in total in this database.
![Employees ERD](https://github.com/drchid1/Module-9-SQL/assets/157972264/6a70fe9e-6f36-46e5-97fd-4caad298fd93)

## Data Engineering

### Creating tables and their attributes
Six tables were created in an 'Employees' Database to be able to import the source data from the provided CSV files in the 'data' folder. The titles of the CSV files became the names of the tables (entities) in the database, and each of the columns in the CSV file became the attributes of each table. The block below shows the SQL code used to create the tables in PostgreSQL.
https://github.com/drchid1/Module-9-SQL/blob/7a5a67ddfd325c03ab08581d08847ffc625e894e/code/Employees%20Schema.sql#L9-L52

### Data types and Value lengths
Five different data types were used to build the tables.

- ```INTEGER``` These were used for the 'Employment Number', which only consisted of numbers with no decimals.
- ```DATE``` The date type was used to hold the date of birth of each employee and the date in which they were hired to the company. The date format in the CSV file ws 'YYYY-DD-MM'
- ```CHAR``` The CHAR was used to hold the 'Title ID' and the 'Department Number' over VARCHAR was this allows for sonsistent data sizer and can potentially improve perfromance through simplified memoery allocation. The 'Title ID' needed five characters in length as it contained a single letter followed by four numeric digits. The 'Department Number' started with the letter 'd' and had three numberic digits, hence requiring a character length of four.

```mermaid
erDiagram
    
    CUSTOMER {
        string name
        string custNumber
        string sector
    }
    
```

## Data Analysis
