tests-set
testSetOfRemoveAccessChanges
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new
		orionModel: self modelMerger baseModel;
		accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()');
		variable: var1;
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRemoveAccessChanges notNil.
	self
		assert: self modelMerger result setOfRemoveAccessChanges size
		equals: (self diff assocChanges count: [ :e | e isRemoval and: [ e entity isAccess ] ])