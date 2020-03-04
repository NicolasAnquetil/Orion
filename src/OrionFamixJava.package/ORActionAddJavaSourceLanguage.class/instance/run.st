method execution - generated
run
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORJavaSourceLanguage new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self sourcedEntities
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self sourcedEntities collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateSourcedEntities: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDeclaredSourceLanguage: newEntity ] ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity