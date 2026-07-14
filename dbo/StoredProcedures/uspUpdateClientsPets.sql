CREATE PROC uspUpdateClientsPets
    @ClientID INT,
    @Fname VARCHAR(50) = NULL,
    @Lname VARCHAR(50) = NULL,
    @Email VARCHAR(50) = NULL,
    @Phone CHAR(11) = NULL,
    @Address VARCHAR(MAX) = NULL,
    @Registered DATETIME = NULL,
    @PetID INT = NULL,
    @PetName VARCHAR(50) = NULL,
    @PetSpecies VARCHAR(50) = NULL,
    @PetBreed VARCHAR(50) = NULL,
    @PetGender CHAR(1) = NULL,
    @PetDOB DATE = NULL,
    @IsActive BIT = NULL

 AS
 BEGIN 
    SET NOCOUNT ON;

     IF @Phone IS NOT NULL AND LEFT((@Phone), 1) = '0'
        BEGIN 
            SET @Phone = SUBSTRING(@Phone, 2, LEN(@Phone)); 
        END

    IF NOT EXISTS (SELECT client_id FROM Clients WHERE client_id = @ClientID)
    BEGIN
       RAISERROR('Client does not exist, or The specified Pet does not belong to this Client, or Client or Pet does not exist.', 16, 1);
        RETURN;
    END

    IF @PetID IS NOT NULL 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM Pets WHERE pet_id = @PetID AND client_id = @ClientID )
        BEGIN
            RAISERROR('Client does not exist, or The specified Pet does not belong to this Client, or Client or Pet does not exist.', 16, 1);
            RETURN;
        END
    END
    
    BEGIN TRY
        BEGIN TRANSACTION

            UPDATE Clients
            SET first_name = ISNULL(@Fname, first_name),
                last_name = ISNULL(@Lname, last_name),
                email = ISNULL(@Email, email),
                phone_number = ISNULL(@Phone, phone_number),
                [address] = ISNULL(@Address, [address]),
                registered_at = ISNULL(@Registered, registered_at)
            WHERE client_id = @ClientID;

            IF @PetID IS NOT NULL
            BEGIN
                UPDATE Pets
                SET [name] = ISNULL(@PetName, [name]),
                    species = ISNULL(@PetSpecies, species),
                    breed = ISNULL(@PetBreed, breed),
                    sex = ISNULL(@PetGender, sex),
                    birthdate = ISNULL(@PetDOB, birthdate),
                    is_active = ISNULL(@IsActive, is_active)
                WHERE pet_id = @PetID;
            END 

            COMMIT TRANSACTION
            PRINT ('Records updated successfully.');

        END TRY

        BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            PRINT(ERROR_MESSAGE());
        END CATCH
 END

GO

