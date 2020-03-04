*OrionFamixJava
runOnJavaExtension: newEntity
	<toRun>
	<generated: true>
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self caughtExceptions
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self caughtExceptions collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateCaughtExceptions: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDefiningMethod: newEntity ] ].

	self definedAnnotationTypes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self definedAnnotationTypes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateDefinedAnnotationTypes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self thrownExceptions
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self thrownExceptions collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateThrownExceptions: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDefiningMethod: newEntity ] ].

	self declaredExceptions
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self declaredExceptions collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateDeclaredExceptions: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDefiningMethod: newEntity ] ].
