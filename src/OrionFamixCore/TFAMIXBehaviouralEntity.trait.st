"
A TFAMIXBehaviouralEntity is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXBehaviouralEntity,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXBehaviouralEntity classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> accesses [
	^ self accessesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> accessesOR: aVersion [
	^ self privateAccesses versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> declaredType [
	^ self declaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> declaredTypeOR: aVersion [
	^ self privateDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> implicitVariables [
	^ self implicitVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> implicitVariablesOR: aVersion [
	^ self privateImplicitVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> incomingInvocations [
	^ self incomingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> incomingInvocationsOR: aVersion [
	^ self privateIncomingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> localVariables [
	^ self localVariablesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> localVariablesOR: aVersion [
	^ self privateLocalVariables versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingInvocations [
	^ self outgoingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingInvocationsOR: aVersion [
	^ self privateOutgoingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> parameters [
	^ self parametersOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> parametersOR: aVersion [
	^ self privateParameters versionIn: aVersion
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
TFAMIXBehaviouralEntity >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]
