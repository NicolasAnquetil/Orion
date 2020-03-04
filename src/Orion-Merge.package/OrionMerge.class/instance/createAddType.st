private-run-migrated
createAddType
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"create class when it's not an inner class or anonymous class"

	"self changes
		do: [ :chg | 
			(chg isAddition and:[ chg isForType and: [ chg entity isInnerClass not and: [ chg entity isAnonymousClass not ] ]])
				ifTrue: [ "

	| entity descr changeAction |
	self result setOfAddClassChanges
		do: [ :chg | 
			entity := chg entity.
			descr := entity mooseDescription.
			changeAction := ('ORActionAdd' , descr name) asClass new.
			changeAction orionModel: self orionVersionedModel.
			descr allAttributesNotDerived do: [ :e | self setProperty: e from: entity to: changeAction ].
			changeAction manualRun; postRun ]