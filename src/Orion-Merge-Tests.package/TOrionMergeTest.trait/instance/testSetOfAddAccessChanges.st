tests-set
testSetOfAddAccessChanges
	| var2 |
	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	FAMIXAccess new
		variable: var2;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAccessChanges isNotNil.
	self
		assert: self modelMerger result setOfAddAccessChanges size
		equals: (self diff assocChanges count: [ :e | e isAddition and: [ e entity isAccess ] ])