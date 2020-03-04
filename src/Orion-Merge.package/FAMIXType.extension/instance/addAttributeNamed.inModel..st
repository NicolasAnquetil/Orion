*Orion-Merge
addAttributeNamed: aName inModel: aModel
	| attrib |
	attrib := FAMIXAttribute named: aName.
	self addAttribute: attrib.
	aModel add: attrib