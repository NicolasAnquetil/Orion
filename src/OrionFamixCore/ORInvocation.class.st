"
A ORInvocation is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORInvocation,
	#superclass : #FAMIXInvocation,
	#traits : 'TFAMIXInvocation',
	#classTraits : 'TFAMIXInvocation classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORInvocation class >> isOrionClass [
	^ true
]
