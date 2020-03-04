method execution - generated
run
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