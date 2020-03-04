running
setUp
	| model1 model2 |
	model1 := MooseModel new.
	model1 importFromMSEStream: self wholeMSE readStream.
	model1 name: 'base01'.
	model2 := MooseModel new.
	model2 importFromMSEStream: self wholeMSE readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff baseModel: model1 convertToOrion targetModel: model2 diffTransformers: {OrionMerge}