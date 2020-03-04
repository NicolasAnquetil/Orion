*Orion-Merge
addMethodNamed: aName inModel: aModel
	| meth |
	meth := FAMIXMethod named: aName.
	meth parentType: self.
	self addMethod: meth.
	aModel add: meth