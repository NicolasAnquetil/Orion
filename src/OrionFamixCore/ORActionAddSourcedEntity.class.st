"
A ORActionAddSourcedEntity is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddSourcedEntity,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'comments',
		'declaredSourceLanguage',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddSourcedEntity >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddSourcedEntity >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddSourcedEntity >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddSourcedEntity >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'method execution - generated' }
ORActionAddSourcedEntity >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORSourcedEntity new.
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
ORActionAddSourcedEntity >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddSourcedEntity >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
