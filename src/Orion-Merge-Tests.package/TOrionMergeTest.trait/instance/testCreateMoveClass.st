tests-create
testCreateMoveClass
	"moving A3 into P2"

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff')
		parentPackage:
			(self modelMerger targetModel
				entityNamed: 'Moose-TestResources-ModelDiff-P2').
	self diff.
	self
		assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') notNil.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff')
				parentPackage name
		equals: 'Moose-TestResources-ModelDiff-P3'.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff')
				notNil.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff')
				parentPackage name
		equals: 'Moose-TestResources-ModelDiff-P2'