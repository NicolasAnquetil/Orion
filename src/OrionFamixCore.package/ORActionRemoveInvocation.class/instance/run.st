method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity sender
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity sender.
			theEntity privateOutgoingInvocations: (theEntity privateOutgoingInvocations orionCopy orionRemove: entity) ].
	entity receiver
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity receiver.
			theEntity privateReceivingInvocations: (theEntity privateReceivingInvocations orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity