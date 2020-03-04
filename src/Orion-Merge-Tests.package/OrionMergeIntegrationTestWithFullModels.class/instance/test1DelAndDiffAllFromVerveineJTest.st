tests
test1DelAndDiffAllFromVerveineJTest
	| res |
	self delAllFromMseString: self mseFromVerveineJTest.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	self diffFromScratch.
	res := self diffFromScratch.
	self assert: res isEmpty.