method execution - generated
run
	<generated: false>
	| theEntity |
	theEntity := self orionModel retrieveEntity: entity.
	self parentType ifNotNil: [
		| theNewContainer |
		entity parentType
			ifNotNil: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentType.
				theOldContainer privateMethods: (theOldContainer privateMethods orionCopy orionRemove: theEntity) ].
		theNewContainer := self orionModel retrieveEntity: self parentType.
		theEntity privateParentType: theNewContainer.
		theNewContainer privateMethods: (theNewContainer privateMethods orionCopy unsafeAdd: theEntity).
		
		"---------------- Pharo specificities --------------------"
		"The following lines are added to un extend method if it is move to a class belonging to the same package than the extended package. The new parent package is put to nil and the method is removed from the childNamedEntities of the package. This cannot be generated"
		(theEntity parentPackage notNil and: [theEntity parentPackage = theNewContainer parentPackage] ) ifTrue: [ | theOldContainer |
				theOldContainer := self orionModel retrieveEntity: entity parentPackage.
				theOldContainer privateChildNamedEntities: (theOldContainer privateChildNamedEntities orionCopy orionRemove: theEntity).
				theEntity privateParentPackage: nil  ]
		"------------- end of Pharo specificities ----------------"	
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