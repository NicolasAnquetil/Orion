creating class and trait
createClassName: aFamixClass inPackage: aString
	"Create the name of the Orion Class from the FamixClass"

	^ ('OR'
		,
			(aFamixClass mooseDescription package name = aString
				ifTrue: [ aFamixClass mooseDescription name ]
				ifFalse: [ aFamixClass mooseDescription implementingClass name ])) asSymbol