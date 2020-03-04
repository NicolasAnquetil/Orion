*Orion-Merge
setOfAddInvocationChanges
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg entity isInvocation ] ]