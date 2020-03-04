as yet unclassified
testCreateAddAccess
	| var2 access |
	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	access := FAMIXAccess new
		variable: var2;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	self modelMerger targetModel add: access.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses isEmpty.
	"self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddAccess."
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses size equals: 0.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses first accessor
		equals: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()')