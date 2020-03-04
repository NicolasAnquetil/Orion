tests-create
testAddAndDiffAllFromStModel
	<expectedFailure>
	| modelDiff res |
	self model1: MooseModel new.
	self model1 name: 'baseEmpty'.
	self modelMerger: (FXDiff baseModel: self model1 convertToOrion targetModel: self model2 diffTransformers: {OrionMergeWithVisitor}).
	self modelMerger run.
	self assert: self modelMerger baseModel system orionModels size equals: 2.
	modelDiff := FXDiff baseModel: self modelMerger baseModel system orionModels second targetModel: self model2 diffTransformers: {}.
	res := modelDiff run result.
	self assert: res isEmpty.
	