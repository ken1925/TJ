SELECT DataCol - 1 AS DataCol
FROM [PARAMETERS] a WITH(NOLOCK)
WHERE ParamType = 'DATAFILES'
  AND ParamValue = @ParamValue