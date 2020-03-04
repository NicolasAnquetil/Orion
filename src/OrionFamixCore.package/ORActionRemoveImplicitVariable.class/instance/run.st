method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity annotationInstances do: [ :e | e deleteInAction: self ].
	entity incomingAccesses do: [ :e | e deleteInAction: self ].
	entity receivingInvocations do: [ :e | e deleteInAction: self ].
	entity declaredType
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredType.
			theEntity privateStructuresWithDeclaredType: (theEntity privateStructuresWithDeclaredType orionCopy orionRemove: entity) ].
	entity parentBehaviouralEntity
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentBehaviouralEntity.
			theEntity privateImplicitVariables: (theEntity privateImplicitVariables orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity