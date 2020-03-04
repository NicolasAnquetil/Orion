*Orion-Merge
setOfAddClassChanges
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	"Only the classes that are neither inner nor anonymous classes are considered"

	^ self select: [ :chg | chg isAddition and: [ chg entity isClass and: [ chg entity isInnerClass not and: [ chg entity isAnonymousClass not ] ] ] ]