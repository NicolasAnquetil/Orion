tests
testCreateClassNameNotFamix

	self assert: (aGenerator createClassName: MooseEntity ) equals: #ORMooseEntity.
	