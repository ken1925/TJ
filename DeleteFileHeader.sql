DELETE
FROM FileUplHdr
WHERE HdrId = @HeaderID

IF (@FileCategory = 'CUSTOMER') 
BEGIN
	DELETE
	FROM tblRAW_CUSMAS
	WHERE HdrId = @HeaderID

	DELETE
	FROM tblWIP_CUSMAS
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'VEHICLE') 
BEGIN
	DELETE
	FROM tblRAW_VEHMAS
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'ACCCODE') 
BEGIN
	DELETE
	FROM tblRAW_ACCCODE
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_ACCCODE
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'CARLINE') 
BEGIN
	DELETE
	FROM tblRAW_Carline
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_Carline
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'ACCOUNTS') 
BEGIN
	DELETE
	FROM tblRAW_ACCOUNTS
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_ACCOUNTS
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'ACCTGMAP') 
BEGIN
	DELETE
	FROM tblRAW_AcctgMap
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_AcctgMap
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'GENJOURNAL') 
BEGIN
	DELETE
	FROM tblRAW_GENJOURNAL
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_GENJOURNAL
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'GL') 
BEGIN
	DELETE
	FROM tblRAW_GLAccounts
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_GLAccounts
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'JOURNAL') 
BEGIN
	DELETE
	FROM tblRAW_JOURNAL
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_JOURNAL
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'MECHANICS') 
BEGIN
	DELETE
	FROM tblRAW_MECHANICS
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_MECHANICS
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'NVMODEL') 
BEGIN
	DELETE
	FROM tblRAW_NVMODELMAS
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_NVMODELMAS
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'NVINVENTORY') 
BEGIN
	DELETE
	FROM tblRAW_NVINVENTORY
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_NVINVENTORY
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'NVINVBK') 
BEGIN
	DELETE
	FROM tblRAW_NVINVBK
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_NVINVBK
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'NVSJOURNAL') 
BEGIN
	DELETE
	FROM tblRAW_NSVJOURNAL
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_NSVJOURNAL
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'PRODMASTER') 
BEGIN
	DELETE
	FROM tblRAW_ProdMas
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_ProdMas
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'DEALERMAKES') 
BEGIN
	DELETE
	FROM tblRAW_DEALERMAKES
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_DEALERMAKES
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'PROSPECT') 
BEGIN
	DELETE
	FROM tblRAW_PROSPECT
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_PROSPECT
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'SALESMAN') 
BEGIN
	DELETE
	FROM tblRAW_SALESMAN
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_SALESMAN
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'SERVCODE') 
BEGIN
	DELETE
	FROM tblRAW_SERVCODE
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_SERVCODE
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'SERVICEHIST') 
BEGIN
	DELETE
	FROM tblRAW_SERVICEHIST
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_SERVICEHIST
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'SERVICEMODEL') 
BEGIN
	DELETE
	FROM tblRAW_SERVICEMODEL
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_SERVICEMODEL
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'CASHJOURNAL') 
BEGIN
	DELETE
	FROM tblRAW_CASHJOURNAL
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_CASHJOURNAL
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'DEPOSITS') 
BEGIN
	DELETE
	FROM tblRAW_DEPOSITS
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_DEPOSITS
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'NVPJOURNAL') 
BEGIN
	DELETE
	FROM tblRAW_NVPJOURNAL
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_NVPJOURNAL
	WHERE HdrId = @HeaderID
END

ELSE IF (@FileCategory = 'VEHCOLOR') 
BEGIN
	DELETE
	FROM tblRAW_VEHCOLOR
	WHERE HdrId = @HeaderID
	
	DELETE
	FROM tblWIP_VEHCOLOR
	WHERE HdrId = @HeaderID
END