creating method
catNameFor: aFamePackage defaultName: defaultCatName
	^ aFamePackage
		ifNil: [ defaultCatName , ' - generated' ]
		ifNotNil: [ '*OrionFamix' , aFamePackage name ]