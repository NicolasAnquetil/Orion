tests-set
testSetOfAddClassChanges
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddClassChanges isNotNil.
	self assert: self modelMerger result setOfAddClassChanges size equals: (self diff  count: [ :e | e isAddition and: [ e entity isType ] ])