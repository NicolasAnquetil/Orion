"
A ORActionRemoveSourceAnchor is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveSourceAnchor,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveSourceAnchor >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
