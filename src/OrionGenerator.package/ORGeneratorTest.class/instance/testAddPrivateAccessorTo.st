tests
testAddPrivateAccessorTo
	
	| nbMeth |

	
	nbMeth := FAMIXTestClass methodDict size.
	
	"self halt."
	aGenerator addPrivateAccessorTo: FAMIXTestClass. 
	self assert: (FAMIXTestClass methodDict size >= nbMeth ).
	self assert: (FAMIXTestClass methodDict includesKey:  #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).
	self assert: ((FAMIXTestClass methodDict at: #privateKind) protocol) equals: '*OrionOrionGeneratorTestModel-Class'. 
	
	