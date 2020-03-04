"
A TFAMIXStructuralEntity is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXStructuralEntity,
	#traits : 'TFAMIXLeafEntity',
	#classTraits : 'TFAMIXLeafEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXStructuralEntity classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXStructuralEntity >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXStructuralEntity >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXStructuralEntity >> incomingAccesses [
	^ self incomingAccessesOR: self currentContext
]

{ #category : #accessing }
TFAMIXStructuralEntity >> incomingAccessesOR: aVersion [
	^ self privateIncomingAccesses versionIn: aVersion
]
