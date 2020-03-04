accessing
cacheAt: name ifAbsent: aBlock 
	 
	^ self cacheAt: name ifAbsent: aBlock OR: self currentContext