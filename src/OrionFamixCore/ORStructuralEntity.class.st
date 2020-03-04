"
A ORStructuralEntity is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORStructuralEntity,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'TFAMIXStructuralEntity',
	#classTraits : 'TFAMIXStructuralEntity classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORStructuralEntity class >> isOrionClass [
	^ true
]
