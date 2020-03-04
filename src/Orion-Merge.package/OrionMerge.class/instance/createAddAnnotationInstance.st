private-run
createAddAnnotationInstance
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddAnnotationInstanceChanges
		do: [ :chg | 
			(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
				addAnnotationInstanceOfType: chg entityName
				inModel: self orionVersionedModel ]