"
A ORActionAddAnnotationInstance is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddAnnotationInstance,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'comments',
		'annotatedEntity',
		'declaredSourceLanguage',
		'attributes',
		'annotationType',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> annotatedEntity [
	^ annotatedEntity
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> annotatedEntity: aValue [
	annotatedEntity := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> annotationType [
	^ annotationType
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> annotationType: aValue [
	annotationType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> attributes [
	^ attributes
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> attributes: aValue [
	attributes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'method execution - generated' }
ORActionAddAnnotationInstance >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORAnnotationInstance new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self annotatedEntity
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self annotatedEntity.
			newEntity privateAnnotatedEntity: theNewEntity orionCopy.
			theNewEntity privateAnnotationInstances: (theNewEntity privateAnnotationInstances orionCopy unsafeAdd: newEntity) ].

	self declaredSourceLanguage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self declaredSourceLanguage.
			newEntity privateDeclaredSourceLanguage: theNewEntity orionCopy.
			theNewEntity privateSourcedEntities: (theNewEntity privateSourcedEntities orionCopy unsafeAdd: newEntity) ].

	self attributes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self attributes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateAttributes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentAnnotationInstance: newEntity ] ].

	self annotationType
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self annotationType.
			newEntity privateAnnotationType: theNewEntity orionCopy.
			theNewEntity privateInstances: (theNewEntity privateInstances orionCopy unsafeAdd: newEntity) ].

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
ORActionAddAnnotationInstance >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstance >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
