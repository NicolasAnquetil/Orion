"
A ORActionAddAnnotationInstanceAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddAnnotationInstanceAttribute,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'comments',
		'parentAnnotationInstance',
		'value',
		'annotationTypeAttribute',
		'declaredSourceLanguage',
		'sourceAnchor'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> annotationTypeAttribute [
	^ annotationTypeAttribute
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> annotationTypeAttribute: aValue [
	annotationTypeAttribute := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> parentAnnotationInstance [
	^ parentAnnotationInstance
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> parentAnnotationInstance: aValue [
	parentAnnotationInstance := aValue
]

{ #category : #'method execution - generated' }
ORActionAddAnnotationInstanceAttribute >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORAnnotationInstanceAttribute new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self value ifNotNil: [ :e | 
		newEntity privateValue: e orionCopy ].

	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self parentAnnotationInstance
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentAnnotationInstance.
			newEntity privateParentAnnotationInstance: theNewEntity orionCopy.
			theNewEntity privateAttributes: (theNewEntity privateAttributes orionCopy unsafeAdd: newEntity) ].

	self annotationTypeAttribute
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self annotationTypeAttribute.
			newEntity privateAnnotationTypeAttribute: theNewEntity orionCopy.
			theNewEntity privateAnnotationAttributeInstances: (theNewEntity privateAnnotationAttributeInstances orionCopy unsafeAdd: newEntity) ].

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
ORActionAddAnnotationInstanceAttribute >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> value [
	^ value
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationInstanceAttribute >> value: aValue [
	value := aValue
]
