"
A TFAMIXSourceAnchor is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXSourceAnchor,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXSourceAnchor classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXSourceAnchor >> element [
	^ self elementOR: self currentContext
]

{ #category : #accessing }
TFAMIXSourceAnchor >> elementOR: aVersion [
	^ self privateElement versionIn: aVersion
]
