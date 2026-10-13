/*
FTE totals for each district by calculation period for:
- Unweighted FTE
- Family Empowerment Scholarship FTE
- Nonvirtual FTE
*/

DROP VIEW IF EXISTS [analytic].[vwFteByDistrict];
GO

CREATE VIEW [analytic].[vwFteByDistrict] AS

SELECT
    [DistrictId],
    [FiscalYear],
    [CalculationPeriod],
    [FteType],
    ROUND(SUM([Fte]), 2) AS [Fte]

FROM [FEFPAnalysis].[stage].[UnweightedFteByFteTypeProgram]

GROUP BY
    [DistrictId],
    [FiscalYear],
    [CalculationPeriod],
    [FteType];
GO