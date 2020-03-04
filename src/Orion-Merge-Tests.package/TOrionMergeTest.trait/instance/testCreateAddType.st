tests-create
testCreateAddType
	self diff.
	self
		assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A2diff') isNil.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A2diff')
				notNil