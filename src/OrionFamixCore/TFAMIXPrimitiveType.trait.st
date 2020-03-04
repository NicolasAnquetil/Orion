"
A TFAMIXPrimitiveType is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXPrimitiveType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXPrimitiveType classSide >> isOrionClass [
	^ true
]
