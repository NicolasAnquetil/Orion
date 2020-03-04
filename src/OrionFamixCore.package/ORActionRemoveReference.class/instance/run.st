method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity source
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity source.
			theEntity privateOutgoingReferences: (theEntity privateOutgoingReferences orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity target
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity target.
			theEntity privateIncomingReferences: (theEntity privateIncomingReferences orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity