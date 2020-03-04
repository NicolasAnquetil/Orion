*OrionFamixJava
addStubClass: aFAMIXClass
	(self entityNamed: aFAMIXClass container mooseName) ifNil: [ self addStubNamespace: aFAMIXClass container ].
	^ ((self entityNamed: aFAMIXClass container mooseName) addStubClassNamed: aFAMIXClass name inModel: self) entity