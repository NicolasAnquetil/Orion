Extension { #name : #FAMIXNamedEntity }

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateAnnotationInstances [
	^ annotationInstances
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateAnnotationInstances: aAnnotationInstance [
	 annotationInstances := aAnnotationInstance
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateIsStub [
	^ isStub
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateIsStub: aBoolean [
	 isStub := aBoolean
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateModifiers [
	^ modifiers
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateModifiers: aString [
	 modifiers := aString
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateName [
	^ name
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateName: aString [
	 name := aString
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateParentPackage [
	^ parentPackage
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateParentPackage: aPackage [
	 parentPackage := aPackage
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateReceivingInvocations [
	^ receivingInvocations
]

{ #category : #'*OrionFamixCore-Class' }
FAMIXNamedEntity >> privateReceivingInvocations: aInvocation [
	 receivingInvocations := aInvocation
]
