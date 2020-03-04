"
A ORActionAddParameterizableClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddParameterizableClass,
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
		'isInterface',
		'attributes',
		'modifiers',
		'behavioursWithDeclaredType',
		'functions',
		'comments',
		'incomingReferences',
		'superInheritances',
		'receivingInvocations',
		'sourceAnchor',
		'parameterizedTypes',
		'methods',
		'name'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> attributes [
	^ attributes
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> attributes: aValue [
	attributes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> behavioursWithDeclaredType [
	^ behavioursWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> behavioursWithDeclaredType: aValue [
	behavioursWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'*OrionFamixJava' }
ORActionAddParameterizableClass >> definedAnnotationTypes [
	^ definedAnnotationTypes
]

{ #category : #'*OrionFamixJava' }
ORActionAddParameterizableClass >> definedAnnotationTypes: aValue [
	definedAnnotationTypes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> incomingReferences [
	^ incomingReferences
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> incomingReferences: aValue [
	incomingReferences := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> isInterface [
	^ isInterface
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> isInterface: aValue [
	isInterface := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> methods [
	^ methods
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> methods: aValue [
	methods := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> parameterizedTypes [
	^ parameterizedTypes
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> parameterizedTypes: aValue [
	parameterizedTypes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddParameterizableClass >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORParameterizableClass new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self isStub ifNotNil: [ :e | 
		newEntity privateIsStub: e orionCopy ].

	self isInterface ifNotNil: [ :e | 
		newEntity privateIsInterface: e orionCopy ].

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

	self parameterizedTypes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self parameterizedTypes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateParameterizedTypes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParameterizableClass: newEntity ] ].

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
ORActionAddParameterizableClass >> runOnJavaExtension: newEntity [
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
ORActionAddParameterizableClass >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> structuresWithDeclaredType [
	^ structuresWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> structuresWithDeclaredType: aValue [
	structuresWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> subInheritances [
	^ subInheritances
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> subInheritances: aValue [
	subInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> superInheritances [
	^ superInheritances
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> superInheritances: aValue [
	superInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddParameterizableClass >> types: aValue [
	types := aValue
]
