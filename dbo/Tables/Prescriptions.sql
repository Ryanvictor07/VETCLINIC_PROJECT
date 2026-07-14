CREATE TABLE [dbo].[Prescriptions] (
    [prescription_id] INT          IDENTITY (1, 1) NOT NULL,
    [dosage_given]    VARCHAR (50) NOT NULL,
    [duration_days]   SMALLINT     NOT NULL,
    [Instructions]    TEXT         NULL,
    [record_id]       INT          NOT NULL,
    [medication_id]   INT          NOT NULL,
    CONSTRAINT [PK_Prescriptions] PRIMARY KEY CLUSTERED ([prescription_id] ASC),
    CONSTRAINT [CK_Prescriptions_DurationDays] CHECK ([duration_days]>(0)),
    CONSTRAINT [FK_Prescriptions_Medical_Records] FOREIGN KEY ([record_id]) REFERENCES [dbo].[Medical_Records] ([record_id]),
    CONSTRAINT [FK_Prescriptions_Medications] FOREIGN KEY ([medication_id]) REFERENCES [dbo].[Medications] ([medication_id])
);


GO

