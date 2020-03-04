method execution - generated
run
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORInvocation new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self signature ifNotNil: [ :e | 
		newEntity privateSignature: e orionCopy ].

	self receiverSourceCode ifNotNil: [ :e | 
		newEntity privateReceiverSourceCode: e orionCopy ].

	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self sender
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self sender.
			newEntity privateSender: theNewEntity orionCopy.
			theNewEntity privateOutgoingInvocations: (theNewEntity privateOutgoingInvocations orionCopy unsafeAdd: newEntity) ].

	self receiver
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self receiver.
			newEntity privateReceiver: theNewEntity orionCopy.
			theNewEntity privateReceivingInvocations: (theNewEntity privateReceivingInvocations orionCopy unsafeAdd: newEntity) ].

	self candidates
		ifNotNil: [ | theNewEntity |
			self candidates do: [ :anEntity | 
			theNewEntity := self orionModel retrieveEntity: anEntity.
			newEntity privateCandidates: (newEntity privateCandidates orionCopy unsafeAdd: theNewEntity).
			theNewEntity privateIncomingInvocations: (theNewEntity privateIncomingInvocations orionCopy unsafeAdd: newEntity) ] ] .

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