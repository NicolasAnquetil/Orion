accessing
attributeAt: name ifAbsentPut: aBlock 
	 
	^self attributeAt: name ifAbsentPut: aBlock OR: self currentContext