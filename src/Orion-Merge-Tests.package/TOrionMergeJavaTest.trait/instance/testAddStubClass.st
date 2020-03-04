tests
testAddStubClass
	| cl stubClass |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubClass: cl.
	self assert: (self modelMerger baseModel entityNamed: 'NamespaceTest::ClassTest') isNil.
	stubClass := self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ClassTest'.
	self assert: stubClass isNotNil.
	self assert: stubClass isStub.
	self
		assert: stubClass container
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest')