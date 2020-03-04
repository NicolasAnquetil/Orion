private-run
createAddInvocation
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result  setOfAddInvocationChanges
		do: [ :chg | |cand|
			(chg entity candidates isEmpty)
				ifFalse: [ 
					cand := OrderedCollection new.
					(chg entity candidates) do: [:e | cand add: (self orionVersionedModel entityNamed: (e mooseName))].
					(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationTo: (cand "retrouver les versions orion de ces éléments" ) 
						inModel: self orionVersionedModel ]
				ifTrue: [(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationTo: (self orionVersionedModel entityNamed: chg entity to mooseName) 
						receiver: (self orionVersionedModel entityNamed: chg entity receiver mooseName) 
						withSignature: chg entity signature 
						inModel: self orionVersionedModel   ] ]