tests-expected failures
testSetOfRenameMethodChanges
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRenameMethodChanges notNil.
	self assert: self modelMerger result setOfRenameMethodChanges size equals: (self diff count: [ :e | e isRemoval and: [ e entity isMethod ] ]).
	self assert: (self modelMerger result setOfRenameMethodChanges collect: [ :e | e entity name = 'c3' ]) isNotNil.
	self assert: (self modelMerger result setOfRenameMethodChanges collect: [ :e | e targetEntity name = 'd3()' ]) isNotNil