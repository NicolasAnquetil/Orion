"
A ORReference is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORReference,
	#superclass : #FAMIXReference,
	#traits : 'TFAMIXReference',
	#classTraits : 'TFAMIXReference classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORReference class >> isOrionClass [
	^ true
]
