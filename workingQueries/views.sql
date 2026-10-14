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

SELECT 
    [DistrictId],
    [FiscalYear],
    ROUND([UnweightedFteSecond] - [UnweightedFteThird], 2) AS [FteDifferenceSecondToThird]
FROM [analytics].[vwFteDistFyCpTotal];


-- SELECT * FROM [analytics].[vwFteByDistrict];
-- SELECT * FROM [analytics].[vwFteDistrictFyCalcPeriod];
--[NonvirtualUnweightedFte]