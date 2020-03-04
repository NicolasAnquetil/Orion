"
A ORActionAddParameterizedType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddParameterizedType,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definedAnnotationTypes',
		'typeAliases',
		'instances',
		'arguments',
		'declaredSourceLanguage',
		'container',
		'annotationInstances',
		'structuresWithDeclaredType',
		'isStub',
		'parentPackage',
		'subInheritances',
		'types',
		'parameterizableClass',
		'attributes',
		'modifiers',
		'behavioursWithDeclaredType',
		'functions',
		'comments',
		'incomingReferences',
		'superInheritances',
		'receivingInvocations',
		'sourceAnchor',
		'methods',
		'name'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> arguments [
	^ arguments
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> arguments: aValue [
	arguments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> attributes [
	^ attributes
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> attributes: aValue [
	attributes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> behavioursWithDeclaredType [
	^ behavioursWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> behavioursWithDeclaredType: aValue [
	behavioursWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'*OrionFamixJava' }
ORActionAddParameterizedType >> definedAnnotationTypes [
	^ definedAnnotationTypes
]

{ #category : #'*OrionFamixJava' }
ORActionAddParameterizedType >> definedAnnotationTypes: aValue [
	definedAnnotationTypes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> incomingReferences [
	^ incomingReferences
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> incomingReferences: aValue [
	incomingReferences := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> methods [
	^ methods
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> methods: aValue [
	methods := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> parameterizableClass [
	^ parameterizableClass
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> parameterizableClass: aValue [
	parameterizableClass := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddParameterizedType >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORParameterizedType new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self isStub ifNotNil: [ :e | 
		newEntity privateIsStub: e orionCopy ].

	self modifiers isEmptyOrNil ifFalse: [ 
		newEntity privateModifiers: self modifiers orionCopy ].

	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	"Set complex not derived properties of the entity"
	self arguments
		ifNotNil: [ | theNewEntity |
			self arguments do: [ :anEntity | 
			theNewEntity := self orionModel retrieveEntity: anEntity.
			newEntity privateArguments: (newEntity privateArguments orionCopy unsafeAdd: theNewEntity).
			theNewEntity privateArgumentsInParameterizedTypes: (theNewEntity privateArgumentsInParameterizedTypes orionCopy unsafeAdd: newEntity) ] ] .

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

	self parameterizableClass
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parameterizableClass.
			newEntity privateParameterizableClass: theNewEntity orionCopy.
			theNewEntity privateParameterizedTypes: (theNewEntity privateParameterizedTypes orionCopy unsafeAdd: newEntity) ].

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
ORActionAddParameterizedType >> runOnJavaExtension: newEntity [
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
ORActionAddParameterizedType >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> structuresWithDeclaredType [
	^ structuresWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> structuresWithDeclaredType: aValue [
	structuresWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> subInheritances [
	^ subInheritances
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> subInheritances: aValue [
	subInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> superInheritances [
	^ superInheritances
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> superInheritances: aValue [
	superInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddParameterizedType >> types: aValue [
	types := aValue
]
