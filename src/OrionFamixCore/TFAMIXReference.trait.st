"
A TFAMIXReference is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXReference,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXReference classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXReference >> source [
	^ self sourceOR: self currentContext
]

{ #category : #accessing }
TFAMIXReference >> sourceOR: aVersion [
	^ self privateSource versionIn: aVersion
]

{ #category : #accessing }
TFAMIXReference >> target [
	^ self targetOR: self currentContext
]

{ #category : #accessing }
TFAMIXReference >> targetOR: aVersion [
	^ self privateTarget versionIn: aVersion
]
