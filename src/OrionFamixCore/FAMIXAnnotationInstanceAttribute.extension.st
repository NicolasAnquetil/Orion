Extension { #name : #FAMIXAnnotationInstanceAttribute }

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstanceAttribute >> privateAnnotationTypeAttribute [
	^ annotationTypeAttribute
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstanceAttribute >> privateAnnotationTypeAttribute: aAnnotationTypeAttribute [
	 annotationTypeAttribute := aAnnotationTypeAttribute
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstanceAttribute >> privateParentAnnotationInstance [
	^ parentAnnotationInstance
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstanceAttribute >> privateParentAnnotationInstance: aAnnotationInstance [
	 parentAnnotationInstance := aAnnotationInstance
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstanceAttribute >> privateValue [
	^ value
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationInstanceAttribute >> privateValue: aString [
	 value := aString
]
