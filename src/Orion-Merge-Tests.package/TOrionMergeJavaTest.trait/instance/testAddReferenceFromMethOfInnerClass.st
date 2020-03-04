tests
testAddReferenceFromMethOfInnerClass
	| cl meth |
	cl := FAMIXClass new
		name: 'InnerClass';
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	self modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInInnerClass';
		name: 'methInInnerClass';
		parentType: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1::InnerClass');
		yourself.
	self modelMerger targetModel add: meth.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	self modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1') incomingReferences isEmpty