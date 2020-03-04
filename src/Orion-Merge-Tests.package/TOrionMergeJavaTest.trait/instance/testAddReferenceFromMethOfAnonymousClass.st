tests
testAddReferenceFromMethOfAnonymousClass
	| cl meth |
	cl := FAMIXClass new
		name: 'AnonymousClass';
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()');
		yourself.
	self modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInAnonymousClass';
		name: 'methInAnonymousClass';
		parentType: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()::AnonymousClass');
		yourself.
	self modelMerger targetModel add: meth.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1') incomingReferences isEmpty