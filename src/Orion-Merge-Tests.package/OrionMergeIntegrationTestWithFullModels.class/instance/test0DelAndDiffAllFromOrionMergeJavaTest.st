tests
test0DelAndDiffAllFromOrionMergeJavaTest
	| res |
	self delAllFromMseString: OrionMergeJavaTest wholeMSE.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	res := self diffFromScratch.
	self assert: res isEmpty