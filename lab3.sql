use shoeInfo
GO
DROP PROC proc1
DROP PROC proc2
DROP PROC proc3
DROP PROC proc4
DROP PROC proc5
DROP PROC reverse1
DROP PROC reverse2
DROP PROC reverse3
DROP PROC reverse4
DROP PROC reverse5

CREATE PROC proc1
AS
	BEGIN
		ALTER TABLE retailers
		ALTER COLUMN country nvarchar(30) 
		PRINT 'Table successfully modified'
	END
GO

CREATE PROC reverse1
AS
	BEGIN
		ALTER TABLE retailers
		ALTER COLUMN country varchar(50) 
		PRINT 'Table modification successfully reverted'
	END
GO

CREATE PROC proc2
AS
	BEGIN
		ALTER TABLE shoes
		ADD CONSTRAINT df_Size DEFAULT 10 FOR size
		PRINT 'Constraint added successfully!'
	END
GO

CREATE PROC reverse2
AS
	BEGIN
		ALTER TABLE shoes
		DROP CONSTRAINT df_Size
		PRINT 'Constraint removed successfully'
	END
GO


CREATE PROC proc3
AS
	BEGIN
		CREATE TABLE Stars
		(StarId int PRIMARY KEY,
		StarName varchar(50) not null)
		PRINT 'Table created succesfully!'
	END
GO

CREATE PROC reverse3
AS
	BEGIN	
		DROP TABLE Stars
		PRINT 'Table removed succesfully'
	END
GO


CREATE PROC proc4
AS
	BEGIN
		ALTER TABLE athletes
		ADD ppg int
		PRINT 'Column added succesfully!'
	END
GO

CREATE PROC reverse4
AS
	BEGIN
		ALTER TABLE athletes
		DROP COLUMN ppg
		PRINT 'Column removed succesfully'
	END
GO

CREATE PROC proc5
AS
	BEGIN 
		ALTER TABLE shoeType
		ADD CONSTRAINT FK_shoeType_atid FOREIGN KEY (atid) REFERENCES athletes(atid)
		PRINT 'Constraint added successfully!'
	END
GO

CREATE PROC reverse5
AS
	BEGIN
		ALTER TABLE shoeType
		DROP CONSTRAINT FK_shoeType_atid
		PRINT 'Constraint dropped succesfully'
	END
GO
use shoeInfo
GO
CREATE PROC main
(
	@input nvarchar(50)
)
AS
BEGIN
	DECLARE @CurrentVer int;
	DECLARE @version int;
	DECLARE @string nvarchar(10);

	SELECT TOP 1 @CurrentVer=VarId
	FROM VER

		BEGIN
			IF ISNUMERIC(@input + '.0e0') = 0
				PRINT 'Please enter a natural number';
			ELSE
				BEGIN 
				SET @version = CONVERT(int,@input);
				IF @version > 5 OR @version < 0 
					PRINT 'Please enter a number between 0 and 5';
				ELSE
					BEGIN
						IF @CurrentVer < @version  
							BEGIN
							SET @CurrentVer = @CurrentVer+1;
							WHILE @CurrentVer <= @version
								BEGIN
								SET @string = 'proc' + CONVERT(nvarchar(50),@CurrentVer);
								PRINT @string 
								EXEC @string
								SET @CurrentVer = @CurrentVer+1;	
								END
							END
						ELSE
							BEGIN
							WHILE @CurrentVer != @version
								BEGIN
								SET @string = 'reverse' + CONVERT(nvarchar(50),@CurrentVer);
								PRINT @string
								EXEC @string
								SET @CurrentVer = @CurrentVer-1;	
								END
							END

						UPDATE VER
						SET VarId = @version;
						
					END
				END
			END
END
GO

DROP PROC main

EXEC main 0
EXEC main 1
EXEC main 2
EXEC main 3
EXEC main 4
EXEC main 5


