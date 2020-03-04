"
A TFAMIXAnnotationType is  a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAnnotationType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAnnotationType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationType >> instances [
	^ self instancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationType >> instancesOR: aVersion [
	^ self privateInstances versionIn: aVersion
]
