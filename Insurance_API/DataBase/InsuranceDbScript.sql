USE [Insurance]
GO
/****** Object:  Table [dbo].[InsuranceMaster]    Script Date: 19-07-2026 13:29:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceMaster](
	[InsuranceId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNumber] [varchar](20) NOT NULL,
	[PolicyHolderName] [varchar](100) NOT NULL,
	[InsuranceType] [varchar](50) NOT NULL,
	[PremiumAmount] [decimal](18, 2) NOT NULL,
	[CoverageAmount] [decimal](18, 2) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[AgentName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[InsuranceMaster] ON 
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'POL1001', N'Arun Kumar', N'Health Insurance', CAST(20000.00 AS Decimal(18, 2)), CAST(750000.00 AS Decimal(18, 2)), CAST(N'2026-07-01' AS Date), CAST(N'2027-06-30' AS Date), N'Akash', 1, N'sa', CAST(N'2026-07-12T11:37:51.103' AS DateTime), N'sa', CAST(N'2026-07-12T12:18:37.940' AS DateTime))
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'POL1003', N'Priya Sharma', N'Vehicle Insurance', CAST(12000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)), CAST(N'2026-07-15' AS Date), CAST(N'2027-07-14' AS Date), N'Karthik', 1, N'sa', CAST(N'2026-07-12T11:48:09.800' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'POL1004', N'Arun Kumar', N'Life Insurance', CAST(18000.00 AS Decimal(18, 2)), CAST(800000.00 AS Decimal(18, 2)), CAST(N'2026-08-01' AS Date), CAST(N'2036-07-31' AS Date), N'Senthil Kumar', 1, N'sa', CAST(N'2026-07-12T12:41:17.627' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'POL1005', N'Karthikeyan', N'Health Insurance', CAST(15000.00 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), CAST(N'2026-08-05' AS Date), CAST(N'2027-08-04' AS Date), N'Ramesh', 1, N'sa', CAST(N'2026-07-12T12:41:17.663' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'POL1006', N'Suresh Babu', N'Vehicle Insurance', CAST(12000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)), CAST(N'2026-08-10' AS Date), CAST(N'2027-08-09' AS Date), N'Prabhu', 1, N'sa', CAST(N'2026-07-12T12:41:17.663' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'POL1007', N'Vignesh', N'Travel Insurance', CAST(6000.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), CAST(N'2026-08-15' AS Date), CAST(N'2027-08-14' AS Date), N'Murugan', 1, N'sa', CAST(N'2026-07-12T12:41:17.663' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'POL1008', N'Harish Kumar', N'Life Insurance', CAST(22000.00 AS Decimal(18, 2)), CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-08-20' AS Date), CAST(N'2041-08-19' AS Date), N'Gopinath', 1, N'sa', CAST(N'2026-07-12T12:41:17.663' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'POL1009', N'Pradeep', N'Health Insurance', CAST(17000.00 AS Decimal(18, 2)), CAST(600000.00 AS Decimal(18, 2)), CAST(N'2026-08-25' AS Date), CAST(N'2027-08-24' AS Date), N'Rajendran', 1, N'sa', CAST(N'2026-07-12T12:41:17.667' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'POL1010', N'Dinesh Kumar', N'Vehicle Insurance', CAST(11000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), CAST(N'2026-09-01' AS Date), CAST(N'2027-08-31' AS Date), N'Balaji', 1, N'sa', CAST(N'2026-07-12T12:41:17.667' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'POL1011', N'Kavitha', N'Travel Insurance', CAST(7500.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), CAST(N'2026-09-05' AS Date), CAST(N'2027-09-04' AS Date), N'Saravanan', 1, N'sa', CAST(N'2026-07-12T12:41:17.667' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'POL1012', N'Meenakshi', N'Life Insurance', CAST(25000.00 AS Decimal(18, 2)), CAST(1200000.00 AS Decimal(18, 2)), CAST(N'2026-09-10' AS Date), CAST(N'2046-09-09' AS Date), N'Manikandan', 1, N'sa', CAST(N'2026-07-12T12:41:17.667' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, N'POL1013', N'Divya', N'Health Insurance', CAST(14000.00 AS Decimal(18, 2)), CAST(450000.00 AS Decimal(18, 2)), CAST(N'2026-09-15' AS Date), CAST(N'2027-09-14' AS Date), N'Karthik', 1, N'sa', CAST(N'2026-07-12T12:42:51.257' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, N'POL1014', N'Nandhini', N'Vehicle Insurance', CAST(9500.00 AS Decimal(18, 2)), CAST(220000.00 AS Decimal(18, 2)), CAST(N'2026-09-20' AS Date), CAST(N'2027-09-19' AS Date), N'Venkatesh', 1, N'sa', CAST(N'2026-07-12T12:42:51.280' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (23, N'POL1015', N'Revathi', N'Travel Insurance', CAST(5000.00 AS Decimal(18, 2)), CAST(150000.00 AS Decimal(18, 2)), CAST(N'2026-09-25' AS Date), CAST(N'2027-09-24' AS Date), N'valavan', 1, N'sa', CAST(N'2026-07-12T12:42:51.293' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (24, N'POL1020', N'Mahesh', N'Life Insurance', CAST(32000.00 AS Decimal(18, 2)), CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2026-10-20' AS Date), CAST(N'2051-10-19' AS Date), N'Chandrasekar', 1, N'sa', CAST(N'2026-07-12T12:42:51.293' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, N'POL1021', N'Janani', N'Life', CAST(20000.00 AS Decimal(18, 2)), CAST(800000.00 AS Decimal(18, 2)), CAST(N'2026-10-25' AS Date), CAST(N'2027-10-24' AS Date), N'Thangaraj', 1, N'sa', CAST(N'2026-07-12T12:42:51.293' AS DateTime), N'LAPTOP-INKMOE0V\VALAVAN S', CAST(N'2026-07-14T10:30:01.080' AS DateTime))
GO
INSERT [dbo].[InsuranceMaster] ([InsuranceId], [PolicyNumber], [PolicyHolderName], [InsuranceType], [PremiumAmount], [CoverageAmount], [StartDate], [EndDate], [AgentName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (29, N'POL1022', N'Santhosh', N'Vehicle Insurance', CAST(14500.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), CAST(N'2026-11-01' AS Date), CAST(N'2027-10-31' AS Date), N'Ravichandran', 1, N'sa', CAST(N'2026-07-12T13:07:08.870' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[InsuranceMaster] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Insuranc__46DA015785FD6A43]    Script Date: 19-07-2026 13:29:32 ******/
ALTER TABLE [dbo].[InsuranceMaster] ADD UNIQUE NONCLUSTERED 
(
	[PolicyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsuranceMaster_Delete]    Script Date: 19-07-2026 13:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsuranceMaster_Delete]
