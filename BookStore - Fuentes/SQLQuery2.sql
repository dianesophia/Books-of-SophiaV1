CREATE TABLE [dbo].[BookCart] (
    [isbn]   NCHAR (50)      NOT NULL,
    [title]  NCHAR (50)      NULL,
    [author] NCHAR (50)      NULL,
    [genre]  NCHAR (50)      NULL,
    [i_type] NCHAR (50)      NULL,
    [q]    INT             NULL,
    [price]  DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([isbn] ASC)
);


