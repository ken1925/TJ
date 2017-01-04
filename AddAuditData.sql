INSERT INTO AuditData([DlrCode]
	   ,[DataFile]
	   ,[VerNo]
	   ,[Tag]
	   ,[FldName]
	   ,[FldValue])

VALUES (@DealerCode
		, @Criteria
		, @Version
		, @Tag
		, @FieldName
		, @FieldValue)