USE FEFPAnalysis
GO

SELECT TOP(100)
  *
FROM [dbo].[CoFteByGrade];


SELECT 
    [DistrictId]
  , [FiscalYear]
  , [GradeLevel]
  , [Fte]
  , ROUND(SUM([Fte]) OVER (
        PARTITION BY [FiscalYear], [DistrictId]
    ), 2) AS [TotalFteByFiscalYearByDistrict]
  , ROUND(SUM([Fte]) OVER (
        PARTITION BY [FiscalYear], [GradeLevel]
    ), 2) AS [TotalFteByFiscalYearByGradeLevel]
FROM [dbo].[CoFteByGrade]
ORDER BY [DistrictId], [FiscalYear], [GradeLevel];

-- EXEC sp_rename 'dbo.stage UnweightedFteByFteTypeProgram', 'UnweightedFteByFteTypeProgram';
-- ALTER SCHEMA [stage] TRANSFER [raw].[CcdDirectoryDistricts];