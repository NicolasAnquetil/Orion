"
A ORActionMovePackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionMovePackage,
	#superclass : #ORActionMove,
	#instVars : [
		'parentScope',
		'parentPackage'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionMovePackage class >> description [
	^'move package'
]

{ #category : #'accessing - generated' }
ORActionMovePackage >> parentPackage [
	^ parentPackage
]

{ #category : #'accessing - generated' }
ORActionMovePackage >> parentPackage: aValue [
	parentPackage := aValue
]

{ #category : #'accessing - generated' }
ORActionMovePackage >> parentScope [
	^ parentScope
]

{ #category : #'accessing - generated' }
ORActionMovePackage >> parentScope: aValue [
	parentScope := aValue
]

{ #category : #'method execution - generated' }
ORActionMovePackage >> run [
	<generated: true>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentScope ifNotNil: [
		| theNewContainer |
		entity parentScope
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentScope.
				theOldContainer privateChildScopes: (theOldContainer privateChildScopes orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentScope.
		theEntity privateParentScope: theNewContainer.
		theNewContainer privateChildScopes: (theNewContainer privateChildScopes orionCopy unsafeAdd: theEntity)
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
