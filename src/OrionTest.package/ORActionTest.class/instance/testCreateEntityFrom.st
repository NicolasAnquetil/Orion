testing OrionModel
testCreateEntityFrom
	| asS oldPackage newPackage |
	asS := self model system.
	orionModel := orionModel name: #AsM.
	oldPackage := orionModel
		entityNamed: #'Orion-TestModel-Constellation2'.
	self
		assert: (orionModel entityNamed: #'Orion-TestModel-Constellation2')
		equals: oldPackage.
	self assert: oldPackage mooseModel equals: self model.
	newPackage := orionModel createEntityFrom: oldPackage.
	self assert: oldPackage mooseModel equals: self model.
	self assert: newPackage mooseModel equals: orionModel.
	self
		assert: (orionModel entityNamed: #'Orion-TestModel-Constellation2')
		equals: newPackage.
	self
		assert: (asS sourceModel entityNamed: #'Orion-TestModel-Constellation2')
		equals: oldPackage.
	self assert: (orionModel contains: newPackage).
	self deny: (orionModel contains: oldPackage)