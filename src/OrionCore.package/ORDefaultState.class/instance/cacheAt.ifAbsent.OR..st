accessing
cacheAt: name ifAbsent: aBlock OR: aVersion
	 
	"^ (queryCache at: name->aVersion ifAbsent: [aBlock value]) versionIn: aVersion."
	^aBlock value versionIn: aVersion.