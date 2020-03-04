initialize-release
convertFromMooseModel: aMooseModel
	"take a MooseModel and convert it in a ORModel"

	| model state |
	model := ORModel new.
	model name: aMooseModel name.
	model sourceLanguage: aMooseModel sourceLanguage.
	aMooseModel entities copy
		do: [ :anEntity | 
			| myNewClass newAtt |
			myNewClass := self mapping at: anEntity class ifAbsent: [ nil ].
			myNewClass
				ifNotNil: [ anEntity primitiveChangeClassTo: myNewClass new.
					state := anEntity privateState.
					state primitiveChangeClassTo: anEntity defaultStateClass new.
					newAtt := SmallDictionary new.
					state privateAttributes do: [ :attr | newAtt at: attr key put: attr value ].
					state privateAttributes: newAtt.
					anEntity privateState: state.
					model add: anEntity ] ].
	^ model