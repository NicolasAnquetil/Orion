*Orion-Merge
setOfRemoveAnnotationTypeChanges
	^ self select: [ :chg | chg isRemoval and: [ chg entity isAnnotationType ] ]