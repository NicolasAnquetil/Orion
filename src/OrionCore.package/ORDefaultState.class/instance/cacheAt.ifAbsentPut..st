accessing
cacheAt: name ifAbsentPut: aBlock 

	^ self cacheAt: name ifAbsentPut: aBlock OR: self currentContext