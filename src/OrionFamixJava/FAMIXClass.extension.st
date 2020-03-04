Extension { #name : #FAMIXClass }

{ #category : #'*OrionFamixJava' }
FAMIXClass >> privateExceptions [
		^ self privateState attributeAt: #exceptions ifAbsentPut: [ FMMultivalueLink on: self opposite: #exceptionClass: ]
]

{ #category : #'*OrionFamixJava' }
FAMIXClass >> privateExceptions: aValue [
	self halt.
	self privateState attributeAt: #exceptions put: aValue
]
