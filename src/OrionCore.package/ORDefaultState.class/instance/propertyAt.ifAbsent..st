accessing
propertyAt: name ifAbsent: aBlock 
	 
	^ self propertyAt: name ifAbsent: aBlock OR: self currentContext
