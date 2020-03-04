method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity parentAnnotationInstance
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentAnnotationInstance.
			theEntity privateAttributes: (theEntity privateAttributes orionCopy orionRemove: entity) ].
	entity annotationTypeAttribute
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity annotationTypeAttribute.
			theEntity privateAnnotationAttributeInstances: (theEntity privateAnnotationAttributeInstances orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity