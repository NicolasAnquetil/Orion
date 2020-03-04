"
A ORActionRemovePrimitiveType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemovePrimitiveType,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemovePrimitiveType >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity incomingReferences do: [ :e | e deleteInAction: self ].
	entity types do: [ :e | e deleteInAction: self ].
	entity annotationInstances do: [ :e | e deleteInAction: self ].
	entity methods do: [ :e | e deleteInAction: self ].
	entity functions do: [ :e | e deleteInAction: self ].
	entity attributes do: [ :e | e deleteInAction: self ].
	entity subInheritances do: [ :e | e deleteInAction: self ].
	entity superInheritances do: [ :e | e deleteInAction: self ].
	entity receivingInvocations do: [ :e | e deleteInAction: self ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity container
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity container.
			theEntity privateTypes: (theEntity privateTypes orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
