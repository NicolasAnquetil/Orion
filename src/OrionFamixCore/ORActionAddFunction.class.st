"
A ORActionAddFunction is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddFunction,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definedAnnotationTypes',
		'activations',
		'declaredType',
		'comments',
		'signature',
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
		'declaredSourceLanguage',
		'implicitVariables',
		'outgoingInvocations',
		'isStub',
		'parentPackage',
		'container',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddFunction >> accesses [
	^ accesses
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> accesses: aValue [
	accesses := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> declaredType [
	^ declaredType
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> declaredType: aValue [
	declaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> implicitVariables [
	^ implicitVariables
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> implicitVariables: aValue [
	implicitVariables := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> incomingInvocations [
	^ incomingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> incomingInvocations: aValue [
	incomingInvocations := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> localVariables [
	^ localVariables
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> localVariables: aValue [
	localVariables := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> outgoingInvocations [
	^ outgoingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> outgoingInvocations: aValue [
	outgoingInvocations := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> outgoingReferences [
	^ outgoingReferences
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> outgoingReferences: aValue [
	outgoingReferences := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> parameters [
	^ parameters
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> parameters: aValue [
	parameters := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddFunction >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORFunction new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self signature ifNotNil: [ :e | 
		newEntity privateSignature: e orionCopy ].

	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	self modifiers isEmptyOrNil ifFalse: [ 
		newEntity privateModifiers: self modifiers orionCopy ].

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

	self container
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self container.
			newEntity privateContainer: theNewEntity orionCopy.
			theNewEntity privateFunctions: (theNewEntity privateFunctions orionCopy unsafeAdd: newEntity) ].

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
ORActionAddFunction >> signature [
	^ signature
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> signature: aValue [
	signature := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddFunction >> types: aValue [
	types := aValue
]
