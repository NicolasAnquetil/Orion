creating class and trait
createClassCategoryName: aFamixClass
	^ String
		streamContents: [ :stream | 
			stream << 'Orion'.
			($- split: aFamixClass category) asStringOn: stream delimiter: ''.
			stream << '-'; << self typeOfGeneratedObject ]