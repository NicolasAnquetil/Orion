Extension { #name : #FAMIXParameterizableClass }

{ #category : #'*OrionFamixJava-Class' }
FAMIXParameterizableClass >> getFamixClass [
	^ FAMIXClass
]

{ #category : #'*OrionFamixJava-Class' }
FAMIXParameterizableClass >> privateParameterizedTypes [
	^ parameterizedTypes
]

{ #category : #'*OrionFamixJava-Class' }
FAMIXParameterizableClass >> privateParameterizedTypes: aParameterizedType [
	 parameterizedTypes := aParameterizedType
]
