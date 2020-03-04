"
A ORActionAddInheritance is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddInheritance,
	#superclass : #ORActionAddLink,
	#instVars : [
		'comments',
		'superclass',
		'subclass',
		'declaredSourceLanguage',
		'previous',
		'next',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionAddInheritance class >> description [
	^'add inheritance'
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> next [
	^ next
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> next: aValue [
	next := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> previous [
	^ previous
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> previous: aValue [
	previous := aValue
]

{ #category : #'method execution - generated' }
ORActionAddInheritance >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORInheritance new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self superclass
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self superclass.
			newEntity privateSuperclass: theNewEntity orionCopy.
			theNewEntity privateSubInheritances: (theNewEntity privateSubInheritances orionCopy unsafeAdd: newEntity) ].

	self subclass
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self subclass.
			newEntity privateSubclass: theNewEntity orionCopy.
			theNewEntity privateSuperInheritances: (theNewEntity privateSuperInheritances orionCopy unsafeAdd: newEntity) ].

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
ORActionAddInheritance >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> subclass [
	^ subclass
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> subclass: aValue [
	subclass := aValue
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> superclass [
	^ superclass
]

{ #category : #'accessing - generated' }
ORActionAddInheritance >> superclass: aValue [
	superclass := aValue
]
