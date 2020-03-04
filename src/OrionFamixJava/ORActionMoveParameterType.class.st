"
A ORActionMoveParameterType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveParameterType,
	#superclass : #ORActionMove,
	#instVars : [
		'parentPackage',
		'container'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'accessing - generated' }
ORActionMoveParameterType >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionMoveParameterType >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionMoveParameterType >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveParameterType >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveParameterType >> run [
	<generated: true>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentPackage ifNotNil: [
		| theNewContainer |
		entity parentPackage
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentPackage.
				theOldContainer privateChildNamedEntities: (theOldContainer privateChildNamedEntities orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentPackage.
		theEntity privateParentPackage: theNewContainer.
		theNewContainer privateChildNamedEntities: (theNewContainer privateChildNamedEntities orionCopy unsafeAdd: theEntity)
	].
	self container ifNotNil: [
		| theNewContainer |
		entity container
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity container.
				theOldContainer privateTypes: (theOldContainer privateTypes orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self container.
		theEntity privateContainer: theNewContainer.
		theNewContainer privateTypes: (theNewContainer privateTypes orionCopy unsafeAdd: theEntity)
	].
	theEntity resetMooseName.
	^ theEntity
]
