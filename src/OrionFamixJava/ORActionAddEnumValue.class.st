"
A ORActionAddEnumValue is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddEnumValue,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'dereferencedInvocations',
		'declaredType',
		'comments',
		'parentEnum',
		'name',
		'modifiers',
		'annotationInstances',
		'incomingAccesses',
		'declaredSourceLanguage',
		'isStub',
		'parentPackage',
		'sourceAnchor',
		'receivingInvocations'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> annotationInstances [
	^ annotationInstances
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> annotationInstances: aValue [
	annotationInstances := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> comments [
	^ comments
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> comments: aValue [
	comments := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> declaredSourceLanguage [
	^ declaredSourceLanguage
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> declaredSourceLanguage: aValue [
	declaredSourceLanguage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> declaredType [
	^ declaredType
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> declaredType: aValue [
	declaredType := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> incomingAccesses [
	^ incomingAccesses
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> incomingAccesses: aValue [
	incomingAccesses := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> isStub [
	^ isStub
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> isStub: aValue [
	isStub := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> modifiers [
	^ modifiers
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> modifiers: aValue [
	modifiers := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> name: aValue [
	name := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> parentEnum [
	^ parentEnum
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> parentEnum: aValue [
	parentEnum := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> receivingInvocations [
	^ receivingInvocations
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> receivingInvocations: aValue [
	receivingInvocations := aValue
]

{ #category : #'method execution - generated' }
ORActionAddEnumValue >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := OREnumValue new.
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

	self parentEnum
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentEnum.
			newEntity privateParentEnum: theNewEntity orionCopy.
			theNewEntity privateValues: (theNewEntity privateValues orionCopy unsafeAdd: newEntity) ].

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
ORActionAddEnumValue >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #'accessing - generated' }
ORActionAddEnumValue >> sourceAnchor: aValue [
	sourceAnchor := aValue
]
