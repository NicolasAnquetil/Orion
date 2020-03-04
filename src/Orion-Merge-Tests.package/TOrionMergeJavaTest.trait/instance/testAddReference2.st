tests
testAddReference2
	| cl meth ref |
	cl := self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := FAMIXMethod new
		signature: 'methAdded()';
		name: 'methAdded';
		parentType: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	self modelMerger targetModel add: meth.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	self modelMerger targetModel add: ref.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()')
				outgoingReferences isEmpty.
	self modelMerger orionVersionedModel
		addReferenceFrom: self modelMerger result setOfAddReferenceChanges first entity from
		to: self modelMerger result setOfAddReferenceChanges first entity to.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()')
				outgoingReferences notEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()')
				outgoingReferences first to
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')