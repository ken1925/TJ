SELECT DealerCode, dealerName, dealerAlias
FROM (
	SELECT [TMP_DEALER_CODE] AS DealerCode
		, [DEALER_NAME] AS DealerName
		, [TMP_DEALER_CODE_2] AS dealerAlias
		, [DATE_ESTABLISHED] FROM [TMP-SQL-03].SQL_DW.DBO.mSASDealerMaster DL WITH(NOLOCK)
	UNION 
	SELECT 'TMP01', 'TOYOTA MOTOR PHILIPPINES', 'TMP', NULL
) DL
WHERE [DealerCode] = ISNULL(@DealerCode, [DealerCode])
ORDER BY [DealerCode]