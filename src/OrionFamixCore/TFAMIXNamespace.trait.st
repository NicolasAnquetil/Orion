"
A TFAMIXNamespace is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXNamespace,
	#traits : 'TFAMIXScopingEntity',
	#classTraits : 'TFAMIXScopingEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXNamespace classSide >> isOrionClass [
	^ true
]
