"
A ORActionRemoveAnnotationInstance is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveAnnotationInstance,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveAnnotationInstance >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity attributes do: [ :e | e deleteInAction: self ].
	entity annotatedEntity
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity annotatedEntity.
			theEntity privateAnnotationInstances: (theEntity privateAnnotationInstances orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity annotationType
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity annotationType.
			theEntity privateInstances: (theEntity privateInstances orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
