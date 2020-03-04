tests
testAddReference
	| cl meth ref changedReference |
	cl := self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()'.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	self modelMerger targetModel add: ref.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	changedReference := self modelMerger result setOfAddReferenceChanges first entity.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences isEmpty.
	self modelMerger orionVersionedModel addReferenceFrom: changedReference from to: changedReference to.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences isNotEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences first to
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')