creating class and trait
ensureORTrait: aFamixClass
	"Create a trait corresponding to the FamixClass "

	^ (self ensureInheritFromMooseEntity: aFamixClass)
		ifTrue: [ | name |
			name := self createTraitName: aFamixClass.
			Smalltalk globals
				at: name
				ifPresent: [ :trait | trait ]
				ifAbsent: [ | aTrait |
					aTrait := Trait
						named: name
						uses: (self ensureORTrait: aFamixClass superclass)
						category: (self createTraitCategoryName: aFamixClass).
					self createCommentToATrait: aTrait.
					aTrait ] ]
		ifFalse: [ TMooseEntity ]