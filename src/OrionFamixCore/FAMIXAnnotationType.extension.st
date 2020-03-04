Extension { #name : #FAMIXAnnotationType }

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationType >> privateContainer [
	^ container
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationType >> privateContainer: aContainerEntity [
	 container := aContainerEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationType >> privateInstances [
	^ instances
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAnnotationType >> privateInstances: aAnnotationInstance [
	 instances := aAnnotationInstance
]
