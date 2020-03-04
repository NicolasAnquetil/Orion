tests
testCodeForORSelector
	self
		assert: (aGenerator codeForORSelector: self kindPropertyOfFAMIXTestClass)
		equals:
			'kindOR: aVersion
	^ self privateKind versionIn: aVersion'