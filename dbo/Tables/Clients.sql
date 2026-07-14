CREATE TABLE [dbo].[Clients] (
    [client_id]     INT           IDENTITY (1, 1) NOT NULL,
    [first_name]    VARCHAR (50)  NOT NULL,
    [last_name]     VARCHAR (50)  NOT NULL,
    [email]         VARCHAR (50)  NOT NULL,
    [phone_number]  CHAR (11)     NOT NULL,
    [address]       VARCHAR (MAX) NULL,
    [registered_at] DATETIME2 (0) CONSTRAINT [DF_Clients_registered_at] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED ([client_id] ASC),
    CONSTRAINT [UK_Clients_Phone] UNIQUE NONCLUSTERED ([phone_number] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UK_Clients_Email]
    ON [dbo].[Clients]([email] ASC);


GO

