private-run-migrated
createAddInheritance
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddInheritanceChanges
		do: [ :chg | 
			chg entity to isStub
				ifTrue: [ self orionVersionedModel addInheritanceFrom: chg entity from toStub: chg entity to ]
				ifFalse: [ self orionVersionedModel addInheritanceFrom: chg entity from to: chg entity to ] ]