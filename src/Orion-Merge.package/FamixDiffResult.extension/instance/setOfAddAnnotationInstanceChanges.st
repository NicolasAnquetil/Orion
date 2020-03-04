*Orion-Merge
setOfAddAnnotationInstanceChanges
	^ self select: [ :chg | chg isAddition and: [ chg entity isAnnotationInstance ] ]