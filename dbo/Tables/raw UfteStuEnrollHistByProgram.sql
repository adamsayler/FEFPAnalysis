CREATE TABLE [dbo].[raw UfteStuEnrollHistByProgram] (
    [DistrictId]        BIGINT         NULL,
    [Program]           BIGINT         NULL,
    [Fte]               FLOAT (53)     NULL,
    [FiscalYear]        NVARCHAR (MAX) NULL,
    [CalculationPeriod] NVARCHAR (MAX) NULL,
    [SourceFile]        NVARCHAR (MAX) NULL,
    [SourceUrl]         NVARCHAR (MAX) NULL,
    [FteType]           NVARCHAR (MAX) NULL
);


GO

