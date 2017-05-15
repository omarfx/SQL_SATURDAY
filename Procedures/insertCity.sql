CREATE PROC insertCity
  AS
  BEGIN
    BEGIN TRY
  INSERT INTO City VALUES (	 'Woodland Hills');
 INSERT INTO City VALUES (	 'Yakima' );
 INSERT INTO City VALUES (	 'New York City');
 INSERT INTO City VALUES (	 'Philadelphia');
 INSERT INTO City VALUES (	 'Budapest');
 INSERT INTO City VALUES (	 'Bogota');
 INSERT INTO City VALUES (	 'Kyiv');
    END TRY
    BEGIN CATCH
    END CATCH
  END
GO
