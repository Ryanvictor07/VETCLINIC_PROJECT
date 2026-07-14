CREATE TABLE [dbo].[Medications] (
    [medication_id]   INT           IDENTITY (1, 1) NOT NULL,
    [drug_name]       VARCHAR (100) NOT NULL,
    [standard_dosage] VARCHAR (100) NOT NULL,
    [unit]            VARCHAR (50)  NOT NULL,
    [description]     TEXT          NULL,
    CONSTRAINT [PK_Medications] PRIMARY KEY CLUSTERED ([medication_id] ASC),
    CONSTRAINT [CK_Medications_unit] CHECK ([unit]='capsule' OR [unit]='tablet' OR [unit]='ml' OR [unit]='mg'),
    CONSTRAINT [UK_Medications_drugname] UNIQUE NONCLUSTERED ([drug_name] ASC)
);


GO

