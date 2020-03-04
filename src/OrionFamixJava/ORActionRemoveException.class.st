"
A ORActionRemoveException is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveException,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixJava-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveException >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity exceptionClass
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity exceptionClass.
			theEntity privateExceptions: (theEntity privateExceptions orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
