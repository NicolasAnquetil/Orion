"
A ORActionAddMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddMethod,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'timeStamp',
		'category',
		'caughtExceptions',
		'definedAnnotationTypes',
		'thrownExceptions',
		'declaredExceptions',
		'activations',
		'declaredType',
		'comments',
		'signature',
		'kind',
		'name',
		'accesses',
		'parameters',
		'modifiers',
		'outgoingReferences',
		'incomingInvocations',
		'types',
		'annotationInstances',
		'localVariables',
		'functions',
		'hasClassScope',
		'declaredSourceLanguage',
		'implicitVariables',
		'parentType',
		'outgoingInvocations',
		'isStub',
		'parentPackage',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddMethod >> accesses [
	^ accesses
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> accesses: aValue [
	accesses := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> declaredType [
	^ declaredType
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> declaredType: aValue [
	declaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> hasClassScope [
	^ hasClassScope
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> hasClassScope: aValue [
	hasClassScope := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> implicitVariables [
	^ implicitVariables
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> implicitVariables: aValue [
	implicitVariables := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> incomingInvocations [
	^ incomingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> incomingInvocations: aValue [
	incomingInvocations := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> kind [
	^ kind
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> kind: aValue [
	kind := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> localVariables [
	^ localVariables
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> localVariables: aValue [
	localVariables := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> outgoingInvocations [
	^ outgoingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> outgoingInvocations: aValue [
	outgoingInvocations := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> outgoingReferences [
	^ outgoingReferences
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> outgoingReferences: aValue [
	outgoingReferences := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> parameters [
	^ parameters
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> parameters: aValue [
	parameters := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> parentType [
	^ parentType
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> parentType: aValue [
	parentType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddMethod >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORMethod new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self signature ifNotNil: [ :e | 
		newEntity privateSignature: e orionCopy ].

	self kind ifNotNil: [ :e | 
		newEntity privateKind: e orionCopy ].

	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	self modifiers isEmptyOrNil ifFalse: [ 
		newEntity privateModifiers: self modifiers orionCopy ].

	self hasClassScope ifNotNil: [ :e | 
		newEntity privateHasClassScope: e orionCopy ].

	self isStub ifNotNil: [ :e | 
		newEntity privateIsStub: e orionCopy ].

	"Set complex not derived properties of the entity"
	self declaredType
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self declaredType.
			newEntity privateDeclaredType: theNewEntity orionCopy.
			theNewEntity privateBehavioursWithDeclaredType: (theNewEntity privateBehavioursWithDeclaredType orionCopy unsafeAdd: newEntity) ].

	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self accesses
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self accesses collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateAccesses: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateAccessor: newEntity ] ].

	self parameters
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self parameters collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateParameters: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentBehaviouralEntity: newEntity ] ].

	self outgoingReferences
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self outgoingReferences collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateOutgoingReferences: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateSource: newEntity ] ].

	self incomingInvocations
		ifNotNil: [ | theNewEntity |
			self incomingInvocations do: [ :anEntity | 
			theNewEntity := self orionModel retrieveEntity: anEntity.
			newEntity privateIncomingInvocations: (newEntity privateIncomingInvocations orionCopy unsafeAdd: theNewEntity).
			theNewEntity privateCandidates: (theNewEntity privateCandidates orionCopy unsafeAdd: newEntity) ] ] .

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

	self localVariables
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self localVariables collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateLocalVariables: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentBehaviouralEntity: newEntity ] ].

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

	self implicitVariables
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self implicitVariables collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateImplicitVariables: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentBehaviouralEntity: newEntity ] ].

	self parentType
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentType.
			newEntity privateParentType: theNewEntity orionCopy.
			theNewEntity privateMethods: (theNewEntity privateMethods orionCopy unsafeAdd: newEntity) ].

	self outgoingInvocations
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self outgoingInvocations collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateOutgoingInvocations: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateSender: newEntity ] ].

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
ORActionAddMethod >> signature [
	^ signature
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> signature: aValue [
	signature := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddMethod >> types: aValue [
	types := aValue
]
