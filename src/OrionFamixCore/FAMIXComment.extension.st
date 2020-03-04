Extension { #name : #FAMIXComment }

{ #category : #'*OrionFamixCore-Class' }
FAMIXComment >> privateContainer [
	^ container
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXComment >> privateContainer: aSourcedEntity [
	 container := aSourcedEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXComment >> privateContent [
	^ content 
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXComment >> privateContent: anObject [
	 content := anObject
]
