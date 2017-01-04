SELECT COUNT(*)
FROM FileUplHdr FH WITH(NOLOCK)
--INNER JOIN [TMP-SQL-03].SQL_DW.DBO.mSASDealerMaster DL WITH(NOLOCK)
--	ON FH.DlrCode COLLATE Latin1_General_CI_AS = DL.TMPDealerCode COLLATE Latin1_General_CI_AS
WHERE DlrCode = (CASE WHEN ISNULL(@DealerCode, '') = '' THEN DlrCode ELSE @DealerCode END)
	AND DataFile = (CASE WHEN ISNULL(@Criteria, '') = '' THEN DataFile ELSE @Criteria END)
	
	
--WHERE DlrCode = (CASE WHEN ISNULL(@DealerCode, '') = '' THEN DlrCode ELSE @DealerCode END)
--		AND DataFile = ISNULL(@Criteria, DataFile)