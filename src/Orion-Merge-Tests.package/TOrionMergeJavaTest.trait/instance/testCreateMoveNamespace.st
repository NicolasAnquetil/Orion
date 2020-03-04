tests
testCreateMoveNamespace
	(self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (self modelMerger targetModel entityNamed: 'java').
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createMoveNamespace.
	self
		assert: (self modelMerger baseModel entityNamed: 'NamespaceTest::ContainedNamespace') parentScope name
		equals: 'NamespaceTest'.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'java::ContainedNamespace') parentScope name
		equals: 'java'