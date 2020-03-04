creating class and trait
createTraitCategoryName: aFamixClass
	^ String
		streamContents: [ :stream |  
			stream << 'Orion'.
			($- split: aFamixClass category) asStringOn: stream delimiter: ''.
			stream << '-Trait' ]