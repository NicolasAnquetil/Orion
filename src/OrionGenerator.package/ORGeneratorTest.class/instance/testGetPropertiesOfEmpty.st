tests
testGetPropertiesOfEmpty

	self assert: (aGenerator getPropertiesOf: Object) size  equals: 0
