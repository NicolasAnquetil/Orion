tests
testAddStubNamespace
	| ns stubNamespace |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	self modelMerger targetModel add: ns.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	stubNamespace := self modelMerger orionVersionedModel entityNamed: 'Namespace2'.
	self assert: stubNamespace isNotNil.
	self assert: stubNamespace isStub