accessing
currentContext
	^ attributes at: #currentContext ifAbsentPut: [ self model ]