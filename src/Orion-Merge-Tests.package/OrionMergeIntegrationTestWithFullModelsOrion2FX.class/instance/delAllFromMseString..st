adding
delAllFromMseString: mse
	| model1 |
	model1 := MooseModel new.
	model1 importFromMSEStream: mse readStream.
	model1 name: 'base01'.
	model2 := MooseModel new.
	model2 name: 'baseEmpty'.
	modelMerger := FXDiff baseModel: model1 targetModel: model2 convertToOrion.
	modelMerger run