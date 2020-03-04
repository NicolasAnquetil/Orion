"
A ORActionSimplyMoveClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionSimplyMoveClass,
	#superclass : #ORActionMove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionSimplyMoveClass class >> description [
	^'move class without its content'
]

{ #category : #'method execution' }
ORActionSimplyMoveClass >> run [
	| theClass theOldContainer theNewContainer |
	super run.
	theClass := self orionModel retrieveEntity: entity.
	theNewContainer := self orionModel retrieveEntity: newContainer.
	(theNewContainer isKindOf: FAMIXPackage)
		ifTrue: [ 
			theClass parentPackage
				ifNotNil: [ 
					theOldContainer := self orionModel retrieveEntity: theClass parentPackage.
					theOldContainer
						privateChildNamedEntities: (theOldContainer privateChildNamedEntities orionCopy orionRemove: theClass) ].
			theNewContainer privateChildNamedEntities: (theNewContainer privateChildNamedEntities orionCopy unsafeAdd: theClass).
			theClass privateParentPackage: theNewContainer ]
		ifFalse: [ 
			(theNewContainer isKindOf: FAMIXNamespace)
				ifTrue: [ 
					theClass container
						ifNotNil: [ 
							theOldContainer := self orionModel retrieveEntity: theClass container.
							theOldContainer privateTypes: (theOldContainer privateTypes orionCopy orionRemove: theClass) ].
					theNewContainer privateTypes: (theNewContainer privateTypes orionCopy unsafeAdd: theClass).
					theClass privateContainer: theNewContainer ]
				ifFalse: [ MessageNotUnderstood signal: 'privateChildNamedEntities or privateTypes' ] ].
			theClass resetMooseName.
	^ theClass
]
