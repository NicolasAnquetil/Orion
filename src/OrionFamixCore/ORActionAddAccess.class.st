"
A ORActionAddAccess is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddAccess,
	#superclass : #ORActionAddLink,
	#instVars : [
		'comments',
		'accessor',
		'variable',
		'isWrite',
		'declaredSourceLanguage',
		'previous',
		'next',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddAccess class >> description [
	^'add reference'
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> accessor [
	^ accessor
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> accessor: aValue [
	accessor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> isWrite [
	^ isWrite
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> isWrite: aValue [
	isWrite := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> next [
	^ next
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> next: aValue [
	next := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> previous [
	^ previous
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> previous: aValue [
	previous := aValue
]

{ #category : #'method execution - generated' }
ORActionAddAccess >> run [
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
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> variable [
	^ variable
]

{ #category : #'accessing - generated' }
ORActionAddAccess >> variable: aValue [
	variable := aValue
]
