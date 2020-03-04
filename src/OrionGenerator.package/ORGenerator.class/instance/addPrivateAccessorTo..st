creating method
addPrivateAccessorTo: aFamixClass
	"add private accessors corresponding to the non heritated properties and relations of the Famix Class to it "

	(self getPropertiesOf: aFamixClass)
		do: [ :prop | self addThePrivateAccessorOf: prop to: aFamixClass ].
	(self getExtendedPropertiesOf: aFamixClass)
		do: [ :prop | self addExtendedPrivateAccessorsOf: prop to: aFamixClass ]