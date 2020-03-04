accessing
propertyAt: name ifAbsentPut: aBlock 
	 
	^ self propertyAt: name ifAbsentPut: aBlock OR: self currentContext
