"
A ORActionAddComment is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddComment,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'comments',
		'content',
		'declaredSourceLanguage',
		'container',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddComment >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddComment >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddComment >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionAddComment >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionAddComment >> content [
	^ content
]

{ #category : #'accessing - generated' }
ORActionAddComment >> content: aValue [
	content := aValue
]

{ #category : #'accessing - generated' }
ORActionAddComment >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddComment >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'method execution - generated' }
ORActionAddComment >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORComment new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self content ifNotNil: [ :e | 
		newEntity privateContent: e orionCopy ].

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

	self container
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self container.
			newEntity privateContainer: theNewEntity orionCopy.
			theNewEntity privateComments: (theNewEntity privateComments orionCopy unsafeAdd: newEntity) ].

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
ORActionAddComment >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddComment >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
