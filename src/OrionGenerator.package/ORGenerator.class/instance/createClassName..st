creating class and trait
createClassName: aFamixClass
	"Create the name of the Orion Class from the FamixClass"

	^ ('OR'
		,
			(aFamixClass mooseDescription package name = 'FAMIX'
				ifTrue: [ aFamixClass mooseDescription name ]
				ifFalse: [ (aFamixClass mooseDescription name beginsWith: aFamixClass mooseDescription package name)
						ifTrue: [ aFamixClass mooseDescription name ]
						ifFalse: [ aFamixClass mooseDescription package name , aFamixClass mooseDescription name ] ]))
		asSymbol