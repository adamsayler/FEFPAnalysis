/*
FTE totals for each district by calculation period for
- Unweighted FTE
- Family Empowerment Scholarship FTE
- Nonvirtual FTE
*/

CREATE VIEW [analytic].[vwFteByDistrict] AS
SELECT [DistrictId]
      ,[FiscalYear]
      ,[CalculationPeriod]
      ,[FteType]
      ,SUM([Fte]) AS Fte
  FROM [FEFPAnalysis].[stage].[UnweightedFteByFteTypeProgram]
  GROUP BY
        [DistrictId]
       ,[FiscalYear]
       ,[CalculationPeriod]
       ,[FteType];