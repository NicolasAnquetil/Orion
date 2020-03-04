private-run
createAddReference
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddReferenceChanges
		do: [ :chg | 
			chg entity to isStub
				ifTrue: [ self orionVersionedModel addReferenceFrom: chg entity from toStub: chg entity to ]
				ifFalse: [ self orionVersionedModel addReferenceFrom: chg entity from to: chg entity to ] ]