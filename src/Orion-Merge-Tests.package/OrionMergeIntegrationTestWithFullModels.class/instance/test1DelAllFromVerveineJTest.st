tests
test1DelAllFromVerveineJTest
	"comment stating purpose of message"

	| mse |
	mse := self mseFromVerveineJTest.
	self delAllFromMseString: mse.
	self assert: modelMerger baseModel system orionModels size equals: 2