ALTER PROCEDURE insertPresentation
(
@Speaker nvarchar(75),
@Presentation nvarchar(75)
)
AS
BEGIN TRY
	INSERT INTO PresenterPresentation (presentationSpeaker, presentationTitle) VALUES (@Speaker, @Presentation);
END TRY
BEGIN CATCH
	PRINT N'AN ERROR OCCURRED WITH PROCEDURE insertPresentation. COULD NOT INSERT DATA';
END CATCH;
GO


DELETE FROM PresenterPresentation
go
Execute insertPresentation 'Speaker1', 'Presentation1'
go
Execute insertPresentation 'Speaker1', 'Presentation2'
GO

SELECT * FROM PresenterPresentation

GO

-----------------------------------------------------------------

CREATE PROCEDURE selectPresPerTrack
(
@Event INT,
@Level INT
)
AS
BEGIN TRY
  SELECT * FROM Class INNER JOIN Location ON @Event = Location.locationId AND Class.trackId = @Level;
END TRY
BEGIN CATCH
	PRINT N'AN ERROR OCCURRED WITH PROCEDURE selectPresentation. COULD NOT SELECT DATA';
END CATCH;
GO

-- The first parameter 16 is for the locationId of Budapest (see Location table)
-- The second parameter 1 is the trackId for a certain track, there are 6 tracks total (see Track table)

EXEC selectPresPerTrack 16, 1