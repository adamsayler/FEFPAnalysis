CREATE TABLE [dbo].[raw NonvirtualUfteByProgram] (
    [DistrictId]        BIGINT         NULL,
    [FiscalYear]        NVARCHAR (MAX) NULL,
    [CalculationPeriod] NVARCHAR (MAX) NULL,
    [SourceUrl]         NVARCHAR (MAX) NULL,
    [TableTitlePage]    NVARCHAR (MAX) NULL,
    [Program]           BIGINT         NULL,
    [Fte]               FLOAT (53)     NULL,
    [FteType]           NVARCHAR (MAX) NULL
);


GO

