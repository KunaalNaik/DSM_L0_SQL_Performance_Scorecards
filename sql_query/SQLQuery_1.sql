-- Sample Code to select Required Columns
select top 10
    Row_ID
    , Order_ID
    , Order_Date
    -- Summarise by
    , YEAR(Order_Date) as Order_Year
    , MONTH(Order_Date) as Order_Month
    , Region
    , Category
    , Sub_Category
    -- Summary of
    , Sales
    , Quantity
    , Profit
    , Discount
from L1_SuperStore.dbo.superstore_data;

-- Code Used to Extract Data for creating Scorecards
select 
    -- Summarise by
      YEAR(Order_Date) as Order_Year
    , MONTH(Order_Date) as Order_Month
    , Region
    , Category
    , Sub_Category

    -- Summary of
    , sum(Sales) as Sales
    , sum(Quantity) as Quantity
    , sum(Profit) as Profit
    , sum(Discount) as Discount
from L1_SuperStore.dbo.superstore_data
where YEAR(Order_Date) in (2016, 2017)
group by YEAR(Order_Date) 
        , MONTH(Order_Date) 
        , Region
        , Category
        , Sub_Category 
;