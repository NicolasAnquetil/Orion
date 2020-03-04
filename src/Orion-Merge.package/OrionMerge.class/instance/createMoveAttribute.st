private-run
createMoveAttribute
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfMoveAttributeChanges do: [ :chg | chg entity moveTo: 
		(self orionVersionedModel entityNamed:( chg targetEntity belongsTo mooseName) ) inModel: self orionVersionedModel ]