SELECT
  *
FROM [FEFPAnalysis].[analytics].[vwFteByDistrict];

WITH FteDisFyCp AS (
    SELECT
        [DistrictId],
        [FiscalYear],
        [CalculationPeriod],
        SUM(CASE
            WHEN [FteType] = 'Unweighted FTE'
            THEN [Fte]
        END) AS [UnweightedFte],
        SUM(CASE
            WHEN [FteType] = 'Family Empowerment Scholarship Unweighted FTE'
            THEN [Fte]
        END) AS [FesUnweightedFte],
        SUM(CASE
            WHEN [FteType] = 'Nonvirtual Unweighted FTE'
            THEN [Fte]
        END) AS [NonvirtualUnweightedFte]
    FROM [analytics].[vwFteByDistrict]
    GROUP BY [DistrictId], [FiscalYear], [CalculationPeriod]
),
FteCalculationPeriod AS (
    SELECT 
        [DistrictId],
        [FiscalYear],
        SUM(CASE
            WHEN [CalculationPeriod] = 'Second Calculation'
            THEN [UnweightedFte]
        END) AS [UnweightedFteSecondCalc]
    FROM FteDisFyCp
    GROUP BY [DistrictId], [FiscalYear] 
)

SELECT *
FROM FteCalculationPeriod;