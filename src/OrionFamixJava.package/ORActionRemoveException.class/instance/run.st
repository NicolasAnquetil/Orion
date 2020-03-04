method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity exceptionClass
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity exceptionClass.
			theEntity privateExceptions: (theEntity privateExceptions orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity