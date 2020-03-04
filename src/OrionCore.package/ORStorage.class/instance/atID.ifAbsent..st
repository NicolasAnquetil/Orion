accessing
atID: uniqueId ifAbsent: exceptionBlock 
	^elements at: uniqueId ifAbsent:exceptionBlock.