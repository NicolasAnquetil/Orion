tests-create
testCreateAddReference
	| meth |
	meth := self modelMerger targetModel
		entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXReference new
		source: meth;
		target: (self modelMerger targetModel entityNamed: 'Smalltalk::B2diff').
	self diff.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
				outgoingReferences size
		equals: 1.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences size
		equals: 2