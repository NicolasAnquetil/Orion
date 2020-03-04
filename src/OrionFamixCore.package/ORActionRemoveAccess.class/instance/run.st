method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity accessor
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity accessor.
			theEntity privateAccesses: (theEntity privateAccesses orionCopy orionRemove: entity) ].
	entity variable
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity variable.
			theEntity privateIncomingAccesses: (theEntity privateIncomingAccesses orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity