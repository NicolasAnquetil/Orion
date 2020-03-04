"
A ORActionRenameGlobalVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRenameGlobalVariable,
	#superclass : #ORActionRename,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method exectution - generated' }
ORActionRenameGlobalVariable >> run [
	<generated: true>
	| theEntity |
	super run.
	theEntity := (self orionModel retrieveEntity: entity).
	theEntity name: newName.
	entity := theEntity.
	^ entity
]
