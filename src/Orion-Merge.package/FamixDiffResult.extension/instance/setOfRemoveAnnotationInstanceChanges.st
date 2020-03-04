*Orion-Merge
setOfRemoveAnnotationInstanceChanges
	^ self select: [ :chg | chg isRemoval and: [ chg entity isAnnotationInstance ] ]