method execution - generated
run
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORDeclaredException new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self definingMethod
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self definingMethod.
			newEntity privateDefiningMethod: theNewEntity orionCopy.
			theNewEntity privateDeclaredExceptions: (theNewEntity privateDeclaredExceptions orionCopy unsafeAdd: newEntity) ].

	self exceptionClass
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self exceptionClass.
			newEntity privateExceptionClass: theNewEntity orionCopy.
			theNewEntity privateExceptions: (theNewEntity privateExceptions orionCopy unsafeAdd: newEntity) ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity