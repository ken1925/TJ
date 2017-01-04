UPDATE FileUplHdr
SET CRating = ROUND(100 - ((@ExceptionCount/@FileCount) * 100), 2)
WHERE HdrId = @HeaderID