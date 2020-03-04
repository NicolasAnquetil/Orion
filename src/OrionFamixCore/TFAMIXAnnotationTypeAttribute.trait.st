"
A TFAMIXAnnotationTypeAttribute is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAnnotationTypeAttribute,
	#traits : 'TFAMIXAttribute',
	#classTraits : 'TFAMIXAttribute classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAnnotationTypeAttribute classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAnnotationTypeAttribute >> annotationAttributeInstances [
	^ self annotationAttributeInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXAnnotationTypeAttribute >> annotationAttributeInstancesOR: aVersion [
	^ self privateAnnotationAttributeInstances versionIn: aVersion
]
