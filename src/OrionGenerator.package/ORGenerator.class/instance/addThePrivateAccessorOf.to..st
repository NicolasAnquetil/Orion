creating method
addThePrivateAccessorOf: aProp to: aFamixClass
	"add private accessors corresponding to the property to the Famix Class if it does not already exist "

	| aMethName |
	aMethName := 'private' , aProp name capitalized.
	(aFamixClass methodDict includesKey: aMethName asSymbol)
		ifFalse: [ 
			aFamixClass compileSilently: (self codeForPrivateGetter: aProp) classified: '*' , (self createClassCategoryName: aFamixClass).
			aFamixClass compileSilently: (self codeForPrivateSetter: aProp) classified: '*' , (self createClassCategoryName: aFamixClass) ]