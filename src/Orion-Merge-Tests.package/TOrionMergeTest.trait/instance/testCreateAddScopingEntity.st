tests-create
testCreateAddScopingEntity
	self diff.
	self
		assert:
			(self modelMerger baseModel
				entityNamed: 'Moose-TestResources-ModelDiff-P2') isNil.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Moose-TestResources-ModelDiff-P2') notNil