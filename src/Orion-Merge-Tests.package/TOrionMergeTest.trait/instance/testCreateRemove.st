tests-create
testCreateRemove
	
	self diff.
	"self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self mooseModelMerge createRemove."
	
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.b3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.b3()') isNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff') isNil.

	