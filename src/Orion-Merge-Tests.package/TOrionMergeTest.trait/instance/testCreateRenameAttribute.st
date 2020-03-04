tests-create
testCreateRenameAttribute
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1') name: 'toto'.
	self diff.
	"self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createRenameAttribute."
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.toto') isNotNil.