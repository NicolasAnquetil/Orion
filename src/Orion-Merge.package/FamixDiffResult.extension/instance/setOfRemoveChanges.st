*Orion-Merge
setOfRemoveChanges
	"select the FamixChanges of the dictionnary according to their type"

	^ self select: [ :chg | chg isRemoval ]