"
A ORActionMoveAnnotationTypeAttribute is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveAnnotationTypeAttribute,
	#superclass : #ORActionMove,
	#instVars : [
		'parentType',
		'parentPackage'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionMoveAnnotationTypeAttribute >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveAnnotationTypeAttribute >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionMoveAnnotationTypeAttribute >> parentType [
	^ parentType
]

{ #category : #'accessing - generated' }
ORActionMoveAnnotationTypeAttribute >> parentType: aValue [
	parentType := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveAnnotationTypeAttribute >> run [
	<generated: true>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentType ifNotNil: [
		| theNewContainer |
		entity parentType
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentType.
				theOldContainer privateAttributes: (theOldContainer privateAttributes orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentType.
		theEntity privateParentType: theNewContainer.
		theNewContainer privateAttributes: (theNewContainer privateAttributes orionCopy unsafeAdd: theEntity)
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
