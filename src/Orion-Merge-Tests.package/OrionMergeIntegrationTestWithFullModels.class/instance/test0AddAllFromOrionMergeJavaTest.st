tests
test0AddAllFromOrionMergeJavaTest
	"comment stating purpose of message"

	| mse |
	mse := OrionMergeJavaTest wholeMSE.
	self addAllFromMseString: mse.
	self assert: modelMerger baseModel system orionModels size equals: 2