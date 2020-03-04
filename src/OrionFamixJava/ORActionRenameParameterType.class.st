"
A ORActionRenameParameterType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRenameParameterType,
	#superclass : #ORActionRename,
	#category : 'OrionFamixJava-Action'
}

{ #category : #'method exectution - generated' }
ORActionRenameParameterType >> run [
	<generated: true>
	| theEntity |
	super run.
	theEntity := (self orionModel retrieveEntity: entity).
	theEntity name: newName.
	entity := theEntity.
	^ entity
]
