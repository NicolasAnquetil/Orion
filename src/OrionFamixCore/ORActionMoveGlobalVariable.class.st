"
A ORActionMoveGlobalVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveGlobalVariable,
	#superclass : #ORActionMove,
	#instVars : [
		'parentScope',
		'parentPackage'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionMoveGlobalVariable >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveGlobalVariable >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionMoveGlobalVariable >> parentScope [
	^ parentScope
]

{ #category : #'accessing - generated' }
ORActionMoveGlobalVariable >> parentScope: aValue [
	parentScope := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveGlobalVariable >> run [
	<generated: true>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentScope ifNotNil: [
		| theNewContainer |
		entity parentScope
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentScope.
				theOldContainer privateGlobalVariables: (theOldContainer privateGlobalVariables orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentScope.
		theEntity privateParentScope: theNewContainer.
		theNewContainer privateGlobalVariables: (theNewContainer privateGlobalVariables orionCopy unsafeAdd: theEntity)
	].
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
	theEntity resetMooseName.
	^ theEntity
]
