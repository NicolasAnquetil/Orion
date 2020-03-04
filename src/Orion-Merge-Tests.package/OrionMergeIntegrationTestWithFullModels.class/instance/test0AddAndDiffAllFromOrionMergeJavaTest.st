tests
test0AddAndDiffAllFromOrionMergeJavaTest
	| res |
	self addAllFromMseString: OrionMergeJavaTest wholeMSE.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	res := self diffFromScratch.
	self deny: res isEmpty.
	self assert: res size equals: 28.
	res do: [ :e | self assert: e isVersion ]