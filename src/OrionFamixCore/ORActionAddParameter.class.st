"
A ORActionAddParameter is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddParameter,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'dereferencedInvocations',
		'declaredType',
		'comments',
		'name',
		'parentBehaviouralEntity',
		'modifiers',
		'annotationInstances',
		'incomingAccesses',
		'declaredSourceLanguage',
		'isStub',
		'parentPackage',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddParameter >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> declaredType [
	^ declaredType
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> declaredType: aValue [
	declaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> incomingAccesses [
	^ incomingAccesses
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> incomingAccesses: aValue [
	incomingAccesses := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> parentBehaviouralEntity [
	^ parentBehaviouralEntity
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> parentBehaviouralEntity: aValue [
	parentBehaviouralEntity := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddParameter >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORParameter new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
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
			theNewEntity privateStructuresWithDeclaredType: (theNewEntity privateStructuresWithDeclaredType orionCopy unsafeAdd: newEntity) ].

	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self parentBehaviouralEntity
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentBehaviouralEntity.
			newEntity privateParentBehaviouralEntity: theNewEntity orionCopy.
			theNewEntity privateParameters: (theNewEntity privateParameters orionCopy unsafeAdd: newEntity) ].

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
ORActionAddParameter >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddParameter >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
