"
A ORActionAddException is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddException,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'exceptionClass'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionAddException >> exceptionClass [
	^ exceptionClass
]

{ #category : #'accessing - generated' }
ORActionAddException >> exceptionClass: aValue [
	exceptionClass := aValue
]

{ #category : #'method execution - generated' }
ORActionAddException >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORException new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self exceptionClass
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self exceptionClass.
			newEntity privateExceptionClass: theNewEntity orionCopy.
			theNewEntity privateExceptions: (theNewEntity privateExceptions orionCopy unsafeAdd: newEntity) ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
