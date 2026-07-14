CREATE PROC DeleteClientAndPets
    @ClientID INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT client_id FROM Clients WHERE client_id = @ClientID)
    BEGIN
        RAISERROR('Client doesnt exist.', 16, 1);
        RETURN
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Pets 
        WHERE client_id = @ClientID;

        DELETE FROM Clients 
        WHERE client_id = @ClientID;

        COMMIT TRANSACTION;
        PRINT 'Client and associated pets deleted successfully.';
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            PRINT(ERROR_MESSAGE());
    END CATCH
END

GO

