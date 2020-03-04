adding
addAllFromMseString: mse
	| model1 |
	model1 := MooseModel new.
	model1 name: 'baseEmpty'.
	model2 := MooseModel new.
	model2 importFromMSEStream: mse readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff baseModel: model1 targetModel: model2 convertToOrion.
	modelMerger run