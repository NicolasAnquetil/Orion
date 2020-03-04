"
A ORActionAddInvocation is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddInvocation,
	#superclass : #ORActionAddLink,
	#instVars : [
		'comments',
		'signature',
		'sender',
		'receiver',
		'receiverSourceCode',
		'candidates',
		'declaredSourceLanguage',
		'previous',
		'next',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddInvocation class >> description [
	^'add invocation'
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> candidates [
	^ candidates
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> candidates: aValue [
	candidates := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> next [
	^ next
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> next: aValue [
	next := aValue
]

{ #category : #'method execution' }
ORActionAddInvocation >> postRun [

	from ifNotNil: [ 
		| sender |
		sender := (self orionModel retrieveEntity: from).
		sender parentType resetMooseName ].
	super postRun.
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> previous [
	^ previous
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> previous: aValue [
	previous := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> receiver [
	^ receiver
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> receiver: aValue [
	receiver := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> receiverSourceCode [
	^ receiverSourceCode
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> receiverSourceCode: aValue [
	receiverSourceCode := aValue
]

{ #category : #'method execution - generated' }
ORActionAddInvocation >> run [
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
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> sender [
	^ sender
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> sender: aValue [
	sender := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> signature [
	^ signature
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> signature: aValue [
	signature := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddInvocation >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
