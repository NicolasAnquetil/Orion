private-run
createRemoveInvocation
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveInvocationChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	