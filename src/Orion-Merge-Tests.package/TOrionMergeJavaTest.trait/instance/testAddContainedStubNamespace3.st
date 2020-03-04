tests
testAddContainedStubNamespace3
	"The parent namespace is a stub and already exists in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope: (self modelMerger targetModel entityNamed: 'java') yourself.
	self modelMerger targetModel add: ns.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (self modelMerger baseModel entityNamed: 'java::Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'java::Namespace2') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'java::Namespace2') parentScope
		equals: (self modelMerger orionVersionedModel entityNamed: 'java')