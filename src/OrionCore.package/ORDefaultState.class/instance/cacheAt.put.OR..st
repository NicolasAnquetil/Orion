accessing
cacheAt: name put: value OR: aVersion
	 
	^ queryCache at: name->aVersion put: (value versionIn: aVersion).