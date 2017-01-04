SELECT ParamType, ParamValue, ParamDescription, Category
FROM Parameters WITH(NOLOCK)
WHERE ParamType = ISNULL(@Type, ParamType)
	AND ParamValue = ISNULL(@Value, ParamValue)
	AND ParamDescription = ISNULL(@Description, ParamDescription)
	AND Category = ISNULL(@Category, Category)
ORDER BY Category, ParamDescription