CREATE TABLE [raw].[BirthCountKindergartenEnrollment] (
    [DistrictId]                BIGINT         NULL,
    [YearEnrolled]              BIGINT         NULL,
    [FiscalYear]                NVARCHAR (MAX) NULL,
    [BirthYear]                 BIGINT         NULL,
    [BirthYearLag5]             BIGINT         NULL,
    [BirthCount]                BIGINT         NULL,
    [Enrollment]                BIGINT         NULL,
    [EnrollmentPctBirth]        FLOAT (53)     NULL,
    [Avg3Yr_BirthCount]         BIGINT         NULL,
    [Avg3Yr_Enrollment]         BIGINT         NULL,
    [Avg3Yr_EnrollmentPctBirth] FLOAT (53)     NULL
);


GO

