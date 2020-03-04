tests-create
testCreateRemoveAttribute
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'toto' inModel: self modelMerger baseModel.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.toto') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.toto') isNil.
