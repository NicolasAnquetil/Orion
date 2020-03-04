"
A ORActionRemovePackageOnly is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionRemovePackageOnly,
	#superclass : #ORActionRemoveEntity,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemovePackageOnly class >> description [
	^'remove package but not its content'
]

{ #category : #'method execution' }
ORActionRemovePackageOnly >> run [
	| pack namespace|

	entity parentPackage ifNotNil: [
		pack := (self orionModel retrieveEntity: entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity parentScope ifNotNil:[
		namespace := (self orionModel retrieveEntity: entity parentScope).
		namespace privateChildScopes:  (namespace privateChildScopes orionCopy orionRemove: entity).
	].

	self orionModel remove: entity.
	

]
