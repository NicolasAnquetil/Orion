Extension { #name : #TFAMIXType }

{ #category : #'*OrionFamixJava' }
TFAMIXType >> argumentsInParameterizedTypes [
	^ self argumentsInParameterizedTypesOR: self currentContext
]

{ #category : #'*OrionFamixJava' }
TFAMIXType >> argumentsInParameterizedTypesOR: aVersion [
	^ self privateArgumentsInParameterizedTypes versionIn: aVersion
]
