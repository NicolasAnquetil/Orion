Extension { #name : #FAMIXContainerEntity }

{ #category : #'*OrionFamixJava' }
FAMIXContainerEntity >> privateDefinedAnnotationTypes [
		^ self privateState attributeAt: #definedAnnotationTypes ifAbsentPut: [FMMultivalueLink on: self opposite: #container: ]
]

{ #category : #'*OrionFamixJava' }
FAMIXContainerEntity >> privateDefinedAnnotationTypes: aValue [
	self privateState attributeAt: #definedAnnotationTypes put: aValue
]
