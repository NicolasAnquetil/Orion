tests
testMergePackage

	| orionModel pckg1 pckg2 |
	self flag: #FIXME.
	self skip.
	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	pckg1 := orionModel entityNamed: 'Orion-TestModel-Constellation1'.	
	pckg2 := orionModel entityNamed: 'Orion-TestModel-Constellation2'.

	self assert: pckg1 childNamedEntities size equals: 5.
	self assert: pckg2 childNamedEntities size equals: 4.

	pckg1 mergePackage: pckg2  inModel: orionModel.

	self assert:  (orionModel entityNamed: 'Orion-TestModel-Constellation1')  equals: nil.
	"self assert:  (orionModel entityNamed: 'Orion-TestModel-Constellation2')  equals: nil.     DOESN'T WORK BECAUSE MATCHES Orion-TestModel-Constellation2Orion-TestModel-Constellation1"

	self deny:  (orionModel entityNamed: 'Orion-TestModel-Constellation2Orion-TestModel-Constellation1') isNil.
	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation2Orion-TestModel-Constellation1') childNamedEntities size equals: 9.

	self assert: orionModel changes size = 4. "(3 moveMethInPack and 1 merge Package"
