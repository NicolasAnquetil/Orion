"
A ORLocalVariable is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORLocalVariable,
	#superclass : #FAMIXLocalVariable,
	#traits : 'TFAMIXLocalVariable',
	#classTraits : 'TFAMIXLocalVariable classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORLocalVariable class >> isOrionClass [
	^ true
]
