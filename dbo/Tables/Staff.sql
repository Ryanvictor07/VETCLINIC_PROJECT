CREATE TABLE [dbo].[Staff] (
    [staff_id]       INT          IDENTITY (1, 1) NOT NULL,
    [first_name]     VARCHAR (50) NOT NULL,
    [last_name]      VARCHAR (50) NOT NULL,
    [role]           VARCHAR (50) NOT NULL,
    [email]          VARCHAR (50) NOT NULL,
    [phone]          CHAR (11)    NOT NULL,
    [license_number] VARCHAR (50) NULL,
    [is_active]      BIT          CONSTRAINT [DF_Staff_is_active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED ([staff_id] ASC),
    CONSTRAINT [UK_Staff_Phone] UNIQUE NONCLUSTERED ([phone] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UK_Staff_Email]
    ON [dbo].[Staff]([email] ASC);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UK_Staff_LicenseNumber]
    ON [dbo].[Staff]([license_number] ASC);


GO

