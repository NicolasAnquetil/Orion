tests
testCreateTraitNameNotFamix

	self assert: (aGenerator createTraitName: MooseEntity ) equals: #TMooseEntity.
	