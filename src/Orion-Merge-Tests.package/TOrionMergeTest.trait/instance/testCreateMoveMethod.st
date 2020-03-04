tests-create
testCreateMoveMethod

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') parentType: (self modelMerger  targetModel entityNamed: 'Smalltalk::C3diff').

	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self diff.
	"self mooseModelMerge createMoveMethod."
	
	
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3diff.c3') isNotNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') belongsTo mooseName equals:  'Smalltalk::A3diff'.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3diff.c3()') belongsTo mooseName equals:  'Smalltalk::C3diff'.
	self assert: self modelMerger orionVersionedModel changes size equals: 1.

	

	