(
    @InsuranceId INT
)
AS
BEGIN
    --SET NOCOUNT ON;

    DELETE FROM InsuranceMaster
    WHERE InsuranceId = @InsuranceId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsuranceMaster_GetAll]    Script Date: 19-07-2026 13:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsuranceMaster_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        InsuranceId,
        PolicyNumber,
        PolicyHolderName,
        InsuranceType,
        PremiumAmount,
        CoverageAmount,
        StartDate,
        EndDate,
        AgentName,
        IsActive,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    FROM InsuranceMaster
  END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsuranceMaster_GetById]    Script Date: 19-07-2026 13:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsuranceMaster_GetById]
(
    @InsuranceId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        InsuranceId,
        PolicyNumber,
        PolicyHolderName,
        InsuranceType,
        PremiumAmount,
        CoverageAmount,
        StartDate,
        EndDate,
        AgentName,
        IsActive,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    FROM InsuranceMaster
    WHERE InsuranceId = @InsuranceId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsuranceMaster_GetPaged]    Script Date: 19-07-2026 13:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsuranceMaster_GetPaged]
(
    @PolicyNumber VARCHAR(20) = NULL,
    @PolicyHolderName VARCHAR(100) = NULL,
    @InsuranceType VARCHAR(50) = NULL,
    @PageNumber INT = 1,
    @PageSize INT = 10
)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@PageNumber <= 0) SET @PageNumber = 1;

    IF (@PageSize <= 0) SET @PageSize = 10;

    DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;

    SELECT
        InsuranceId,
        PolicyNumber,
        PolicyHolderName,
        InsuranceType,
        PremiumAmount,
        CoverageAmount,
        StartDate,
        EndDate,
        AgentName,
        IsActive,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate,

        COUNT(*) OVER() AS TotalRecords

    FROM InsuranceMaster

    WHERE
        (@PolicyNumber IS NULL OR PolicyNumber LIKE '%' + @PolicyNumber + '%')
        AND (@PolicyHolderName IS NULL OR PolicyHolderName LIKE '%' + @PolicyHolderName + '%')
        AND (@InsuranceType IS NULL OR InsuranceType LIKE '%' + @InsuranceType + '%')

    ORDER BY InsuranceId ASC

    OFFSET @Offset ROWS
    FETCH NEXT @PageSize ROWS ONLY;

    SELECT
        COUNT(1) AS TotalRecords
    FROM InsuranceMaster
    WHERE
        (@PolicyNumber IS NULL OR PolicyNumber LIKE '%' + @PolicyNumber + '%')
        AND (@PolicyHolderName IS NULL OR PolicyHolderName LIKE '%' + @PolicyHolderName + '%')
        AND (@InsuranceType IS NULL OR InsuranceType LIKE '%' + @InsuranceType + '%');
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsuranceMaster_Insert]    Script Date: 19-07-2026 13:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsuranceMaster_Insert]
(
    @PolicyNumber VARCHAR(20),
    @PolicyHolderName VARCHAR(100),
    @InsuranceType VARCHAR(50),
    @PremiumAmount DECIMAL(18,2),
    @CoverageAmount DECIMAL(18,2),
    @StartDate DATETIME,
    @EndDate DATETIME,
    @AgentName VARCHAR(100) = NULL,
    @IsActive BIT = 1
)
AS
BEGIN
    --SET NOCOUNT ON;

    INSERT INTO InsuranceMaster
    (
        PolicyNumber,
        PolicyHolderName,
        InsuranceType,
        PremiumAmount,
        CoverageAmount,
        StartDate,
        EndDate,
        AgentName,
        IsActive,
        CreatedBy
    )
    VALUES
    (
        @PolicyNumber,
        @PolicyHolderName,
        @InsuranceType,
        @PremiumAmount,
        @CoverageAmount,
        @StartDate,
        @EndDate,
        @AgentName,
        @IsActive,
        SYSTEM_USER
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsuranceMaster_Update]    Script Date: 19-07-2026 13:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsuranceMaster_Update]
(
    @InsuranceId INT,
    @PolicyNumber VARCHAR(20),
    @PolicyHolderName VARCHAR(100),
    @InsuranceType VARCHAR(50),
    @PremiumAmount DECIMAL(18,2),
    @CoverageAmount DECIMAL(18,2),
    @StartDate DATE,
    @EndDate DATE,
    @AgentName VARCHAR(100) = NULL,
    @IsActive BIT
)
AS
BEGIN
    --SET NOCOUNT ON;

    UPDATE InsuranceMaster
    SET
        PolicyNumber = @PolicyNumber,
        PolicyHolderName = @PolicyHolderName,
        InsuranceType = @InsuranceType,
        PremiumAmount = @PremiumAmount,
        CoverageAmount = @CoverageAmount,
        StartDate = @StartDate,
        EndDate = @EndDate,
        AgentName = @AgentName,
        IsActive = @IsActive,
        UpdatedBy = SYSTEM_USER,
        UpdatedDate = GETDATE()
    WHERE InsuranceId = @InsuranceId;
END;
GO
