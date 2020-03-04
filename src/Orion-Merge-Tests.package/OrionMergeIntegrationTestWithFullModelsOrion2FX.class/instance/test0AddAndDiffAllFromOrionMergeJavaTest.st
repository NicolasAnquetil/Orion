adding
test0AddAndDiffAllFromOrionMergeJavaTest
	| res |
	self addAllFromMseString: OrionMergeJavaTest wholeMSE.
	res := modelMerger result.
	self deny: res isEmpty.
	self assert: res size equals: 28 + 1.	"Inheritance link"
	res do: [ :e | self assert: e isAddition ]