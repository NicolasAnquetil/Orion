Extension { #name : #FAMIXAnnotationInstance }

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstance >> privateAnnotatedEntity [
	^ annotatedEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstance >> privateAnnotatedEntity: aNamedEntity [
	 annotatedEntity := aNamedEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstance >> privateAnnotationType [
	^ annotationType
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstance >> privateAnnotationType: aAnnotationType [
	 annotationType := aAnnotationType
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstance >> privateAttributes [
	^ attributes
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstance >> privateAttributes: aAnnotationInstanceAttribute [
	 attributes := aAnnotationInstanceAttribute
]
