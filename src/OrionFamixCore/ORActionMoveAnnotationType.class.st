"
A ORActionMoveAnnotationType is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveAnnotationType,
	#superclass : #ORActionMove,
	#instVars : [
		'parentPackage',
		'container'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionMoveAnnotationType >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionMoveAnnotationType >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionMoveAnnotationType >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveAnnotationType >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveAnnotationType >> run [
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
				theOldContainer privateDefinedAnnotationTypes: (theOldContainer privateDefinedAnnotationTypes orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self container.
		theEntity privateContainer: theNewContainer.
		theNewContainer privateDefinedAnnotationTypes: (theNewContainer privateDefinedAnnotationTypes orionCopy unsafeAdd: theEntity)
	].
	theEntity resetMooseName.
	^ theEntity
]
