"
A ORActionMoveImplicitVariable is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveImplicitVariable,
	#superclass : #ORActionMove,
	#instVars : [
		'parentBehaviouralEntity',
		'parentPackage'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionMoveImplicitVariable >> parentBehaviouralEntity [
	^ parentBehaviouralEntity
]

{ #category : #'accessing - generated' }
ORActionMoveImplicitVariable >> parentBehaviouralEntity: aValue [
	parentBehaviouralEntity := aValue
]

{ #category : #'accessing - generated' }
ORActionMoveImplicitVariable >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveImplicitVariable >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveImplicitVariable >> run [
	<generated: true>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentBehaviouralEntity ifNotNil: [
		| theNewContainer |
		entity parentBehaviouralEntity
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentBehaviouralEntity.
				theOldContainer privateImplicitVariables: (theOldContainer privateImplicitVariables orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentBehaviouralEntity.
		theEntity privateParentBehaviouralEntity: theNewContainer.
		theNewContainer privateImplicitVariables: (theNewContainer privateImplicitVariables orionCopy unsafeAdd: theEntity)
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
