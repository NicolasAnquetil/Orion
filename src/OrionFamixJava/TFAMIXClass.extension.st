Extension { #name : #TFAMIXClass }

{ #category : #'*OrionFamixJava' }
TFAMIXClass >> exceptions [
	^ self exceptionsOR: self currentContext
]

{ #category : #'*OrionFamixJava' }
TFAMIXClass >> exceptionsOR: aVersion [
	^ self privateExceptions versionIn: aVersion
]
