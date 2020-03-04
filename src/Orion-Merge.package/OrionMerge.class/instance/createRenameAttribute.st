private-run
createRenameAttribute
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenameAttributeChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]