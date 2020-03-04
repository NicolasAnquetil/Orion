tests-create
testCreateRemoveMethod
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.b3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.b3()') isNil