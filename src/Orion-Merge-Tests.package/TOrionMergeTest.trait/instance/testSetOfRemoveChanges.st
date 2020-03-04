tests-set
testSetOfRemoveChanges
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRemoveChanges isNotNil.
	self assert: self modelMerger result setOfRemoveChanges size equals: (self diff count: [ :e | e isRemoval ])