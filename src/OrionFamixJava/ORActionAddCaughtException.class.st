"
A ORActionAddCaughtException is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddCaughtException,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definingMethod',
		'exceptionClass'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionAddCaughtException >> definingMethod [
	^ definingMethod
]

{ #category : #'accessing - generated' }
ORActionAddCaughtException >> definingMethod: aValue [
	definingMethod := aValue
]

{ #category : #'accessing - generated' }
ORActionAddCaughtException >> exceptionClass [
	^ exceptionClass
]

{ #category : #'accessing - generated' }
ORActionAddCaughtException >> exceptionClass: aValue [
	exceptionClass := aValue
]

{ #category : #'method execution - generated' }
ORActionAddCaughtException >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORCaughtException new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self definingMethod
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self definingMethod.
			newEntity privateDefiningMethod: theNewEntity orionCopy.
			theNewEntity privateCaughtExceptions: (theNewEntity privateCaughtExceptions orionCopy unsafeAdd: newEntity) ].

	self exceptionClass
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self exceptionClass.
			newEntity privateExceptionClass: theNewEntity orionCopy.
			theNewEntity privateExceptions: (theNewEntity privateExceptions orionCopy unsafeAdd: newEntity) ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
