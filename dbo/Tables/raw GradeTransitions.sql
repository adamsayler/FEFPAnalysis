CREATE TABLE [dbo].[raw GradeTransitions] (
    [DistrictId]       BIGINT         NULL,
    [SourceYear]       BIGINT         NULL,
    [SourceGrade]      BIGINT         NULL,
    [SourceGradeLevel] NVARCHAR (MAX) NULL,
    [SourceEnrollment] FLOAT (53)     NULL,
    [TargetYear]       BIGINT         NULL,
    [TargetGrade]      BIGINT         NULL,
    [TargetGradeLevel] NVARCHAR (MAX) NULL,
    [TargetEnrollment] FLOAT (53)     NULL,
    [TransitionRatio]  FLOAT (53)     NULL
);


GO

