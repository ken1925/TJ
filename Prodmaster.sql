--exec spSelectUploadedFileHeader @DealerCode, @Criteria

declare @DealerCode nvarchar(100)
declare @Criteria nvarchar(100)
declare @Start int
declare @Length  int
set @Criteria = 'prodmaster'
set @DealerCode = 'TCC03'
set @Start = 1
set @Length = 10
SELECT * FROM(
		SELECT ROW_NUMBER() OVER (ORDER BY DL.[TMPDealerCode], [DataFile], UplDate DESC) ROWNUMBER
		   ,FH.[HdrId] AS HeaderID
		   ,DL.[TMPDealerCode] AS DealerCode
		   ,DL.[dealerAlias] AS DealerAlias
		   ,P.[ParamDescription] AS [DataFile]
		   ,P.Category
		   ,[VerNo]
		   ,[UplDate] AS UploadDate
		   ,[CRating] AS CleanlinessRating
		   , previousVersion
		   ,(CRating - ISNULL((
								SELECT CRating 
								FROM FileUplHdr 
								WHERE VerNo = previousVersion
									AND  DlrCode = FH.DlrCode
									AND DataFile = FH.[DataFile]
							  ), CRating)) AS Variance
	FROM FileUplHdr FH WITH(NOLOCK)
	INNER JOIN (
		SELECT [TMP_DEALER_CODE] AS TMPDealerCode
		, [DEALER_NAME] AS dealerName
		, [TMP_DEALER_CODE_2] AS dealerAlias
		FROM [TMP-SQL-03].SQL_DW.DBO.mSASDealerMaster DL WITH(NOLOCK)
	UNION 
	SELECT 'TMP01', 'TOYOTA MOTOR PHILIPPINES', 'TMP'
	) DL ON FH.DlrCode COLLATE Latin1_General_CI_AS = DL.[TMPDealerCode] COLLATE Latin1_General_CI_AS
	INNER JOIN (
		SELECT [HdrId], ([VerNo] - 1) AS previousVersion FROM FileUplHdr WITH(NOLOCK)
	) PV ON FH.[HdrId] = PV.[HdrId]
	INNER JOIN Parameters P
		ON FH.[DataFile] = P.ParamValue AND P.ParamType = 'DataFiles' AND FH.StartUploadTime IS  NULL
	WHERE DlrCode = (CASE WHEN ISNULL(@DealerCode, '') = '' THEN DlrCode ELSE @DealerCode END)
		AND DataFile = (CASE WHEN ISNULL(@Criteria, '') = '' THEN DataFile ELSE @Criteria END)
	
) AS TB
WHERE ROWNUMBER BETWEEN @Start AND @Length
ORDER BY ROWNUMBER, DealerCode, [DataFile], UploadDate DESC

--select * from FileUplHdr where DataFile = 'prodmaster' AND DLRCODE = 'TCC03'

--Update FileUplHdr set StartUploadTime  = getdate()
--where HdrId = 166