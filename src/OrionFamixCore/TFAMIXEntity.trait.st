"
A TFAMIXEntity is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXEntity,
	#traits : 'TMooseEntity',
	#classTraits : 'TMooseEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXEntity classSide >> isOrionClass [
	^ true
]
