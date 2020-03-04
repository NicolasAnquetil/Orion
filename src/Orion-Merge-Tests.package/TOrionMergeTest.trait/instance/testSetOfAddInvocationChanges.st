tests-set
testSetOfAddInvocationChanges
	| meth |
	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXInvocation new
		sender: meth;
		receiver: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff');
		signature: 'c3'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddInvocationChanges isNotNil.
	self
		assert: self modelMerger result setOfAddInvocationChanges size
		equals: (self diff assocChanges count: [ :e | e isAddition and: [ e entity isInvocation ] ])