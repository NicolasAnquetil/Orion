Extension { #name : #FAMIXAccess }

{ #category : #'*OrionFamixCore-Class' }
FAMIXAccess >> privateAccessor [
	^ accessor
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAccess >> privateAccessor: aBehaviouralEntity [
	 accessor := aBehaviouralEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAccess >> privateIsWrite [
	^ isWrite
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAccess >> privateIsWrite: aBoolean [
	 isWrite := aBoolean
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAccess >> privateVariable [
	^ variable
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAccess >> privateVariable: aStructuralEntity [
	 variable := aStructuralEntity
]
