"
A TFAMIXAnnotationInstanceAttribute is  a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAnnotationInstanceAttribute,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstanceAttribute classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttribute [
	^ self annotationTypeAttributeOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> annotationTypeAttributeOR: aVersion [
	^ self privateAnnotationTypeAttribute versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> famixClass [
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstance [
	^ self parentAnnotationInstanceOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> parentAnnotationInstanceOR: aVersion [
	^ self privateParentAnnotationInstance versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> value [
	^ self valueOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstanceAttribute >> valueOR: aVersion [
	^ self privateValue versionIn: aVersion
]
