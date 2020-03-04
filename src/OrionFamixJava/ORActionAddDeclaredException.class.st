"
A ORActionAddDeclaredException is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddDeclaredException,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'definingMethod',
		'exceptionClass'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionAddDeclaredException >> definingMethod [
	^ definingMethod
]

{ #category : #'accessing - generated' }
ORActionAddDeclaredException >> definingMethod: aValue [
	definingMethod := aValue
]

{ #category : #'accessing - generated' }
ORActionAddDeclaredException >> exceptionClass [
	^ exceptionClass
]

{ #category : #'accessing - generated' }
ORActionAddDeclaredException >> exceptionClass: aValue [
	exceptionClass := aValue
]

{ #category : #'method execution - generated' }
ORActionAddDeclaredException >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORDeclaredException new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self definingMethod
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self definingMethod.
			newEntity privateDefiningMethod: theNewEntity orionCopy.
			theNewEntity privateDeclaredExceptions: (theNewEntity privateDeclaredExceptions orionCopy unsafeAdd: newEntity) ].

	self exceptionClass
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self exceptionClass.
			newEntity privateExceptionClass: theNewEntity orionCopy.
			theNewEntity privateExceptions: (theNewEntity privateExceptions orionCopy unsafeAdd: newEntity) ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
