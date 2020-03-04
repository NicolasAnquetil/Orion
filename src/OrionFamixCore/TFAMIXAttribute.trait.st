"
A TFAMIXAttribute is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAttribute,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAttribute classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAttribute >> hasClassScope [
	^ self hasClassScopeOR: self currentContext
]

{ #category : #accessing }
TFAMIXAttribute >> hasClassScopeOR: aVersion [
	^ self privateHasClassScope versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAttribute >> parentType [
	^ self parentTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXAttribute >> parentTypeOR: aVersion [
	^ self privateParentType versionIn: aVersion
]
