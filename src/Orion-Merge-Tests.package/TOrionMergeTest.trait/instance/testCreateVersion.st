tests-create
testCreateVersion

	self diff.
	
	self assert: self modelMerger orionVersionedModel notNil.
	
	
	