method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity definingMethod
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity definingMethod.
			theEntity privateCaughtExceptions: (theEntity privateCaughtExceptions orionCopy orionRemove: entity) ].
	entity exceptionClass
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity exceptionClass.
			theEntity privateExceptions: (theEntity privateExceptions orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity