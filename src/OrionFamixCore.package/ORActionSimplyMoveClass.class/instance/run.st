method execution
run
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