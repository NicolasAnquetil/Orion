accessing
allPropertiesOR: aVersion
	 
	^propertyCache values collect:[:e | e versionIn: aVersion]