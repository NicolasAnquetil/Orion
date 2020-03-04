private-run
createRemoveReference
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveReferenceChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	