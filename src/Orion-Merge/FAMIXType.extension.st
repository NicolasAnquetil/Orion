Extension { #name : #FAMIXType }

{ #category : #'*Orion-Merge' }
FAMIXType >> addAttributeNamed: aName inModel: aModel [
	| attrib |
	attrib := FAMIXAttribute named: aName.
	self addAttribute: attrib.
	aModel add: attrib
]

{ #category : #'*Orion-Merge' }
FAMIXType >> addMethodNamed: aName inModel: aModel [
	| meth |
	meth := FAMIXMethod named: aName.
	meth parentType: self.
	self addMethod: meth.
	aModel add: meth
]
