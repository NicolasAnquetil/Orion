"
A ORMethod is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORMethod,
	#superclass : #FAMIXMethod,
	#traits : 'TFAMIXMethod',
	#classTraits : 'TFAMIXMethod classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORMethod class >> isOrionClass [
	^ true
]
