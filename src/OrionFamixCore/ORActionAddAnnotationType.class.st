"
A ORActionAddAnnotationType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddAnnotationType,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definedAnnotationTypes',
		'typeAliases',
		'sourceAnchor',
		'comments',
		'behavioursWithDeclaredType',
		'name',
		'structuresWithDeclaredType',
		'modifiers',
		'instances',
		'incomingReferences',
		'types',
		'annotationInstances',
		'methods',
		'functions',
		'declaredSourceLanguage',
		'attributes',
		'subInheritances',
		'isStub',
		'parentPackage',
		'superInheritances',
		'container',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> attributes [
	^ attributes
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> attributes: aValue [
	attributes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> behavioursWithDeclaredType [
	^ behavioursWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> behavioursWithDeclaredType: aValue [
	behavioursWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> incomingReferences [
	^ incomingReferences
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> incomingReferences: aValue [
	incomingReferences := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> instances [
	^ instances
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> instances: aValue [
	instances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> methods [
	^ methods
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> methods: aValue [
	methods := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddAnnotationType >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORAnnotationType new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	self modifiers isEmptyOrNil ifFalse: [ 
		newEntity privateModifiers: self modifiers orionCopy ].

	self isStub ifNotNil: [ :e | 
		newEntity privateIsStub: e orionCopy ].

	"Set complex not derived properties of the entity"
	self sourceAnchor
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self sourceAnchor.
			newEntity privateSourceAnchor: theNewEntity orionCopy.
			theNewEntity privateElement: newEntity orionCopy ].

	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self behavioursWithDeclaredType
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self behavioursWithDeclaredType collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateBehavioursWithDeclaredType: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDeclaredType: newEntity ] ].

	self structuresWithDeclaredType
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self structuresWithDeclaredType collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateStructuresWithDeclaredType: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDeclaredType: newEntity ] ].

	self instances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self instances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateInstances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateAnnotationType: newEntity ] ].

	self incomingReferences
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self incomingReferences collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateIncomingReferences: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateTarget: newEntity ] ].

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

	self methods
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self methods collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateMethods: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentType: newEntity ] ].

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

	self attributes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self attributes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateAttributes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentType: newEntity ] ].

	self subInheritances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self subInheritances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateSubInheritances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateSuperclass: newEntity ] ].

	self parentPackage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentPackage.
			newEntity privateParentPackage: theNewEntity orionCopy.
			theNewEntity privateChildNamedEntities: (theNewEntity privateChildNamedEntities orionCopy unsafeAdd: newEntity) ].

	self superInheritances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self superInheritances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateSuperInheritances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateSubclass: newEntity ] ].

	self container
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self container.
			newEntity privateContainer: theNewEntity orionCopy.
			theNewEntity privateDefinedAnnotationTypes: (theNewEntity privateDefinedAnnotationTypes orionCopy unsafeAdd: newEntity) ].

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
ORActionAddAnnotationType >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> structuresWithDeclaredType [
	^ structuresWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> structuresWithDeclaredType: aValue [
	structuresWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> subInheritances [
	^ subInheritances
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> subInheritances: aValue [
	subInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> superInheritances [
	^ superInheritances
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> superInheritances: aValue [
	superInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddAnnotationType >> types: aValue [
	types := aValue
]
