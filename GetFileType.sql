SELECT FileType
FROM [PARAMETERS] a WITH(NOLOCK)
WHERE ParamType = 'DATAFILES'
  AND ParamValue = @ParamValue