tests
delAllFromMseString: mse
	| model1 |
	model1 := MooseModel new.
	model1 importFromMSEStream: mse readStream.
	model1 name: 'base01'.
	model2 := MooseModel new.
	model2 name: 'baseEmpty'.
	modelMerger := FXDiff
		baseModel: model1 convertToOrion
		targetModel: model2
		diffTransformers:
			{FamixDiffChangesSorter.
			OrionMergeWithVisitor}.
	modelMerger run