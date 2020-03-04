"
A ORAttribute is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORAttribute,
	#superclass : #FAMIXAttribute,
	#traits : 'TFAMIXAttribute',
	#classTraits : 'TFAMIXAttribute classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAttribute class >> isOrionClass [
	^ true
]
