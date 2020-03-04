accessing
attributeAt: name ifAbsent: aBlock OR: aVersion
	 
	^ (attributes at: name ifAbsent: [aBlock value])  versionIn: aVersion.