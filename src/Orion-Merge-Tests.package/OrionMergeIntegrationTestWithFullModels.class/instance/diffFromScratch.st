tests
diffFromScratch
	| modelDiff |
	modelDiff := FXDiff
		baseModel: modelMerger baseModel system orionModels second
		targetModel: model2
		diffTransformers: {}.
	^ modelDiff run result