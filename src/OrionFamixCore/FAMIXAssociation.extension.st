Extension { #name : #FAMIXAssociation }

{ #category : #'*OrionFamixCore-Class' }
FAMIXAssociation >> privateNext [
	^ next
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAssociation >> privateNext: aAssociation [
	 next := aAssociation
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAssociation >> privatePrevious [
	^ previous
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXAssociation >> privatePrevious: aAssociation [
	 previous := aAssociation
]
