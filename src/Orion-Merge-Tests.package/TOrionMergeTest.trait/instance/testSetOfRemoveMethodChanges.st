tests-set
testSetOfRemoveMethodChanges
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: (self modelMerger result anySatisfy: [ :c | c isRemoval and: [ c entity name = 'b3' ] ]).
	self assert: self modelMerger result setOfRemoveMethodChanges isNotNil.
	self assert: self modelMerger result setOfRemoveMethodChanges size equals: 1