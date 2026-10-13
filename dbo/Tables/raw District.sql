CREATE TABLE [dbo].[raw District] (
    [DistrictId]    BIGINT         NULL,
    [District]      NVARCHAR (MAX) NULL,
    [StreetAddress] NVARCHAR (MAX) NULL,
    [City]          NVARCHAR (MAX) NULL,
    [State]         NVARCHAR (MAX) NULL,
    [Zip]           NVARCHAR (MAX) NULL,
    [Url]           NVARCHAR (MAX) NULL,
    [Lat]           FLOAT (53)     NULL,
    [Long]          FLOAT (53)     NULL,
    [Consortia]     NVARCHAR (MAX) NULL,
    [ConsortiaSort] BIGINT         NULL
);


GO

