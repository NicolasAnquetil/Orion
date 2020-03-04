tests
testCodeForPrivateSetter
	self
		assert: (aGenerator codeForPrivateSetter: self kindPropertyOfFAMIXTestClass)
		equals:
			'privateKind: aString
	kind := aString'