method execution
run
	| newMethod theNewClass theNewPackage theOldPackage |
	super run.
	newMethod := (self orionModel retrieveEntity:entity).
		
	theOldPackage := (self orionModel retrieveEntity:entity parentPackage).
	theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities orionCopy orionRemove: newMethod).
	
	theNewClass := (self orionModel retrieveEntity:entity parentType).
	theNewClass extendedInPackages remove: entity parentPackage.
	
	theNewPackage := (self orionModel retrieveEntity: theNewClass parentPackage).
	
	newMethod privateParentPackage: theNewPackage.
	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newMethod).

	^newMethod