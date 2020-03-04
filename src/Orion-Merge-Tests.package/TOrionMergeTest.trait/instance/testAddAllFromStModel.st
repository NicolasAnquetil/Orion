tests-create
testAddAllFromStModel

	self model1: MooseModel new.
	self model1 name: 'baseEmpty'.
	self modelMerger: (FXDiff baseModel: self model1 convertToOrion targetModel: self model2 diffTransformers: {OrionMergeWithVisitor}).
	self modelMerger run.
	self assert: self modelMerger baseModel system orionModels size equals: 2