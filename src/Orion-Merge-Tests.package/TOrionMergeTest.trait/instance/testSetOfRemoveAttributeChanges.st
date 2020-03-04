tests-set
testSetOfRemoveAttributeChanges
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'toto' inModel: self modelMerger baseModel.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: (self modelMerger result anySatisfy: [ :c | c isRemoval and: [ c entity name = 'toto' ] ]).
	self assert: self modelMerger result setOfRemoveAttributeChanges isNotNil.
	self assert: self modelMerger result setOfRemoveAttributeChanges size equals: (self diff count: [ :e | e isRemoval and: [ e entity isAttribute ] ])