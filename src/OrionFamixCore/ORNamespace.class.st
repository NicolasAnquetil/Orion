"
A ORNamespace is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORNamespace,
	#superclass : #FAMIXNamespace,
	#traits : 'TFAMIXNamespace',
	#classTraits : 'TFAMIXNamespace classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORNamespace class >> isOrionClass [
	^ true
]
