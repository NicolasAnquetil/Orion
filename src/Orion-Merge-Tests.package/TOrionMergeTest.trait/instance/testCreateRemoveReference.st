tests-create
testCreateRemoveReference
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()'.
	ORActionAddReference new
		orionModel: self modelMerger baseModel;
		source: var1;
		target: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff');
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	"self mooseModelMerge createAddScopingEntity.
	self mooseModelMerge createAddType.
	self mooseModelMerge createAddMethod.
	self mooseModelMerge createRemoveReference."
	self
		assert:
			((self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences select: [ :ref | ref target mooseID = (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') mooseID ])
				isNotEmpty.
	self
		assert:
			((self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences
				select: [ :ref | ref target mooseID = (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff') mooseID ]) isEmpty