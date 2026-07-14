CREATE TABLE [dbo].[Pets] (
    [pet_id]    INT          IDENTITY (1, 1) NOT NULL,
    [name]      VARCHAR (50) NOT NULL,
    [species]   VARCHAR (50) NOT NULL,
    [breed]     VARCHAR (50) NULL,
    [sex]       CHAR (1)     NOT NULL,
    [birthdate] DATE         NOT NULL,
    [Is_active] BIT          CONSTRAINT [DF_Pets_Is_active] DEFAULT ((1)) NOT NULL,
    [client_id] INT          NOT NULL,
    CONSTRAINT [PK_Pets] PRIMARY KEY CLUSTERED ([pet_id] ASC),
    CONSTRAINT [CK_Pets_DateNotFuture] CHECK ([birthdate]<getdate()),
    CONSTRAINT [CK_Pets_IsActive] CHECK ([is_active]=(1) OR [is_active]=(0)),
    CONSTRAINT [CK_Pets_Sex] CHECK ([sex]='F' OR [sex]='M'),
    CONSTRAINT [FK_Pets_Clients] FOREIGN KEY ([client_id]) REFERENCES [dbo].[Clients] ([client_id])
);


GO

