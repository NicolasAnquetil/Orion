tests
testAddInheritance
	| c1 c2 inh |
	c1 := self modelMerger targetModel entityNamed: 'NamespaceTest::Class1'.
	c2 := self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	inh := FAMIXInheritance new
		superclass: c1;
		subclass: c2;
		yourself.
	self modelMerger targetModel add: inh.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddInheritance.
	self modelMerger orionVersionedModel
		addInheritanceFrom: self modelMerger result setOfAddInheritanceChanges first entity from
		to: self modelMerger result setOfAddInheritanceChanges first entity to.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
				superInheritances notEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1') subInheritances notEmpty