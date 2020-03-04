tests-set
testSetOfMoveMethodChanges
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()')
		parentType: (self modelMerger targetModel entityNamed: 'Smalltalk::A2diff').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveMethodChanges notNil.
	self
		assert: self modelMerger result setOfMoveMethodChanges size
		equals: (self diff count: [ :e | e isMove and: [ e entity isBehaviouralEntity ] ]).
	self assert: (self modelMerger result setOfMoveMethodChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff.c3()' ]) isNotEmpty