tests-set
testSetOfRemoveReferenceChanges
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()'.
	ORActionAddReference new
		orionModel: self modelMerger baseModel;
		source: var1;
		target: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff');
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRemoveReferenceChanges isNotNil.
	self assert: self modelMerger result setOfRemoveReferenceChanges size equals: (self diff assocChanges count: [ :e | e isRemoval and: [ e entity isReference ] ])