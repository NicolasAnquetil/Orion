accessing
at: uniqueName ifAbsent: exceptionBlock

	| entity na |
	na := uniqueName asSymbol.
	entity := byName at: na ifAbsent: nil.
	entity
		ifNotNil: [ ^ (self atID: entity mooseID ifAbsent: [  ])
				versionIn: self model privateState currentContext ].
	entity := self
		detect: [ :each | na == (each versionIn: self model privateState currentContext) mooseName asSymbol ]
		ifNone: exceptionBlock.
	entity ifNotNil: [ byName at: na put: entity ].
	^ entity versionIn: self model privateState currentContext