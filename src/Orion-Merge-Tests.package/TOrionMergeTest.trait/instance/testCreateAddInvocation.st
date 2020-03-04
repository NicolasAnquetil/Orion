tests-create
testCreateAddInvocation
	| meth |
	meth := self modelMerger targetModel
		entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXInvocation new
		sender: meth;
		receiver: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff');
		candidates:
			(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()')
				asOrderedCollection.
	self diff.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
				outgoingInvocations size
		equals: 1.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.b3()') outgoingInvocations size
		equals: 3