method execution
run
	| newMethod theNewClass theNewPackage theOldPackage |
	self flag: #fixme.	"should probably not inherit from ORActionMove"
	self flag: 'En fait c''est juste un changement de containement? donc c''est deja présent dans le move..'.
	super run.
	newMethod := self orionModel retrieveEntity: entity.
	entity parentPackage
		ifNil: [ ((entity isKindOf: FAMIXClass) and: [ entity parentType parentPackage notNil ])
				ifTrue: [ theOldPackage := self orionModel retrieveEntity: entity entity parentType parentPackage.
					theOldPackage privateChildNamedEntities: (theOldPackage privateChildNamedEntities orionCopy orionRemove: newMethod) ] ]
		ifNotNil: [ theOldPackage := self orionModel retrieveEntity: entity parentPackage.
			theOldPackage privateChildNamedEntities: (theOldPackage privateChildNamedEntities orionCopy orionRemove: newMethod) ].
	theNewPackage := self orionModel retrieveEntity: newContainer.
	newMethod privateParentPackage: theNewPackage orionCopy.
	theNewPackage privateChildNamedEntities: (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newMethod).
	theNewClass := self orionModel retrieveEntity: entity parentType.
	^ newMethod