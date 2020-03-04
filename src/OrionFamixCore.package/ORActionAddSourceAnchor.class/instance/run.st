method execution - generated
run
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORSourceAnchor new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self element
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self element.
			newEntity privateElement: theNewEntity orionCopy.
			theNewEntity privateSourceAnchor: newEntity orionCopy ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity