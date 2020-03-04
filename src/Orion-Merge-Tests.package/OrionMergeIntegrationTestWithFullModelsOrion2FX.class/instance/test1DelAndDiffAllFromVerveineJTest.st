adding
test1DelAndDiffAllFromVerveineJTest
	| res |
	self delAllFromMseString: self mseFromVerveineJTest.
	res := modelMerger result.
	self assert: res size equals: 781.
	res do: [ :e | self assert: e isRemoval ]