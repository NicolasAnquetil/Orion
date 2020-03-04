private-run
createRemoveAttribute
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveAttributeChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	