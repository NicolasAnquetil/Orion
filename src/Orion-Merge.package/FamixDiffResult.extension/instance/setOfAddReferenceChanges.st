*Orion-Merge
setOfAddReferenceChanges
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg entity isReference and: [ chg entity target isClass and: [ chg entity target isInnerClass not and: [ chg entity target isAnonymousClass not ] ] ] ] ]