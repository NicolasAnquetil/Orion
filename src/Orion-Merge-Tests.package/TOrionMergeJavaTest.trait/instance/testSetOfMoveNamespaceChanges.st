tests
testSetOfMoveNamespaceChanges
	(self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (self modelMerger targetModel entityNamed: 'java').
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveNamespaceChanges notNil.
	self assert: self modelMerger result setOfMoveNamespaceChanges size equals: 1