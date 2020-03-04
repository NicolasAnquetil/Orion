Extension { #name : #TFAMIXMethod }

{ #category : #'*OrionFamixJava' }
TFAMIXMethod >> caughtExceptions [
	^ self caughtExceptionsOR: self currentContext
]

{ #category : #'*OrionFamixJava' }
TFAMIXMethod >> caughtExceptionsOR: aVersion [
	^ self privateCaughtExceptions versionIn: aVersion
]

{ #category : #'*OrionFamixJava' }
TFAMIXMethod >> declaredExceptions [
	^ self declaredExceptionsOR: self currentContext
]

{ #category : #'*OrionFamixJava' }
TFAMIXMethod >> declaredExceptionsOR: aVersion [
	^ self privateDeclaredExceptions versionIn: aVersion
]

{ #category : #'*OrionFamixJava' }
TFAMIXMethod >> thrownExceptions [
	^ self thrownExceptionsOR: self currentContext
]

{ #category : #'*OrionFamixJava' }
TFAMIXMethod >> thrownExceptionsOR: aVersion [
	^ self privateThrownExceptions versionIn: aVersion
]
