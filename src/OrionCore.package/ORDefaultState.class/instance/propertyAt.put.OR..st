accessing
propertyAt: name put: value OR: aVersion
	 
	^ propertyCache  at: name put: (value versionIn: aVersion).
