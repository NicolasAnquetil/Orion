*Orion-Merge
setOfAddInheritanceChanges
	^ self select: [ :chg | chg isAddition and: [ chg entity isInheritance ] ]