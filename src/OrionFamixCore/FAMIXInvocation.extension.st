Extension { #name : #FAMIXInvocation }

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateCandidates [
	^ candidates
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateCandidates: aBehaviouralEntity [
	 candidates := aBehaviouralEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateReceiver [
	^ receiver
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateReceiver: aNamedEntity [
	 receiver := aNamedEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateReceiverSourceCode [
	^ receiverSourceCode
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateReceiverSourceCode: aString [
	 receiverSourceCode := aString
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateSender [
	^ sender
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateSender: aBehaviouralEntity [
	 sender := aBehaviouralEntity
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateSignature [
	^ signature
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXInvocation >> privateSignature: aString [
	 signature := aString
]
