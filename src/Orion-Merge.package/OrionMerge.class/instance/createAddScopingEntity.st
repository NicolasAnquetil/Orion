private-run-migrated
createAddScopingEntity
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	(self sortAddScopingEntityChanges: self result setOfAddScopingEntityChanges) do: [ :chg | 
		chg entity isPackage
			ifTrue: [ self orionVersionedModel addPackageNamed: chg entityName].
		chg entity isNamespace
			ifTrue: [ self orionVersionedModel addNamespaceNamed: chg entity name inORNamespace: (self orionVersionedModel entityNamed: chg entity parentScope mooseName) ] ]