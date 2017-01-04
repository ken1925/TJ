SELECT ISNULL(CAST(ParamValue AS DECIMAL(18,2)),0)
FROM Parameters
WHERE ParamType = 'MRValue'
	AND ParamDescription = @FileCategory