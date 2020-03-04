"
A ORActionAddAssociation is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddAssociation,
	#superclass : #ORActionAddLink,
	#instVars : [
		'comments',
		'declaredSourceLanguage',
		'previous',
		'next',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddAssociation >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> next [
	^ next
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> next: aValue [
	next := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> previous [
	^ previous
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> previous: aValue [
	previous := aValue
]

{ #category : #'method execution - generated' }
ORActionAddAssociation >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORAssociation new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

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
ORActionAddAssociation >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddAssociation >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
