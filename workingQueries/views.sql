/* 
USE [FEFPAnalysis];
GO
 */

 


/*
View: [FEFPAnalysis].[analytics].[vwFteByDistrict]

Creates view with wide columns containing district total amounts for
each fiscal year and each calculation period where available.
*/

/*
DROP VIEW IF EXISTS [analytics].[vwFteDistFyCalcPeriod];
GO

CREATE VIEW [analytics].[vwFteDistFyCp] AS
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
    GROUP BY [DistrictId], [FiscalYear], [CalculationPeriod];

GO
*/


/*
View: [FEFPAnalysis].[analytics].[FteDistFyCpTotal]

Creates view with wide columns contain district fte totals for each fiscal year with 
columns for each fte type (Unweighted FTE, FES Unweighted FTE, and Nonvirtual Unweighted FTE)
for each calculation period
*/


/* 
DROP VIEW IF EXISTS [analytics].[FteDistFyCpTotal];
GO

CREATE VIEW [analytics].[vwFteDistFyCpTotal] AS

SELECT
    [DistrictId],
    [FiscalYear],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Second Calculation'
            THEN [UnweightedFte]
        END
    ) AS [UnweightedFteSecond],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Third Calculation'
            THEN [UnweightedFte]
        END
    ) AS [UnweightedFteThird],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Final Calculation'
            THEN [UnweightedFte]
        END
    ) AS [UnweightedFteFinal],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Second Calculation'
            THEN [FesUnweightedFte]
        END
    ) AS [FesUfteSecond],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Third Calculation'
            THEN [FesUnweightedFte]
        END
    ) AS [FesUfteThird],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Final Calculation'
            THEN [FesUnweightedFte]
        END
    ) AS [FesUfteFinal],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Second Calculation'
            THEN [NonvirtualUnweightedFte]
        END
    ) AS [NonvirtualUfteSecond],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Third Calculation'
            THEN [NonvirtualUnweightedFte]
        END
    ) AS [NonvirtualUfteThird],

    SUM(
        CASE
            WHEN [CalculationPeriod] = 'Final Calculation'
            THEN [NonvirtualUnweightedFte]
        END
    ) AS [NonvirtualUfteFinal]

FROM [analytics].[vwFteDistFyCp]

GROUP BY
    [DistrictId],
    [FiscalYear];
GO

 */

/*
View: [FEFPAnalysis].[analytics].[vwFteDistFyCpCompare]

Compares the totals between column amounts from [analytics].[FteDistFyCpTotal]
*/


SELECT *
FROM [analytics].[vwFteDistFyCpTotal];

WITH UnweightedFteDifferences AS (
SELECT
    [DistrictId],
    [FiscalYear],

    ROUND([UnweightedFteThird] - [UnweightedFteSecond], 2)
        AS [UnweightedFteDifSecondToThird],

    ROUND([UnweightedFteFinal] - [UnweightedFteSecond], 2)
        AS [UnweightedFteDifSecondToFinal],

    ROUND([UnweightedFteFinal] - [UnweightedFteThird], 2)
        AS [UnweightedFteDifThirdToFinal],

    ROUND([FesUfteThird] - [FesUfteSecond], 2)
        AS [FesUfteDifSecondToThird],

    ROUND([FesUfteFinal] - [FesUfteSecond], 2)
        AS [FesUfteDifSecondToFinal],

    ROUND([FesUfteFinal] - [FesUfteThird], 2)
        AS [FesUfteDifThirdToFinal],

    ROUND([NonvirtualUfteThird] - [NonvirtualUfteSecond], 2)
        AS [NonvirtualUfteDifSecondToThird],

    ROUND([NonvirtualUfteFinal] - [NonvirtualUfteSecond], 2)
        AS [NonvirtualUfteDifSecondToFinal],

    ROUND([NonvirtualUfteFinal] - [NonvirtualUfteThird], 2)
        AS [NonvirtualUfteDifThirdToFinal]

FROM [analytics].[vwFteDistFyCpTotal]
),
UnweightedFtePercentChange AS (
    SELECT
     ud.[DistrictId],
     ud.[FiscalYear],
     ROUND((ud.[UnweightedFteDifSecondToThird] / dt.[UnweightedFteSecond] ), 6) AS [UfteSecondToThirdPercentChange]
    FROM UnweightedFteDifferences ud
    JOIN [analytics].[vwFteDistFyCpTotal] dt
        ON ud.[DistrictId] = dt.[DistrictId]
        AND ud.[FiscalYear] = dt.[FiscalYear]
)


SELECT 
    *

FROM UnweightedFtePercentChange
;


-- SELECT * FROM [analytics].[vwFteByDistrict];
-- SELECT * FROM [analytics].[vwFteDistrictFyCalcPeriod];
--[NonvirtualUnweightedFte]