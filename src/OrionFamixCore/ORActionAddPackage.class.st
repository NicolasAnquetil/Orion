"
A ORActionAddPackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddPackage,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definedAnnotationTypes',
		'childScopes',
		'comments',
		'childNamedEntities',
		'name',
		'modifiers',
		'types',
		'annotationInstances',
		'functions',
		'declaredSourceLanguage',
		'parentScope',
		'isStub',
		'parentPackage',
		'globalVariables',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddPackage >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> childNamedEntities [
	^ childNamedEntities
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> childNamedEntities: aValue [
	childNamedEntities := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> childScopes [
	^ childScopes
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> childScopes: aValue [
	childScopes := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> functions [
	^ functions
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> functions: aValue [
	functions := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> globalVariables [
	^ globalVariables
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> globalVariables: aValue [
	globalVariables := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> parentScope [
	^ parentScope
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> parentScope: aValue [
	parentScope := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddPackage >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORPackage new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	self modifiers isEmptyOrNil ifFalse: [ 
		newEntity privateModifiers: self modifiers orionCopy ].

	self isStub ifNotNil: [ :e | 
		newEntity privateIsStub: e orionCopy ].

	"Set complex not derived properties of the entity"
	self childScopes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self childScopes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateChildScopes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentScope: newEntity ] ].

	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self childNamedEntities
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self childNamedEntities collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateChildNamedEntities: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentPackage: newEntity ] ].

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

	self parentScope
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentScope.
			newEntity privateParentScope: theNewEntity orionCopy.
			theNewEntity privateChildScopes: (theNewEntity privateChildScopes orionCopy unsafeAdd: newEntity) ].

	self parentPackage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentPackage.
			newEntity privateParentPackage: theNewEntity orionCopy.
			theNewEntity privateChildNamedEntities: (theNewEntity privateChildNamedEntities orionCopy unsafeAdd: newEntity) ].

	self globalVariables
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self globalVariables collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateGlobalVariables: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateParentScope: newEntity ] ].

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
ORActionAddPackage >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> sourceAnchor: aValue [
	sourceAnchor := aValue
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> types [
	^ types
]

{ #category : #'accessing - generated' }
ORActionAddPackage >> types: aValue [
	types := aValue
]
