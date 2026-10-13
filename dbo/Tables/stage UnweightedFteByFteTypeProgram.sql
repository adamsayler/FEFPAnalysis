CREATE TABLE [dbo].[stage UnweightedFteByFteTypeProgram] (
    [DistrictId]        BIGINT         NULL,
    [FiscalYear]        NVARCHAR (MAX) NULL,
    [CalculationPeriod] NVARCHAR (MAX) NULL,
    [SourceUrl]         NVARCHAR (MAX) NULL,
    [TableTitlePage]    NVARCHAR (MAX) NULL,
    [Program]           BIGINT         NULL,
    [FteType]           NVARCHAR (MAX) NULL,
    [Fte]               FLOAT (53)     NULL
);


GO

