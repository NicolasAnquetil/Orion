"
A TFAMIXAnnotationInstance is  a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAnnotationInstance,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationInstance classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAnnotationInstance >> annotatedEntity [
	^ self annotatedEntityOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstance >> annotatedEntityOR: aVersion [
	^ self privateAnnotatedEntity versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstance >> annotationType [
	^ self annotationTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstance >> annotationTypeOR: aVersion [
	^ self privateAnnotationType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstance >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationInstance >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAnnotationInstance >> famixClass [
	^ super famixClass superclass
]
