private-run
createRemoveMethod
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveMethodChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	