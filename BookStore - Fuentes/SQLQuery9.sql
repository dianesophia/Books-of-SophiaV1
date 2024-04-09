delete from ordList

ALTER TABLE [dbo].[BookCart]
ADD CONSTRAINT CHK_BookCart_qty_gt_zero CHECK (qty > 0);

ALTER TABLE [dbo].[Items]
ADD CONSTRAINT CHK_Items_qty_gt_zero CHECK (qty >= 0);

UPDATE [dbo].[Items]
SET qty = 0
WHERE qty < 0;

ALTER TABLE [dbo].[Items]
ADD CONSTRAINT CHK_Items_qty_gt_zero CHECK (qty >= 0);

SELECT *
FROM [dbo].[Items]
WHERE qty < 0;

CREATE TABLE [dbo].[orderList] (
    [c_name]   NVARCHAR (50) NOT NULL,
    [b_title]  NVARCHAR (50) NOT NULL,
    [Quantity] INT           NOT NULL
);

CREATE TABLE [dbo].[TransHistory] (
    [orderDate]    NVARCHAR (50)   NULL,
    [c_name]       NVARCHAR (50)   NULL,
    [numBook]      INT             NULL,
    [totalPrice]   DECIMAL (10, 2) NULL,
    [Shipping_add] NVARCHAR (50)   NULL
);

