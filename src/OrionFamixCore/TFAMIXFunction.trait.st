"
A TFAMIXFunction is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXFunction,
	#traits : 'TFAMIXBehaviouralEntity',
	#classTraits : 'TFAMIXBehaviouralEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXFunction classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXFunction >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXFunction >> parentScope [
	^ self parentScopeOR: self currentContext
]

{ #category : #accessing }
TFAMIXFunction >> parentScopeOR: aVersion [
	^ self privateParentScope versionIn: aVersion
]
