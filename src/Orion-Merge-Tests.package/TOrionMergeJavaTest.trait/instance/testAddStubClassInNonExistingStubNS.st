tests
testAddStubClassInNonExistingStubNS
	| cl ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	self modelMerger targetModel add: ns.
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: ns;
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubClass: cl.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2::ClassTest') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest') container
		equals: (self modelMerger orionVersionedModel entityNamed: 'Namespace2')