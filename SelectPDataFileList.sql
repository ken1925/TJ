SELECT ParamValue
	, (CASE WHEN ISNULL(Category,'') = '' THEN ParamDescription ELSE Category + ' - ' + ParamDescription END) AS ParamDescription
	, Category
FROM Parameters WITH(NOLOCK)
WHERE ParamValue = 'CUSTOMER'
