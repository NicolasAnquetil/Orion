tests
testCodeForPrivateGetter
	self
		assert: (aGenerator codeForPrivateGetter: self kindPropertyOfFAMIXTestClass)
		equals:
			'privateKind
	^ kind'