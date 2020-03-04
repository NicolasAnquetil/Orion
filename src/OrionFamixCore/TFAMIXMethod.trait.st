"
A TFAMIXMethod is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXMethod,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXMethod classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXMethod >> hasClassScope [
	^ self hasClassScopeOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> hasClassScopeOR: aVersion [
	^ self privateHasClassScope versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> kind [
	^ self kindOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> kindOR: aVersion [
	^ self privateKind versionIn: aVersion
]

{ #category : #accessing }
TFAMIXMethod >> parentType [
	^ self parentTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXMethod >> parentTypeOR: aVersion [
	^ self privateParentType versionIn: aVersion
]
