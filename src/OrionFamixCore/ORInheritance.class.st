"
A ORInheritance is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORInheritance,
	#superclass : #FAMIXInheritance,
	#traits : 'TFAMIXInheritance',
	#classTraits : 'TFAMIXInheritance classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORInheritance class >> isOrionClass [
	^ true
]
