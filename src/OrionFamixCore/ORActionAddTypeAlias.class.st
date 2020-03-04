"
A ORActionAddTypeAlias is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddTypeAlias,
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
		'aliasedType',
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
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> aliasedType [
	^ aliasedType
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> aliasedType: aValue [
	aliasedType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> attributes [
	^ attributes
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> attributes: aValue [
	attributes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> behavioursWithDeclaredType [
	^ behavioursWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> behavioursWithDeclaredType: aValue [
	behavioursWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> incomingReferences [
	^ incomingReferences
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> incomingReferences: aValue [
	incomingReferences := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> methods [
	^ methods
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> methods: aValue [
	methods := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddTypeAlias >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORTypeAlias new.
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

	self aliasedType
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self aliasedType.
			newEntity privateAliasedType: theNewEntity orionCopy.
			theNewEntity privateTypeAliases: (theNewEntity privateTypeAliases orionCopy unsafeAdd: newEntity) ].

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

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> structuresWithDeclaredType [
	^ structuresWithDeclaredType
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> structuresWithDeclaredType: aValue [
	structuresWithDeclaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> subInheritances [
	^ subInheritances
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> subInheritances: aValue [
	subInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> superInheritances [
	^ superInheritances
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> superInheritances: aValue [
	superInheritances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddTypeAlias >> types: aValue [
	types := aValue
]
