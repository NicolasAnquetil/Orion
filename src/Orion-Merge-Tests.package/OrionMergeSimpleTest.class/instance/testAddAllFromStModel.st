tests-create
testAddAllFromStModel

	self model1: MooseModel new.
	self model1 name: 'baseEmpty'.
	modelMerger := FXDiff baseModel: self model1 convertToOrion targetModel: self model2 diffTransformers: {OrionMerge}.
	modelMerger run.
	self assert: modelMerger baseModel system orionModels size equals: 2