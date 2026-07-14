CREATE TABLE [dbo].[Appointments] (
    [appointment_id]   INT          IDENTITY (1, 1) NOT NULL,
    [appointment_date] DATE         NOT NULL,
    [appointment_time] TIME (0)     NOT NULL,
    [reason]           TEXT         NOT NULL,
    [status]           VARCHAR (50) CONSTRAINT [DF_Appointments_status] DEFAULT ('Scheduled') NOT NULL,
    [client_id]        INT          NOT NULL,
    [pet_id]           INT          NOT NULL,
    [staff_id]         INT          NOT NULL,
    CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED ([appointment_id] ASC),
    CONSTRAINT [CK_Appointments_status] CHECK ([status]='Cancelled' OR [status]='Completed' OR [status]='Scheduled'),
    CONSTRAINT [FK_Appointments_Clients] FOREIGN KEY ([client_id]) REFERENCES [dbo].[Clients] ([client_id]),
    CONSTRAINT [FK_Appointments_Pets] FOREIGN KEY ([pet_id]) REFERENCES [dbo].[Pets] ([pet_id]),
    CONSTRAINT [FK_Appointments_Staff] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[Staff] ([staff_id])
);


GO

