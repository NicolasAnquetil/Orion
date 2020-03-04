*OrionFamixJava
addStubNamespaceNamed: aString inORNamespace: aNamespace
	^ aString
		ifNotNil:
			[ (ORActionAddNamespace new orionModel: self; parentScope: aNamespace; 
					isStub: true; name: aString) manualRun; postRun ]