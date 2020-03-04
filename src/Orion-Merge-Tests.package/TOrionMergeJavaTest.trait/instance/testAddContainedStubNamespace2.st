tests
testAddContainedStubNamespace2
	"The parent namespace is not a stub and already exist in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope: (self modelMerger targetModel entityNamed: 'NamespaceTest') yourself.
	self modelMerger targetModel add: ns.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (self modelMerger baseModel entityNamed: 'NamespaceTest::Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Namespace2') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Namespace2') parentScope
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest')