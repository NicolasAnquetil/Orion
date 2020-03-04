accessing
at: uniqueName withType: aType ifAbsent: exceptionBlock
	| entity na |
	na := uniqueName asSymbol.
	entity := super at: uniqueName withType: aType ifAbsent: [  ].
	entity ifNotNil: [ ^ (self atID: entity mooseID ifAbsent: [  ]) versionIn: self model privateState currentContext ].
	entity := (self
		shouldSort: (self selectAllWithType: aType)
		withBlock: [ :a :b | a mooseName asSymbol <= b mooseName asSymbol ]
		type: aType
		modelVersion: self model privateState currentContext)
		findBinary: [ :a | 
			| aName |
			aName := a mooseName asSymbol.
			aName = na
				ifTrue: [ 0 ]
				ifFalse: [ na < aName
						ifTrue: [ -1 ]
						ifFalse: [ 1 ] ] ]
		ifNone: exceptionBlock.
	entity ifNotNil: [ byName at: na put: entity ].
	^ entity versionIn: self model privateState currentContext