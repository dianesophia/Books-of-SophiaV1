CREATE TABLE [dbo].[CustomerCart] (
    [isbn]     VARCHAR (50)    NOT NULL,
    [Title]    VARCHAR (100)   NULL,
    [Author]   VARCHAR (100)   NULL,
    [Genre]    VARCHAR (50)    NULL,
    [Type]     VARCHAR (50)    NULL,
    [Quantity] INT             NULL,
    [Price]    DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([isbn] ASC)
);
