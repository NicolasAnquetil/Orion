accessing
propertyAt: name ifAbsent: aBlock OR: aVersion
	 
	^ (propertyCache  at: name ifAbsent: [aBlock value]) versionIn: aVersion.
