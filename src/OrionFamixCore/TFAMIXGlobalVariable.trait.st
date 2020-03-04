"
A TFAMIXGlobalVariable is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXGlobalVariable,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXGlobalVariable classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXGlobalVariable >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #accessing }
TFAMIXGlobalVariable >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]
