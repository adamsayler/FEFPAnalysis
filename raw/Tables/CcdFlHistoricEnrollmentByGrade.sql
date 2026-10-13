CREATE TABLE [raw].[CcdFlHistoricEnrollmentByGrade] (
    [Year]       BIGINT         NULL,
    [LeaId]      BIGINT         NULL,
    [Fips]       FLOAT (53)     NULL,
    [Grade]      FLOAT (53)     NULL,
    [Race]       FLOAT (53)     NULL,
    [Sex]        FLOAT (53)     NULL,
    [Enrollment] NVARCHAR (MAX) NULL,
    [SourceFile] NVARCHAR (MAX) NULL
);


GO

