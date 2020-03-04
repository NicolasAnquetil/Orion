tests-create
testCreateRemoveAccess
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new
		orionModel: self modelMerger baseModel;
		accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()');
		variable: var1;
		run.
		self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses notEmpty.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses isEmpty