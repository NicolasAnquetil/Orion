tests
testAddReferenceToStubClass
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences isEmpty.
	self modelMerger orionVersionedModel
		addReferenceFrom: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()')
		toStub: cl.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences notEmpty