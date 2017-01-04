IF @Category = 'ACCOUNTING DATA'--@FileCategory = 'ACCOUNTS' OR @FileCategory = 'ACCCODE'
BEGIN
	SELECT LTRIM(RTRIM(AccNo)) + LTRIM(RTRIM(AccSuff)) AS ID
		, LTRIM(RTRIM(AccNo)) + LTRIM(RTRIM(AccSuff)) AS [DESC]
	FROM mDMSSubGrpDtl WITH(NOLOCK)
	WHERE 1=1
	AND TMPStd = 1
END

ELSE IF @FileCategory = 'CARLINE'
BEGIN
	SELECT CarlCode AS ID
		, CarlDesc AS [DESC]
	FROM MDMSCARLINE
END

ELSE IF @FileCategory = 'PRODMASTER'
BEGIN
	--SELECT PartNo AS ID
	--	, PartName AS [DESC]
	--FROM [rPartsMaster] WITH(NOLOCK)
	
	SELECT --TOP 90000
		LTRIM(RTRIM(PartNo)) AS ID--PART NUMBER
		, LTRIM(RTRIM(PartName)) AS [DESC]--DESCRIPTION
		, (RtlPrice / 100) AS RetailPrice--SRP 
		, (CASE WHEN ISNULL(DealerNet, 0) <> 0 THEN (DealerNet / 100)
				ELSE ((RtlPrice / 100) * (SELECT ISNULL(LISTFACTOR, 0) AS LISTFACTOR
											FROM RDMSDEALER D WITH(NOLOCK)
											LEFT JOIN MDMSAREA A WITH(NOLOCK)
												ON D.AREACD = A.AREAID
											WHERE TMPDLRCD = @DealerCode)) END) AS Cost--COST // if DealerNet = 0 then COST = (RetailPrice / 100) * ListFactor else DealerNet
		, (CASE WHEN ISNULL(DealerNet, 0) <> 0 THEN (DealerNet / 100) 
				ELSE ((RtlPrice / 100) * (SELECT ISNULL(WTYFACTOR, 0) AS WTYFACTOR
											FROM RDMSDEALER D WITH(NOLOCK)
											LEFT JOIN MDMSAREA A WITH(NOLOCK)
												ON D.AREACD = A.AREAID
											WHERE TMPDLRCD = @DealerCode)) END) AS Warranty--WARR // if DealerNet = 0 then WARR = (RetailPrice / 100) * WarrantyFactor else DealerNet
		, LTRIM(RTRIM(SPartNo)) AS SubPartNo	--SUBSTITUTE PART NUMBER
		, LTRIM(RTRIM(ModelCode)) AS ModelCode	--MODEL CODE
		, LTRIM(RTRIM(SCC)) AS SCC --SOURCE CODE
	FROM [rDMSPartsMaster] WITH(NOLOCK)

END  

ELSE IF @FileCategory = 'NVMODEL'
BEGIN
	SELECT ERAModelCode AS ID
		, ModelDesc AS [DESC]
	FROM mDMSModelCode WITH(NOLOCK)
END

ELSE IF @FileCategory = 'SERVICEMODEL' OR @FileCategory = 'SERVCODE'
BEGIN
	SELECT ModelMaintCode AS ID
		, ModelMaintCode AS [DESC]
	FROM [mDMSModelMaintenance] WITH(NOLOCK)
END

--ELSE IF @FileCategory = 'SERVCODE'
--BEGIN
--	SELECT OpCode AS ID
--		, OpDesc AS [DESC]
--	FROM [mOpCodeHdr] WITH(NOLOCK)
--END