"
A ORActionAddContainerEntity is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddContainerEntity,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definedAnnotationTypes',
		'comments',
		'name',
		'modifiers',
		'types',
		'annotationInstances',
		'functions',
		'declaredSourceLanguage',
		'isStub',
		'parentPackage',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddContainerEntity >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORContainerEntity new.
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

	self types
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self types collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateTypes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self annotationInstances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self annotationInstances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateAnnotationInstances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateAnnotatedEntity: newEntity ] ].

	self functions
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self functions collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateFunctions: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

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
ORActionAddContainerEntity >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddContainerEntity >> types: aValue [
	types := aValue
]
