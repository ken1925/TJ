SELECT ParamValue
	, (CASE WHEN ISNULL(Category,'') = '' THEN ParamDescription ELSE Category + ' - ' + ParamDescription END) AS ParamDescription
	, Category
FROM Parameters WITH(NOLOCK)
WHERE ParamType = 'DataFiles'
	AND ACTIVEFLAG = 1
	AND (ViewType = 'A' OR @DealerCode = 'TMP01')
AND Category IS NOT NULL
ORDER BY Category, ParamDescription