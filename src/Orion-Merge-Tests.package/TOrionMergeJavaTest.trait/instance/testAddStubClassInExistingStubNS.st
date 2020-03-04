tests
testAddStubClassInExistingStubNS
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (self modelMerger targetModel entityNamed: 'java');
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubClass: cl.
	self assert: (self modelMerger baseModel entityNamed: 'java::ClassTest') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'java::ClassTest') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'java::ClassTest') container
		equals: (self modelMerger orionVersionedModel entityNamed: 'java')