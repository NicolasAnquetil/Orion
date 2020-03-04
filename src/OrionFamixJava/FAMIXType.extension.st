Extension { #name : #FAMIXType }

{ #category : #'*OrionFamixJava' }
FAMIXType >> privateArgumentsInParameterizedTypes [
		^ self privateState attributeAt: #argumentsInParameterizedTypes ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #arguments ]
]

{ #category : #'*OrionFamixJava' }
FAMIXType >> privateArgumentsInParameterizedTypes: aValue [
	self privateState attributeAt: #argumentsInParameterizedTypes put: aValue
]
