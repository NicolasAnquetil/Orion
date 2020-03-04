creating method
addExtendedPrivateAccessorsOf: aProp to: aFamixClass
	"add private accessors corresponding to the property to the Famix Class if it does not already exist and which are as method extension"

	| aMethName cat |
	aMethName := 'private' , aProp name capitalized.
	"(aFamixClass methodDict includesKey: aMethName asSymbol)
		ifFalse: [ "
	cat := '*' , 'Orion' , ('' join: (aProp compiledMethod category substrings: '-*')).
	aFamixClass compileSilently: (self codeForPrivateExtendedGetter: aProp) classified: cat.
	aFamixClass compileSilently: (self codeForPrivateExtendedSetter: aProp) classified: cat	"]"