-- Identify null values --
SELECT *
FROM dbo.[2023 Car Dataset]
WHERE Engine_Size_L IS NULL
OR Entertainment_Features IS NULL
OR Interior_Features IS NULL
OR Exterior_Features IS NULL
OR Customer_Ratings IS NULL
OR Sales_Figures_Units_Sold IS NULL
-- Removing null values --

DELETE FROM dbo.[2023 Car Dataset]
WHERE Engine_Size_L IS NULL
OR Entertainment_Features IS NULL
OR Interior_Features IS NULL
OR Exterior_Features IS NULL
OR Customer_Ratings IS NULL
OR Sales_Figures_Units_Sold IS NULL

-- overview of car dataset --
-- top selling car brand by price --
SELECT TOP 1
Car_Make,
SUM(Price) AS total_sales
FROM dbo.[2023 Car Dataset]
GROUP BY Car_Make
ORDER BY total_sales DESC
--top selling car brand by unit sold --
SELECT TOP 1
Car_Make,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[2023 Car Dataset]
GROUP BY Car_Make
ORDER BY unit_sold DESC

-- sales performance analysis --
SELECT TOP 10
Car_Make,
Car_Model,
Year,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[2023 Car Dataset]
GROUP BY 
Car_Make,
Car_Model,
Year
ORDER BY unit_sold DESC

-- Customer preferencese --
SELECT TOP 10
Car_Make,
Car_Model,
Body_Type,
Color_Options,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[2023 Car Dataset]
GROUP BY 
Car_Make,
Car_Model,
Body_Type,
Color_Options
ORDER BY unit_sold DESC

-- Fuel efficiency impact --
SELECT TOP 10
Car_Make,
Car_Model,
Mileage_MPG,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[2023 Car Dataset]
GROUP BY
Car_Make,
Car_Model,
Mileage_MPG
ORDER BY unit_sold DESC

--Price sensitivity --
SELECT TOP 10
Car_Make,
Car_Model,
SUM(Price) AS total_sales,
AVG(TRY_CAST(LEFT(Customer_Ratings , 3) AS FLOAT)) AS avg_rating
FROM dbo.[2023 Car Dataset]
GROUP BY
Car_Make,
Car_Model
ORDER BY
total_sales DESC

--Safety and featuers impact --
SELECT TOP 10
Car_Make,
Car_Model,
SUM(Price) AS total_sales,
AVG(TRY_CAST(LEFT(Customer_Ratings , 3) AS FLOAT)) AS avg_rating,
Safety_Features,
Entertainment_Features
FROM dbo.[2023 Car Dataset]
GROUP BY
Car_Make,
Car_Model,
Safety_Features,
Entertainment_Features
ORDER BY
total_sales DESC

--Market trend analysis --
SELECT TOP 10 
Car_Make,
Car_Model,
Body_Type,
Fuel_Type,
Year,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[2023 Car Dataset]
GROUP BY
Car_Make,
Car_Model,
Body_Type,
Fuel_Type,
Year
ORDER BY 
unit_sold DESC

