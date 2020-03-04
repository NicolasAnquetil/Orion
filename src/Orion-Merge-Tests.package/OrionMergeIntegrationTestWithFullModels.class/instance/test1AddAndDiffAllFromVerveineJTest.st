tests
test1AddAndDiffAllFromVerveineJTest
	| res numberOfEntities |
	self addAllFromMseString: self mseFromVerveineJTest.
	self assert: modelMerger baseModel system orionModels size equals: 2.
	numberOfEntities := modelMerger baseModel system orionModels second numberOfEntities.
	self diffFromScratch.
	res := self diffFromScratch.
	self deny: res isEmpty.
	self assert: res numberOfEntities equals: numberOfEntities.
	res do: [ :e | self assert: e isVersion ]