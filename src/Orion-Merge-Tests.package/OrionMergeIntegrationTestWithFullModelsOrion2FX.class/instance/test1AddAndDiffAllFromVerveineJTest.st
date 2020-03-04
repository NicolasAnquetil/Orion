adding
test1AddAndDiffAllFromVerveineJTest
	| res numberOfEntities |
	self addAllFromMseString: self mseFromVerveineJTest.
	res := modelMerger result.
	numberOfEntities := modelMerger targetModel size.
	self deny: res isEmpty.
	self assert: res numberOfEntities equals: 781.
	res do: [ :e | self assert: e isAddition ]