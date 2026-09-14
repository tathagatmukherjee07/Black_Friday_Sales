#CAPSTONE PROJECT

CREATE SCHEMA IF NOT EXISTS black_friday_project;
USE black_friday_project;

CREATE TABLE black_friday_data (
    User_ID                     BIGINT          NOT NULL,
    Product_ID                  VARCHAR(20)     NOT NULL,
    Gender                      CHAR(1)         NOT NULL,
    Age                         VARCHAR(10)     NOT NULL,
    Occupation                  INT             NOT NULL,
    City_Category                CHAR(1)         NOT NULL,
    Stay_In_Current_City_Years  VARCHAR(5)      NOT NULL,
    Marital_Status              TINYINT         NOT NULL,
    Product_Category_1          INT             NOT NULL,
    Product_Category_2          INT             NULL,
    Product_Category_3          INT             NULL,
    Purchase                    INT             NOT NULL,
    PRIMARY KEY (User_ID, Product_ID),
    CONSTRAINT chk_purchase_positive CHECK (Purchase > 0),
    CONSTRAINT chk_gender CHECK (Gender IN ('F', 'M')),
    CONSTRAINT chk_marital_status CHECK (Marital_Status IN (0, 1)),
    CONSTRAINT chk_city_category CHECK (City_Category IN ('A', 'B', 'C'))
);

SELECT * FROM black_friday_data;


CREATE VIEW customer_info AS
SELECT DISTINCT
    User_ID,
    Gender,
    Age,
    Occupation,
    City_Category,
    Stay_In_Current_City_Years,
    Marital_Status
FROM black_friday_data;

CREATE VIEW product_info AS
SELECT DISTINCT
    Product_ID,
    Product_Category_1,
    Product_Category_2,
    Product_Category_3
FROM black_friday_data;

CREATE VIEW transaction_data AS
SELECT
    User_ID,
    Product_ID,
    Purchase
FROM black_friday_data;


SHOW TABLES;


CREATE VIEW customer_info AS
SELECT DISTINCT
    User_ID,
    Gender,
    Age,
    Occupation,
    City_Category,
    Stay_In_Current_City_Years,
    Marital_Status
FROM black_friday_data;


CREATE VIEW product_info AS
SELECT DISTINCT
    Product_ID,
    Product_Category_1,
    Product_Category_2,
    Product_Category_3
FROM black_friday_data;

SHOW TABLES;

TRUNCATE TABLE black_friday_data;


SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Try 1 Clean Black Friday Data.csv'
INTO TABLE black_friday_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(User_ID, Product_ID, Gender, Age, Occupation, City_Category, Stay_In_Current_City_Years,
 Marital_Status, Product_Category_1, @pc2, @pc3, Purchase)
SET
  Product_Category_2 = NULLIF(@pc2, ''),
  Product_Category_3 = NULLIF(@pc3, '');
  
  SELECT COUNT(*) FROM black_friday_data;
  
  SELECT COUNT(*) AS total_transactions FROM black_friday_data;
SELECT COUNT(DISTINCT User_ID) AS distinct_customers FROM black_friday_data;
SELECT COUNT(DISTINCT Product_ID) AS distinct_products FROM black_friday_data;
