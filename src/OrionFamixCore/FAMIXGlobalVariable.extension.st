Extension { #name : #FAMIXGlobalVariable }

{ #category : #'*OrionFamixCore-Class' }
FAMIXGlobalVariable >> privateParentScope [
	^ parentScope
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXGlobalVariable >> privateParentScope: aFunction [
	 parentScope := aFunction
]
