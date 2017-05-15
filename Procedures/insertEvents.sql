CREATE PROC insertEvents
  AS
  BEGIN
    BEGIN TRY
    INSERT INTO Event VALUES ( 'SQLSaturday #626 - Budapest 2017'    , '6-May-17', 16);


    END TRY
    BEGIN CATCH
    END CATCH
  END
GO
