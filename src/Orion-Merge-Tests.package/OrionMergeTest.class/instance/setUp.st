initialization
setUp
	model1 := self importModelNamed: 'base' fromPackages: #(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3').
	model1 := model1 convertToOrion.
	model1 install.	"required by convertToOrion, otherwise useless"
	model2 := self importModelNamed: 'target' fromPackages: #(#'Moose-TestResources-ModelDiff-P2' #'Moose-TestResources-ModelDiff-P3').
	self modelMerger: (FXDiff baseModel: model1 targetModel: model2 diffTransformers: {OrionMergeWithVisitor})