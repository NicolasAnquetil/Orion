*OrionFamixJava
addInheritanceFrom: subclass to: superclass
	^ (self entityNamed: subclass mooseName) addInheritanceTo: (self entityNamed: superclass mooseName) inModel: self