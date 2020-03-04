adding
addClassNamed: aString isStub: aBoolean inModel: aModelVersion
	^ self
		addClassNamed: aString
		isStub: aBoolean
		withNamespace: aModelVersion allNamespaces first
		inModel: aModelVersion