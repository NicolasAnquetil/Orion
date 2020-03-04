Extension { #name : #FAMIXStructuralEntity }

{ #category : #'*OrionFamixCore-Class' }
FAMIXStructuralEntity >> privateDeclaredType [
	^ declaredType
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXStructuralEntity >> privateDeclaredType: aType [
	 declaredType := aType
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXStructuralEntity >> privateIncomingAccesses [
	^ incomingAccesses
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXStructuralEntity >> privateIncomingAccesses: aAccess [
	 incomingAccesses := aAccess
]
