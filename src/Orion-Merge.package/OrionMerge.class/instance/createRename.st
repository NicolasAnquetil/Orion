private-run
createRename
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfRenameChanges do: [ :chg | chg entity rename: chg targetEntity name inModel: self orionVersionedModel ]