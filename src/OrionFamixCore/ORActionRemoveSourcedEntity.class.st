"
A ORActionRemoveSourcedEntity is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveSourcedEntity,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveSourcedEntity >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
