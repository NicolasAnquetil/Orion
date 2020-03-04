"
A TFAMIXScopingEntity is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXScopingEntity,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXScopingEntity classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXScopingEntity >> childScopes [
	^ self childScopesOR: self currentContext
]

{ #category : #accessing }
TFAMIXScopingEntity >> childScopesOR: aVersion [
	^ self privateChildScopes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXScopingEntity >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXScopingEntity >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXScopingEntity >> globalVariables [
	^ self globalVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXScopingEntity >> globalVariablesOR: aVersion [
	^ self privateGlobalVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXScopingEntity >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #accessing }
TFAMIXScopingEntity >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]
