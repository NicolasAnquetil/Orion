"
A ORActionAddAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddAttribute,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'dereferencedInvocations',
		'declaredType',
		'comments',
		'name',
		'modifiers',
		'annotationInstances',
		'incomingAccesses',
		'declaredSourceLanguage',
		'hasClassScope',
		'parentType',
		'isStub',
		'parentPackage',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddAttribute >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> declaredType [
	^ declaredType
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> declaredType: aValue [
	declaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> hasClassScope [
	^ hasClassScope
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> hasClassScope: aValue [
	hasClassScope := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> incomingAccesses [
	^ incomingAccesses
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> incomingAccesses: aValue [
	incomingAccesses := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> parentType [
	^ parentType
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> parentType: aValue [
	parentType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddAttribute >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORAttribute new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
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
			theNewEntity privateStructuresWithDeclaredType: (theNewEntity privateStructuresWithDeclaredType orionCopy unsafeAdd: newEntity) ].

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

	self incomingAccesses
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self incomingAccesses collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateIncomingAccesses: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateVariable: newEntity ] ].

	self declaredSourceLanguage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self declaredSourceLanguage.
			newEntity privateDeclaredSourceLanguage: theNewEntity orionCopy.
			theNewEntity privateSourcedEntities: (theNewEntity privateSourcedEntities orionCopy unsafeAdd: newEntity) ].

	self parentType
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentType.
			newEntity privateParentType: theNewEntity orionCopy.
			theNewEntity privateAttributes: (theNewEntity privateAttributes orionCopy unsafeAdd: newEntity) ].

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
ORActionAddAttribute >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddAttribute >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
