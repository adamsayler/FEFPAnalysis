CREATE TABLE [dbo].[CoFteByGrade] (
    [DistrictId] BIGINT         NULL,
    [SourceUrl]  NVARCHAR (MAX) NULL,
    [SourceFile] NVARCHAR (MAX) NULL,
    [FiscalYear] NVARCHAR (MAX) NULL,
    [FteType]    NVARCHAR (MAX) NULL,
    [GradeLevel] BIGINT         NULL,
    [Fte]        FLOAT (53)     NULL
);


GO

