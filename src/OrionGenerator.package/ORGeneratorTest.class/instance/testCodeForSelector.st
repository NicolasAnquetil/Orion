tests
testCodeForSelector
	self
		assert: (aGenerator codeForSelector: self kindPropertyOfFAMIXTestClass)
		equals:
			'kind
	^ self kindOR: self currentContext'