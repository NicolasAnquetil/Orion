*Orion-Merge
setOfAddAnnotationTypeChanges
	^ self select: [ :chg | chg isAddition and: [ chg entity isAnnotationType ] ]