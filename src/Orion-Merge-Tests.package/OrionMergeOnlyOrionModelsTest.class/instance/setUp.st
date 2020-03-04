running
setUp
	super setUp.
	model2 := model2 convertToOrion.
	self modelMerger: (FXDiff baseModel: model1 targetModel: model2 diffTransformers: {OrionMergeWithVisitor})