accessing
cacheAt: name ifAbsentPut: aBlock OR: aVersion

	"^ (queryCache at: name->aVersion ifAbsentPut: aBlock) versionIn: aVersion."
	^aBlock value versionIn: aVersion.