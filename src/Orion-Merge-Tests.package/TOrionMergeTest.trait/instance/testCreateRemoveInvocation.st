tests-create
testCreateRemoveInvocation
	| var1 cand |
	var1 := self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.b3()'.
	cand := {(self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.c3()').
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()')}
		asOrderedCollection.
	ORActionAddInvocation new
		orionModel: self modelMerger baseModel;
		sender: var1;
		candidates: cand;
		run.
	self diff.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
				outgoingInvocations isNotEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.b3()') outgoingInvocations isEmpty