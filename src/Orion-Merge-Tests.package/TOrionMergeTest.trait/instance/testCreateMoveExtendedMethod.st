tests-create
testCreateMoveExtendedMethod
	| orAction meth extendedMeth |
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') addMethodNamed: 'extendedMeth' inModel: self modelMerger baseModel.
	extendedMeth := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.extendedMeth'.
	orAction := ORActionMoveMethod new
		orionModel: self modelMerger baseModel;
		entity: extendedMeth;
		parentPackage: (self modelMerger baseModel entityNamed: #'Moose-TestResources-ModelDiff-P4').
	orAction run.
	self assert: extendedMeth isNotNil.
	self assert: extendedMeth parentPackage mooseName equals: 'Moose-TestResources-ModelDiff-P4'.
	extendedMeth addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::A3diff.att2' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::B3diff.att1' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::B3diff.att2' inModel: self modelMerger baseModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethodNamed: 'extendedMeth' inModel: self modelMerger targetModel.
	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.extendedMeth'.
	meth addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::A3diff.att2' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::B3diff.att1' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::B3diff.att2' inModel: self modelMerger targetModel.
	meth parentPackage: (self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P2').
	"	Halt now."
	self diff.
	"self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddScopingEntity.
	self mooseModelMerge createAddType.
	self mooseModelMerge createAddMethod.
	self mooseModelMerge createMoveMethod."
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.extendedMeth()') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.extendedMeth()') parentPackage mooseName
		equals: 'Moose-TestResources-ModelDiff-P2'