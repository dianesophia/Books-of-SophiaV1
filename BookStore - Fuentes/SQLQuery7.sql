ALTER TABLE [dbo].[Items]
NOCHECK CONSTRAINT CHK_qty_non_negative;

UPDATE [dbo].[Items]
SET [qty] = 0
WHERE [qty] < 0;

ALTER TABLE [dbo].[Items]
CHECK CONSTRAINT CHK_qty_non_negative;
