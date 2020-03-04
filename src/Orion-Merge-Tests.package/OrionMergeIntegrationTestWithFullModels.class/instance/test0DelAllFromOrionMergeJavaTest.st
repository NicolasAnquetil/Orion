tests
test0DelAllFromOrionMergeJavaTest
	"comment stating purpose of message"

	| mse |
	mse := OrionMergeJavaTest wholeMSE.
	self delAllFromMseString: mse.
	self assert: modelMerger baseModel system orionModels size equals: 2