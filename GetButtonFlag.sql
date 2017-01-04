IF @FunctionName = 'ExceptionList'
	BEGIN
		SELECT top 1 * FROM lDCALogs WHERE  Username =@Username AND Dlrcode =@Dlrcode 
		AND (FunctionName like '%ExceptionList%')
		AND [END] IS NULL
		ORDER BY ID DESC
	END
ELSE
	BEGIN
	SELECT top 1 * FROM lDCALogs WHERE  Username =@Username AND Dlrcode =@Dlrcode 
		AND (FunctionName like '%UploadCSV%')
		AND [END] IS NULL
		ORDER BY ID DESC
	END