*Orion-Merge
setOfRenameAttributeChanges
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isRename and: [ chg entity isAttribute ] ]