CREATE TABLE [dbo].[Medical_Records] (
    [record_id]  INT            IDENTITY (1, 1) NOT NULL,
    [visit_date] DATE           NOT NULL,
    [diagnosis]  TEXT           NULL,
    [weight_kg]  DECIMAL (5, 2) NOT NULL,
    [notes]      TEXT           NULL,
    [created_at] DATETIME2 (0)  CONSTRAINT [DF_Medical_Records_created_at] DEFAULT (getdate()) NOT NULL,
    [pet_id]     INT            NOT NULL,
    [staff_id]   INT            NOT NULL,
    CONSTRAINT [PK_Medical_Records] PRIMARY KEY CLUSTERED ([record_id] ASC),
    CONSTRAINT [CK_Medical_Records_visitdate] CHECK ([visit_date]<=getdate()),
    CONSTRAINT [CK_Medical_Records_Weight] CHECK ([weight_kg]>(0)),
    CONSTRAINT [FK_Medical_Records_Pets] FOREIGN KEY ([pet_id]) REFERENCES [dbo].[Pets] ([pet_id]),
    CONSTRAINT [FK_Medical_Records_Staff] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[Staff] ([staff_id])
);


GO

