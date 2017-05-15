CREATE PROC insertLocation
  AS
  BEGIN
    BEGIN TRY
 INSERT INTO Location VALUES (	 '	10 Napa Ct.	 ',	 '97355',	 'CA'	,'US',	 '818777777'	,5	);
    END TRY
    BEGIN CATCH
    END CATCH
  END
GO
