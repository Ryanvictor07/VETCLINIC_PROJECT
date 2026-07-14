CREATE TABLE [dbo].[Vaccination_Schedule] (
    [schedule_id]   INT          IDENTITY (1, 1) NOT NULL,
    [vaccine_name]  VARCHAR (50) NOT NULL,
    [last_given]    DATE         NOT NULL,
    [next_due]      DATE         NOT NULL,
    [reminder_sent] BIT          CONSTRAINT [DF_Vaccination_Schedule_reminder_sent] DEFAULT ((0)) NOT NULL,
    [pet_id]        INT          NOT NULL,
    [record_id]     INT          NOT NULL,
    CONSTRAINT [PK_Vaccination_Schedule] PRIMARY KEY CLUSTERED ([schedule_id] ASC),
    CONSTRAINT [CK_Vaccination_Schedule_NextDue] CHECK ([next_due]>[last_given]),
    CONSTRAINT [FK_Vaccination_Schedule_Medical_Records] FOREIGN KEY ([record_id]) REFERENCES [dbo].[Medical_Records] ([record_id]),
    CONSTRAINT [FK_Vaccination_Schedule_Pets] FOREIGN KEY ([pet_id]) REFERENCES [dbo].[Pets] ([pet_id])
);


GO

