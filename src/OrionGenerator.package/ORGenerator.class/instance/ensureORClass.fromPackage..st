creating class and trait
ensureORClass: aFamixClass fromPackage: aString
	"Create an Orion Class corresponding to the FamixClass and inheriting from it"

	| name |
	name := self createClassName: aFamixClass inPackage: aString.
	
	^Smalltalk globals at: name ifAbsent: [
		aFamixClass  subclass: name
		uses: (self ensureORTrait: aFamixClass)
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: (self createClassCategoryName: aFamixClass)]