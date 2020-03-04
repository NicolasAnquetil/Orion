tests-expected failures
testCreateRenamePackage
	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'totoPackage') isNotNil.