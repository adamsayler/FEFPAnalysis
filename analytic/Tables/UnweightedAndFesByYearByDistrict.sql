CREATE TABLE [analytic].[UnweightedAndFesByYearByDistrict] (
    [FiscalYear]                NVARCHAR (MAX) NULL,
    [District]                  NVARCHAR (MAX) NULL,
    [UnweightedFte]             FLOAT (53)     NULL,
    [FesUnweightedFte]          FLOAT (53)     NULL,
    [Enrollment]                FLOAT (53)     NULL,
    [TotalFundPerUnweightedFte] FLOAT (53)     NULL,
    [TotalFunding]              FLOAT (53)     NULL,
    [FesFunding]                FLOAT (53)     NULL,
    [FundingLessFes]            FLOAT (53)     NULL
);


GO

