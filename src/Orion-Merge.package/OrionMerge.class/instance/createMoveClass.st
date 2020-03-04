private-run
createMoveClass
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"
	self result setOfMoveClassChanges do: [ :chg | chg targetEntity parentPackage ifNil: [ chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity belongsTo mooseName)) inModel: self orionVersionedModel ] ifNotNil: [chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity parentPackage mooseName)) inModel: self orionVersionedModel] ]