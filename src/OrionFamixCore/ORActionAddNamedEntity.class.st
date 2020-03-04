"
A ORActionAddNamedEntity is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddNamedEntity,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'comments',
		'name',
		'modifiers',
		'annotationInstances',
		'declaredSourceLanguage',
		'isStub',
		'parentPackage',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddNamedEntity >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORNamedEntity new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	self modifiers isEmptyOrNil ifFalse: [ 
		newEntity privateModifiers: self modifiers orionCopy ].

	self isStub ifNotNil: [ :e | 
		newEntity privateIsStub: e orionCopy ].

	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self annotationInstances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self annotationInstances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateAnnotationInstances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateAnnotatedEntity: newEntity ] ].

	self declaredSourceLanguage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self declaredSourceLanguage.
			newEntity privateDeclaredSourceLanguage: theNewEntity orionCopy.
			theNewEntity privateSourcedEntities: (theNewEntity privateSourcedEntities orionCopy unsafeAdd: newEntity) ].

	self parentPackage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentPackage.
			newEntity privateParentPackage: theNewEntity orionCopy.
			theNewEntity privateChildNamedEntities: (theNewEntity privateChildNamedEntities orionCopy unsafeAdd: newEntity) ].

	self sourceAnchor
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self sourceAnchor.
			newEntity privateSourceAnchor: theNewEntity orionCopy.
			theNewEntity privateElement: newEntity orionCopy ].

	self receivingInvocations
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self receivingInvocations collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateReceivingInvocations: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateReceiver: newEntity ] ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddNamedEntity >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
