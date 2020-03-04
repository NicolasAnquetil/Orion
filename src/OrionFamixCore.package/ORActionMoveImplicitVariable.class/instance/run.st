method execution - generated
run
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