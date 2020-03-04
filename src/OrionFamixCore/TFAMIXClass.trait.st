"
A TFAMIXClass is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXClass,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXClass classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXClass >> isInterface [
	^ self isInterfaceOR: self currentContext
]

{ #category : #accessing }
TFAMIXClass >> isInterfaceOR: aVersion [
	^ self privateIsInterface versionIn: aVersion
]
