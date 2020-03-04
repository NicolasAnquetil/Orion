method execution - generated
run
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