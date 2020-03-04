Extension { #name : #TFAMIXContainerEntity }

{ #category : #'*OrionFamixJava' }
TFAMIXContainerEntity >> definedAnnotationTypes [
	^ self definedAnnotationTypesOR: self currentContext
]

{ #category : #'*OrionFamixJava' }
TFAMIXContainerEntity >> definedAnnotationTypesOR: aVersion [
	^ self privateDefinedAnnotationTypes versionIn: aVersion
]
