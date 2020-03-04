"
A ORActionAddReference is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddReference,
	#superclass : #ORActionAddLink,
	#instVars : [
		'comments',
		'source',
		'declaredSourceLanguage',
		'previous',
		'target',
		'next',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddReference class >> description [
	^'add reference'
]

{ #category : #'accessing - generated' }
ORActionAddReference >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddReference >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddReference >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddReference >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddReference >> next [
	^ next
]

{ #category : #'accessing - generated' }
ORActionAddReference >> next: aValue [
	next := aValue
]

{ #category : #'accessing - generated' }
ORActionAddReference >> previous [
	^ previous
]

{ #category : #'accessing - generated' }
ORActionAddReference >> previous: aValue [
	previous := aValue
]

{ #category : #'method execution - generated' }
ORActionAddReference >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORReference new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self source
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self source.
			newEntity privateSource: theNewEntity orionCopy.
			theNewEntity privateOutgoingReferences: (theNewEntity privateOutgoingReferences orionCopy unsafeAdd: newEntity) ].

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

	self target
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self target.
			newEntity privateTarget: theNewEntity orionCopy.
			theNewEntity privateIncomingReferences: (theNewEntity privateIncomingReferences orionCopy unsafeAdd: newEntity) ].

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
ORActionAddReference >> source [
	^ source
]

{ #category : #'accessing - generated' }
ORActionAddReference >> source: aValue [
	source := aValue
]

{ #category : #'accessing - generated' }
ORActionAddReference >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddReference >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddReference >> target [
	^ target
]

{ #category : #'accessing - generated' }
ORActionAddReference >> target: aValue [
	target := aValue
]
