CREATE TABLE [dbo].[raw FesFteByProgram] (
    [SourceUrl]         NVARCHAR (MAX) NULL,
    [TableTitlePage]    NVARCHAR (MAX) NULL,
    [DistrictId]        BIGINT         NULL,
    [FiscalYear]        NVARCHAR (MAX) NULL,
    [CalculationPeriod] NVARCHAR (MAX) NULL,
    [FteType]           NVARCHAR (MAX) NULL,
    [Program]           BIGINT         NULL,
    [Fte]               FLOAT (53)     NULL
);


GO

