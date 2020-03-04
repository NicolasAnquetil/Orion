"
A ORGlobalVariable is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORGlobalVariable,
	#superclass : #FAMIXGlobalVariable,
	#traits : 'TFAMIXGlobalVariable',
	#classTraits : 'TFAMIXGlobalVariable classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORGlobalVariable class >> isOrionClass [
	^ true
]
