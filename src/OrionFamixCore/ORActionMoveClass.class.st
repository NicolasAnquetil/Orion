"
A ORActionMoveClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMoveClass,
	#superclass : #ORActionMove,
	#instVars : [
		'container',
		'parentPackage'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionMoveClass class >> description [
	^'move class'
]

{ #category : #'as yet unclassified' }
ORActionMoveClass class >> needs: anElement [
	^anElement currentContext allModelPackages reject:[:ea | ea = anElement parentPackage]
]

{ #category : #'as yet unclassified' }
ORActionMoveClass class >> scope [
	<OrionActionFor: #ORClass>
	^self
]

{ #category : #'accessing - generated' }
ORActionMoveClass >> container [
	^ container
]

{ #category : #'accessing - generated' }
ORActionMoveClass >> container: aValue [
	container := aValue
]

{ #category : #'accessing - generated' }
ORActionMoveClass >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMoveClass >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'method execution - generated' }
ORActionMoveClass >> run [
	<generated: true>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
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
