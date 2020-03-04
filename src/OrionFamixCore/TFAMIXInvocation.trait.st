"
A TFAMIXInvocation is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXInvocation,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXInvocation classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXInvocation >> candidates [
	^ self candidatesOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> candidatesOR: aVersion [
	^ self privateCandidates versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> receiver [
	^ self receiverOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> receiverOR: aVersion [
	^ self privateReceiver versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> receiverSourceCode [
	^ self receiverSourceCodeOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> receiverSourceCodeOR: aVersion [
	^ self privateReceiverSourceCode versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> sender [
	^ self senderOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> senderOR: aVersion [
	^ self privateSender versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInvocation >> signature [
	^ self signatureOR: self currentContext
]

{ #category : #accessing }
TFAMIXInvocation >> signatureOR: aVersion [
	^ self privateSignature versionIn: aVersion
]
