"
A ORActionMoveLocalVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveLocalVariable,
	#superclass : #ORActionMove,
	#instVars : [
		'parentBehaviouralEntity',
		'parentPackage'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionMoveLocalVariable >> parentBehaviouralEntity [
	^ parentBehaviouralEntity
]

{ #category : #'accessing - generated' }
ORActionMoveLocalVariable >> parentBehaviouralEntity: aValue [
	parentBehaviouralEntity := aValue
]

{ #category : #'accessing - generated' }
ORActionMoveLocalVariable >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveLocalVariable >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveLocalVariable >> run [
	<generated: true>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentBehaviouralEntity ifNotNil: [
		| theNewContainer |
		entity parentBehaviouralEntity
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentBehaviouralEntity.
				theOldContainer privateLocalVariables: (theOldContainer privateLocalVariables orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentBehaviouralEntity.
		theEntity privateParentBehaviouralEntity: theNewContainer.
		theNewContainer privateLocalVariables: (theNewContainer privateLocalVariables orionCopy unsafeAdd: theEntity)
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
