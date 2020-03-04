*OrionBrowser
addInvocationTo: aCollection receiver: receiver withSignature: aSymbol inModel: aModelVersion 

	(ORActionAddInvocation new
		orionModel: aModelVersion;
		sender: self ;
		receiver: receiver;
		candidates: aCollection;
		signature: aSymbol )
	manualRun; postRun . 