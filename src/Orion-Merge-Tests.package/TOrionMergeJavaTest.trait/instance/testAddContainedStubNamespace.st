tests
testAddContainedStubNamespace
	"The parent namespace is a stub and does not already exist in the model"

	| ns nsc |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true; 
		yourself.
	self modelMerger targetModel add: ns.
	nsc := FAMIXNamespace new
		name: 'NamespaceCont2';
		isStub: true;
		parentScope: ns;
		yourself.
	self modelMerger targetModel add: nsc.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: nsc.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') isStub.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2::NamespaceCont2') isNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') parentScope
		equals: (self modelMerger orionVersionedModel entityNamed: 'Namespace2')