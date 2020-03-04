Extension { #name : #FAMIXParameterizedType }

{ #category : #'*OrionFamixJava-Class' }
FAMIXParameterizedType >> privateArguments [
	^ arguments
]

{ #category : #'*OrionFamixJava-Class' }
FAMIXParameterizedType >> privateArguments: aType [
	arguments := aType
]

{ #category : #'*OrionFamixJava-Class' }
FAMIXParameterizedType >> privateParameterizableClass [
	^ parameterizableClass
]

{ #category : #'*OrionFamixJava-Class' }
FAMIXParameterizedType >> privateParameterizableClass: aParameterizableClass [
	parameterizableClass := aParameterizableClass
]
