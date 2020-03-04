accessing
attributeAt: name ifAbsentPut: aBlock OR: aVersion
	 
	^( attributes  at: name ifAbsentPut: ((aBlock value) versionIn: aVersion))