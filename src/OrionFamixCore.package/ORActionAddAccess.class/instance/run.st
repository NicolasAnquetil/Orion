method execution - generated
run
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORAccess new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self isWrite ifNotNil: [ :e | 
		newEntity privateIsWrite: e orionCopy ].

	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self accessor
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self accessor.
			newEntity privateAccessor: theNewEntity orionCopy.
			theNewEntity privateAccesses: (theNewEntity privateAccesses orionCopy unsafeAdd: newEntity) ].

	self variable
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self variable.
			newEntity privateVariable: theNewEntity orionCopy.
			theNewEntity privateIncomingAccesses: (theNewEntity privateIncomingAccesses orionCopy unsafeAdd: newEntity) ].

	self declaredSourceLanguage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self declaredSourceLanguage.
			newEntity privateDeclaredSourceLanguage: theNewEntity orionCopy.
			theNewEntity privateSourcedEntities: (theNewEntity privateSourcedEntities orionCopy unsafeAdd: newEntity) ].

	self previous
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self previous.
			newEntity privatePrevious: theNewEntity orionCopy.
			theNewEntity privateNext: newEntity orionCopy ].

	self next
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self next.
			newEntity privateNext: theNewEntity orionCopy.
			theNewEntity privatePrevious: newEntity orionCopy ].

	self sourceAnchor
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self sourceAnchor.
			newEntity privateSourceAnchor: theNewEntity orionCopy.
			theNewEntity privateElement: newEntity orionCopy ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity