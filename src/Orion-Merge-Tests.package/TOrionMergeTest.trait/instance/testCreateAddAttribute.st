tests-create
testCreateAddAttribute
	| diff |
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttributeNamed: 'attAdded' inModel: self modelMerger targetModel.
	diff := self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.attAdded') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.attAdded') isNotNil.