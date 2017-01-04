IF (SELECT Category FROM Parameters WITH(NOLOCK) WHERE ParamType = 'DataFiles' AND ParamValue = @Criteria) = 'SPECIAL ACCTG DATA'
BEGIN
	SELECT ISNULL(MAX([VerNo]),0) AS VerNo
	FROM FileUplHdr HDR WITH(NOLOCK)
	INNER JOIN Parameters P WITH(NOLOCK)
		ON HDR.DataFile = P.ParamValue
	WHERE Category = 'ACCOUNTING DATA'
END

ELSE
BEGIN
	SELECT ISNULL(MAX([VerNo]),0) + 1 AS VerNo
	FROM FileUplHdr FH WITH(NOLOCK)
	WHERE DlrCode = @DealerCode
		AND DataFile = @Criteria
END
	