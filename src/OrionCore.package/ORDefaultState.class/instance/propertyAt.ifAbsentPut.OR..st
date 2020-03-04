accessing
propertyAt: name ifAbsentPut: aBlock OR: aVersion
	 
	^ (propertyCache  at: name ifAbsentPut: aBlock)versionIn: aVersion.
