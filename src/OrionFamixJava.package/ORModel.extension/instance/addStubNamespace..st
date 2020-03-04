*OrionFamixJava
addStubNamespace: aFAMIXNamespace
	^ aFAMIXNamespace parentScope
		ifNotNil: [ :parentScope | 
			(self entityNamed: parentScope mooseName) ifNil: [ self addStubNamespace: parentScope ].
			self
				addStubNamespaceNamed: aFAMIXNamespace name
				inORNamespace: (self entityNamed: parentScope mooseName) ]
		ifNil: [ self addStubNamespaceNamed: aFAMIXNamespace name ]