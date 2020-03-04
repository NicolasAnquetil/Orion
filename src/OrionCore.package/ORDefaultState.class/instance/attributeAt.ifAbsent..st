accessing
attributeAt: name ifAbsent: aBlock 
	 
	^ self attributeAt: name ifAbsent: aBlock OR: self currentContext