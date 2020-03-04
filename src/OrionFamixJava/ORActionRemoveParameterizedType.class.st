"
A ORActionRemoveParameterizedType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveParameterizedType,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixJava-Action'
}

{ #category : #'method execution - generated' }
ORActionRemoveParameterizedType >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity annotationInstances do: [ :e | e deleteInAction: self ].
	entity subInheritances do: [ :e | e deleteInAction: self ].
	entity types do: [ :e | e deleteInAction: self ].
	entity attributes do: [ :e | e deleteInAction: self ].
	entity functions do: [ :e | e deleteInAction: self ].
	entity incomingReferences do: [ :e | e deleteInAction: self ].
	entity superInheritances do: [ :e | e deleteInAction: self ].
	entity receivingInvocations do: [ :e | e deleteInAction: self ].
	entity methods do: [ :e | e deleteInAction: self ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity container
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity container.
			theEntity privateTypes: (theEntity privateTypes orionCopy orionRemove: entity) ].
	entity parentPackage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parentPackage.
			theEntity privateChildNamedEntities: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity parameterizableClass
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity parameterizableClass.
			theEntity privateParameterizedTypes: (theEntity privateParameterizedTypes orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterizedType >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
