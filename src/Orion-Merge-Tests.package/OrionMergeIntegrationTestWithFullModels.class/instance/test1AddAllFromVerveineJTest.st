tests
test1AddAllFromVerveineJTest
	"comment stating purpose of message"

	| mse |
	mse := self mseFromVerveineJTest.
	self addAllFromMseString: mse.
	self assert: modelMerger baseModel system orionModels size equals: 2