"
A ORActionAddEnum is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddEnum,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definedAnnotationTypes',
		'typeAliases',
		'instances',
		'declaredSourceLanguage',
		'container',
		'annotationInstances',
		'structuresWithDeclaredType',
		'isStub',
		'parentPackage',
		'subInheritances',
		'types',
		'attributes',
		'modifiers',
		'behavioursWithDeclaredType',
		'functions',
		'comments',
		'incomingReferences',
		'superInheritances',
		'receivingInvocations',
		'sourceAnchor',
		'values',
		'methods',
		'name'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionAddEnum >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> attributes [
	^ attributes
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> attributes: aValue [
	attributes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> behavioursWithDeclaredType [
	^ behavioursWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> behavioursWithDeclaredType: aValue [
	behavioursWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'*OrionFamixJava' }
ORActionAddEnum >> definedAnnotationTypes [
	^ definedAnnotationTypes
]

{ #category : #'*OrionFamixJava' }
ORActionAddEnum >> definedAnnotationTypes: aValue [
	definedAnnotationTypes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> incomingReferences [
	^ incomingReferences
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> incomingReferences: aValue [
	incomingReferences := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> methods [
	^ methods
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> methods: aValue [
	methods := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddEnum >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := OREnum new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self isStub ifNotNil: [ :e | 
		newEntity privateIsStub: e orionCopy ].

	self modifiers isEmptyOrNil ifFalse: [ 
		newEntity privateModifiers: self modifiers orionCopy ].

	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	"Set complex not derived properties of the entity"
	self declaredSourceLanguage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self declaredSourceLanguage.
			newEntity privateDeclaredSourceLanguage: theNewEntity orionCopy.
			theNewEntity privateSourcedEntities: (theNewEntity privateSourcedEntities orionCopy unsafeAdd: newEntity) ].

	self container
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self container.
			newEntity privateContainer: theNewEntity orionCopy.
			theNewEntity privateTypes: (theNewEntity privateTypes orionCopy unsafeAdd: newEntity) ].

	self annotationInstances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self annotationInstances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateAnnotationInstances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateAnnotatedEntity: newEntity ] ].

	self structuresWithDeclaredType
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self structuresWithDeclaredType collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateStructuresWithDeclaredType: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDeclaredType: newEntity ] ].

	self parentPackage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentPackage.
			newEntity privateParentPackage: theNewEntity orionCopy.
			theNewEntity privateChildNamedEntities: (theNewEntity privateChildNamedEntities orionCopy unsafeAdd: newEntity) ].

	self subInheritances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self subInheritances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateSubInheritances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateSuperclass: newEntity ] ].

	self types
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self types collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateTypes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self attributes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self attributes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateAttributes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentType: newEntity ] ].

	self behavioursWithDeclaredType
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self behavioursWithDeclaredType collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateBehavioursWithDeclaredType: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDeclaredType: newEntity ] ].

	self functions
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self functions collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateFunctions: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self incomingReferences
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self incomingReferences collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateIncomingReferences: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateTarget: newEntity ] ].

	self superInheritances
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self superInheritances collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateSuperInheritances: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateSubclass: newEntity ] ].

	self receivingInvocations
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self receivingInvocations collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateReceivingInvocations: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateReceiver: newEntity ] ].

	self sourceAnchor
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self sourceAnchor.
			newEntity privateSourceAnchor: theNewEntity orionCopy.
			theNewEntity privateElement: newEntity orionCopy ].

	self values
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self values collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateValues: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentEnum: newEntity ] ].

	self methods
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self methods collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateMethods: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentType: newEntity ] ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #'*OrionFamixJava' }
ORActionAddEnum >> runOnJavaExtension: newEntity [
	<toRun>
	<generated: true>
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self definedAnnotationTypes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self definedAnnotationTypes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateDefinedAnnotationTypes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

]

{ #category : #'accessing - generated' }
ORActionAddEnum >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> structuresWithDeclaredType [
	^ structuresWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> structuresWithDeclaredType: aValue [
	structuresWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> subInheritances [
	^ subInheritances
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> subInheritances: aValue [
	subInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> superInheritances [
	^ superInheritances
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> superInheritances: aValue [
	superInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> types: aValue [
	types := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> values [
	^ values
]

{ #category : #'accessing - generated' }
ORActionAddEnum >> values: aValue [
	values := aValue
]
