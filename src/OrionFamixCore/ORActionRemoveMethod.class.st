"
A ORActionRemoveMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveMethod,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveMethod >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity accesses do: [ :e | e deleteInAction: self ].
	entity parameters do: [ :e | e deleteInAction: self ].
	entity outgoingReferences do: [ :e | e deleteInAction: self ].
	entity incomingInvocations do: [ :e | e deleteInAction: self ].
	entity types do: [ :e | e deleteInAction: self ].
	entity annotationInstances do: [ :e | e deleteInAction: self ].
	entity localVariables do: [ :e | e deleteInAction: self ].
	entity functions do: [ :e | e deleteInAction: self ].
	entity implicitVariables do: [ :e | e deleteInAction: self ].
	entity outgoingInvocations do: [ :e | e deleteInAction: self ].
	entity receivingInvocations do: [ :e | e deleteInAction: self ].
	entity declaredType
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredType.
			theEntity privateBehavioursWithDeclaredType: (theEntity privateBehavioursWithDeclaredType orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity parentType
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentType.
			theEntity privateMethods: (theEntity privateMethods orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
