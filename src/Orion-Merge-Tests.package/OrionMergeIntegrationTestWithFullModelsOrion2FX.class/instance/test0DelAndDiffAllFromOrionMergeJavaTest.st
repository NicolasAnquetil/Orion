adding
test0DelAndDiffAllFromOrionMergeJavaTest
	| res |
	self delAllFromMseString: OrionMergeJavaTest wholeMSE.
	res := modelMerger result.
	self assert: res size equals: 29.
	res do: [ :e | self assert: e isRemoval ]