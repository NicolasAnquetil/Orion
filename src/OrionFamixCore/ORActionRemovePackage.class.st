"
A ORActionRemovePackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemovePackage,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemovePackage >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity childScopes do: [ :e | e deleteInAction: self ].
	entity childNamedEntities do: [ :e | e deleteInAction: self ].
	entity types do: [ :e | e deleteInAction: self ].
	entity annotationInstances do: [ :e | e deleteInAction: self ].
	entity functions do: [ :e | e deleteInAction: self ].
	entity globalVariables do: [ :e | e deleteInAction: self ].
	entity receivingInvocations do: [ :e | e deleteInAction: self ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity parentScope
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentScope.
			theEntity privateChildScopes: (theEntity privateChildScopes orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
