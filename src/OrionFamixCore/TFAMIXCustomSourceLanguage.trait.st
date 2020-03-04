"
A TFAMIXCustomSourceLanguage is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXCustomSourceLanguage,
	#traits : 'TFAMIXSourceLanguage',
	#classTraits : 'TFAMIXSourceLanguage classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXCustomSourceLanguage classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXCustomSourceLanguage >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXCustomSourceLanguage >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]
