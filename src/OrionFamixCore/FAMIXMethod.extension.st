Extension { #name : #FAMIXMethod }

{ #category : #'*OrionFamixCore-Class' }
FAMIXMethod >> privateHasClassScope [
	^ hasClassScope
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXMethod >> privateHasClassScope: aBoolean [
	hasClassScope := aBoolean
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXMethod >> privateKind [
	^ kind
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXMethod >> privateKind: aString [
	 kind := aString
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXMethod >> privateParentType [
	^ parentType
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXMethod >> privateParentType: aType [
	 parentType := aType
]
