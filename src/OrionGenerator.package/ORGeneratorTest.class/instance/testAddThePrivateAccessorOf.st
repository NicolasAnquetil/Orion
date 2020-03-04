tests
testAddThePrivateAccessorOf
	| nbMeth |
	nbMeth := FAMIXTestClass methodDict size.
	aGenerator addThePrivateAccessorOf: self kindPropertyOfFAMIXTestClass  to: FAMIXTestClass.
	self assert: (FAMIXTestClass methodDict size = (nbMeth + 2) or: [ FAMIXTestClass methodDict size = nbMeth ]).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).
	self assert: (FAMIXTestClass methodDict at: #privateKind) protocol equals: '*OrionOrionGeneratorTestModel-Class'.
	self assert: (FAMIXTestClass methodDict at: #privateKind:) protocol equals: '*OrionOrionGeneratorTestModel-Class'