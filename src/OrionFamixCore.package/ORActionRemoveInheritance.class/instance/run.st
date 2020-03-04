method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity superclass
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity superclass.
			theEntity privateSubInheritances: (theEntity privateSubInheritances orionCopy orionRemove: entity) ].
	entity subclass
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity subclass.
			theEntity privateSuperInheritances: (theEntity privateSuperInheritances orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity