CREATE PROC insertClassDifficulty
  AS
  BEGIN
    BEGIN TRY
      INSERT INTO ClassDifficulty VALUES ('Beginner');
      INSERT INTO ClassDifficulty VALUES ('Intermediate');
      INSERT INTO ClassDifficulty VALUES ('Advanced');
      INSERT INTO ClassDifficulty VALUES ('Non_Technical');
    END TRY
    BEGIN CATCH
    END CATCH
  END


