private-run
createRenamePackage
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenamePackageChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]