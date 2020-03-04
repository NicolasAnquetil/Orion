Extension { #name : #FAMIXScopingEntity }

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> addAnnotationTypeNamed: aString inModel: aModelVersion [
	aString
		ifNotNil: [ (ORActionAddAnnotationType new orionModel: aModelVersion; 
					container: self; name: aString) manualRun; postRun ]
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateChildScopes [
	^ childScopes
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateChildScopes: aScopingEntity [
	 childScopes := aScopingEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateFunctions [
	^ functions
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateFunctions: aFunction [
	 functions := aFunction
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateGlobalVariables [
	^ globalVariables
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateGlobalVariables: aGlobalVariable [
	 globalVariables := aGlobalVariable
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateParentScope [
	^ parentScope
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXScopingEntity >> privateParentScope: aFunction [
	 parentScope := aFunction
]
