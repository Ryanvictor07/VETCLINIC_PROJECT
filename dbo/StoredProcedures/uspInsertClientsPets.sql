CREATE PROC uspInsertClientsPets
    @Fname VARCHAR(50),
    @Lname VARCHAR(50),
    @Email VARCHAR(50),
    @Phone CHAR(11),
    @Address VARCHAR(MAX) = NULL,
    @Registered DATETIME = NULL,
    @PetName VARCHAR(50),
    @PetSpecies VARCHAR(50),
    @PetBreed VARCHAR(50) = NULL,
    @PetGender CHAR(1),
    @PetDOB DATE,
    @IsActive BIT = NULL

 AS
 BEGIN 
    SET NOCOUNT ON;

    IF LEFT((@Phone), 1) = '0'
        BEGIN 
            SET @Phone = SUBSTRING(@Phone, 2, LEN(@Phone));
        END

    SET @IsActive = ISNULL (@IsActive, 1);
    SET @Registered = ISNULL (@Registered, GETDATE());

        BEGIN TRY
            BEGIN TRANSACTION

            INSERT Clients 
            VALUES (@Fname, @Lname, @Email, @Phone, @Address, @Registered);

            DECLARE @OwnerID INT = SCOPE_IDENTITY();

            INSERT Pets 
            VALUES (@PetName, @PetSpecies, @PetBreed, @PetGender, @PetDOB,@IsActive, @OwnerID);

            COMMIT TRANSACTION
            PRINT ('Client and pet records inserted successfully.');
        END TRY

        BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            THROW;
        END CATCH
 END

GO

